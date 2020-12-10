package com.example.rpms.service;

import java.util.Date;
import java.util.List;

import javassist.expr.NewArray;

//import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.example.rpms.constant.Constant;
import com.example.rpms.dao.DoctorDao;
import com.example.rpms.dao.NurseDao;
import com.example.rpms.dao.PatientDao;
import com.example.rpms.dao.SuperAdminDao;
import com.example.rpms.dao.UsersDao;
import com.example.rpms.domain.Authorities;
import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.EmailTemplateValue;
import com.example.rpms.domain.HcgOrgnization;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.SuperAdmin;
import com.example.rpms.domain.Users;
import com.example.rpms.emailTemplate.EmailTemplate;
import com.example.rpms.mailapi.MailApi;
import com.google.gson.Gson;

@Component
@Transactional
@SuppressWarnings({ "unchecked", "rawtypes" })
public class SuperAdminService {
	
	@Autowired
	private SuperAdminDao superAdminDao;
	
	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private NurseDao nurseDao;

	@Autowired
	private UsersDao usersDao;

	public Count dashboardCount(Integer adminID) {
		Count count = superAdminDao.dashboardCount(adminID);

		if (count == null) {
			count = new Count();
			return count;
		}

		return count;
	}

	public Message<SuperAdmin> getSuperAdminByID(Integer id) {
		Message<SuperAdmin> message = new Message<SuperAdmin>();

		try {
			SuperAdmin superAdmin = superAdminDao.getSuperAdminByID(id);
			if (superAdmin != null) {
				message.setObject(superAdmin);
			}

			message.setMessage("Super Admin Found");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("Super Admin Not Found");
		}
		return message;
	}

	public Message viewPersonDetails(String personID, Integer adminID) {
		if (personID.equals("hcgAdmin")) {
			Message message = new Message<>();
			message.setListentity(superAdminDao.getHCGAdmin(adminID));
			return message;
		} 
		else if (personID.equals("doctor")) {
			Message message = new Message<>();
			message.setListentity(superAdminDao.getAllDoctor(adminID));
			return message;
		} 
		else if (personID.equals("nurse")) {
			Message message = new Message<>();
			message.setListentity(superAdminDao.getAllNurse(adminID));
			return message;
		} 
		else if (personID.equals("patient")) {
			Message message = new Message<>();
			message.setListentity(superAdminDao.getAllPatient(adminID));
			return message;
		} 
		else {
			Message message = new Message<>();
			message.setMessage("There is some error occurred. So please check it carefully.");
			return message;
		}

	}

	public Message<HcgOrgnization> searchHCGAdmin(String hcgDetail,
			Integer adminID,String[] searchStatus) {
		Message<HcgOrgnization> message = new Message<HcgOrgnization>();

		List<HcgOrgnization> list = superAdminDao.searchHCGAdmin(hcgDetail, adminID,searchStatus); 

		if (list != null) {
			message.setListentity(list);
			return message;
		}

		message.setMessage("Details Not Found.");
		return message;
	}

	public Message<HcgOrgnization> createHCGAdmin(String hcgOrgnization,
			String client_url) {
		Message<HcgOrgnization> message = new Message<HcgOrgnization>();

		if (client_url == null) {
			return message;
		}

		HcgOrgnization createHcgOrgnization = new Gson().fromJson(hcgOrgnization, HcgOrgnization.class);
		createHcgOrgnization.setCreatedAT(new Date());
		createHcgOrgnization.setUpdatedAt(new Date());

		if (createHcgOrgnization.getEmailID() != null) {

			int res = (Integer) superAdminDao.create(createHcgOrgnization);

			if (res > 0) {

				String userID = Constant.randomString();
				String uniqueID = Constant.randomString();

				Users users = new Users();
				users.setUsername(createHcgOrgnization.getEmailID());
				users.setPassword(userID);
				users.setEnabled(true);
				users.setIsDeleted(0);
				users.setStatus(0);
				users.setHcgID(res);
				users.setCreatedAT(new Date());
				users.setUpdatedAT(new Date());
				users.setUniqueID(uniqueID);

				Authorities authorities = new Authorities();
				authorities.setUsername(createHcgOrgnization.getEmailID());
				authorities.setAuthority(Constant.hcgRole);
				authorities.setUsers(users);

				users.setAuthorities(authorities);

				boolean createUser = superAdminDao.createObject(users);

				if (createUser) {

					String Url = client_url
							+ "password/createPassword.html?username="
							+ createHcgOrgnization.getEmailID() + "&userID=" + uniqueID
							+ "&status=" + false;

					StringBuilder builder = new StringBuilder();
				

					EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
					emailTemplateValue.setUrl(Url);
					emailTemplateValue.setUsername(createHcgOrgnization.getFirstname()
							+ " " + createHcgOrgnization.getLastname());

					builder.append(new EmailTemplate().sendEmail(
							"registration.vm", emailTemplateValue));
					System.out.println(builder.toString());

					message.setMessage("HCG Admin has been created successfully.");

					MailApi mailApi = new MailApi();
					mailApi.mail("Confirmation Email", builder.toString(),
							createHcgOrgnization.getEmailID());

					message.setMessage("HCG Admin Registered successfully and the verification link has been sent to '"+createHcgOrgnization.getEmailID()+"' email address.");
					

					return message;
				}
			}
		}

		return message;
	}

	public boolean checkEmail(String email) {
		Users details = usersDao.getUserByUsername(email);

		if (details != null) {

			return false;
		} else {
			return true;
		}
	}

	public Message<HcgOrgnization> getHCGAdminByID(Integer id) {
		Message<HcgOrgnization> message = new Message<HcgOrgnization>();

		try {
			HcgOrgnization hcgOrgnization = superAdminDao.getHCGAdminByID(id);
			if (hcgOrgnization != null) {
				message.setObject(hcgOrgnization);
			}

			message.setMessage("HCG Admin Found");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("HCG Admin Not Found");
		}
		return message;
	}

	public Message<HcgOrgnization> updateHCGAdmin(String hcgOrgnization) {
		Message<HcgOrgnization> message = new Message<HcgOrgnization>();

		HcgOrgnization updateHcgOrgnization = new Gson().fromJson(hcgOrgnization, HcgOrgnization.class);

		if (updateHcgOrgnization.getId() != null) {

			HcgOrgnization oldHcgOrgnization = superAdminDao.getHCGAdminByID(updateHcgOrgnization.getId());

			if (updateHcgOrgnization.getEmailID().equals(oldHcgOrgnization.getEmailID())) {

				oldHcgOrgnization.setCellphone(updateHcgOrgnization.getCellphone());
				oldHcgOrgnization.setFirstname(updateHcgOrgnization.getFirstname());
				oldHcgOrgnization.setLastname(updateHcgOrgnization.getLastname());
				oldHcgOrgnization.setAdminID(updateHcgOrgnization.getAdminID());
				oldHcgOrgnization.setHomeaddress(updateHcgOrgnization.getHomeaddress());
				oldHcgOrgnization.setHomephone(updateHcgOrgnization.getHomephone());
				oldHcgOrgnization.setMailingAddress(updateHcgOrgnization.getMailingAddress());
				oldHcgOrgnization.setMiddlename(updateHcgOrgnization.getMiddlename());
				oldHcgOrgnization.setNickname(updateHcgOrgnization.getNickname());
				
				oldHcgOrgnization.setSex(updateHcgOrgnization.getSex());
				oldHcgOrgnization.setUpdatedAt(new Date());
				oldHcgOrgnization.setStatus(updateHcgOrgnization.getStatus());

				Users users = usersDao.getUserByID("hcgID",
						updateHcgOrgnization.getId());
				if (users != null) {
					users.setStatus(updateHcgOrgnization.getStatus());
					boolean b = usersDao.saveAndUpdate(users);
					System.out.println(b);
				}
				oldHcgOrgnization.setImage(updateHcgOrgnization.getImage());
				superAdminDao.update(oldHcgOrgnization);
				message.setMessage("HCG Admin has been updated successfully.");
				return message;
			}
			else{
				
				Users users = usersDao.getUserByUsername(updateHcgOrgnization.getEmailID());
				
				if(users!=null)
				{
					message.setMessage("This Email Address already used so Please enter another Email Address.");
					return message;
				}
				else{
					
					oldHcgOrgnization.setEmailID(updateHcgOrgnization.getEmailID());
					
					oldHcgOrgnization.setCellphone(updateHcgOrgnization.getCellphone());
					oldHcgOrgnization.setFirstname(updateHcgOrgnization.getFirstname());
					oldHcgOrgnization.setLastname(updateHcgOrgnization.getLastname());
					
					oldHcgOrgnization.setAdminID(updateHcgOrgnization.getAdminID());
					oldHcgOrgnization.setHomeaddress(updateHcgOrgnization.getHomeaddress());
					oldHcgOrgnization.setHomephone(updateHcgOrgnization.getHomephone());
					oldHcgOrgnization.setMailingAddress(updateHcgOrgnization.getMailingAddress());
					oldHcgOrgnization.setMiddlename(updateHcgOrgnization.getMiddlename());
					oldHcgOrgnization.setNickname(updateHcgOrgnization.getNickname());
					
					oldHcgOrgnization.setSex(updateHcgOrgnization.getSex());
					oldHcgOrgnization.setUpdatedAt(new Date());
					oldHcgOrgnization.setStatus(updateHcgOrgnization.getStatus());

					Users usersNew = usersDao.getUserByID("hcgID",
							updateHcgOrgnization.getId());
					
					if (usersNew != null) {
						
						usersNew.setStatus(updateHcgOrgnization.getStatus());
						boolean b1 = usersDao.saveAndUpdate(usersNew);
						System.out.println(b1);
						
						String userSql="update users set username='"+updateHcgOrgnization.getEmailID()+"' where username='"+usersNew.getUsername()+"';";
						String authSql="update authorities set username='"+updateHcgOrgnization.getEmailID()+"' where username='"+usersNew.getUsername()+"';";
						
						boolean b = usersDao.update(userSql,authSql);
						System.out.println(b);
						
						if(b)
						{
							
							StringBuilder builder = new StringBuilder();

							EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
							emailTemplateValue.setUsername(oldHcgOrgnization.getFirstname()
									+ " " + oldHcgOrgnization.getLastname());
							
							emailTemplateValue.setFirstEmail(usersNew.getUsername());
							emailTemplateValue.setSecondEmail(updateHcgOrgnization.getEmailID());

							builder.append(new EmailTemplate().sendEmail(
									"changedemail.vm", emailTemplateValue));
							System.out.println(builder.toString());

							MailApi mailApi = new MailApi();
							mailApi.mail("Email Changed", builder.toString(),
									usersNew.getUsername());
							
							System.out.println("email send.");
						}
					}
					oldHcgOrgnization.setImage(updateHcgOrgnization.getImage());
					superAdminDao.update(oldHcgOrgnization);
					message.setMessage("HCG Admin has been updated successfully.");
					return message;
					
				}
				
			}
		}
		message.setMessage("HCG Admin not updated.");
		return message;
	}
	public Message<SuperAdmin> updateSuperAdmin(String superadmin) {
		Message<SuperAdmin> message = new Message<SuperAdmin>();

		SuperAdmin updateSuperAdmin = new Gson().fromJson(superadmin, SuperAdmin.class);

		if (updateSuperAdmin.getId() != null) {

			SuperAdmin oldSuperAdmin = superAdminDao.getSuperAdminByID(updateSuperAdmin.getId());

			if (updateSuperAdmin.getEmailID().equals(oldSuperAdmin.getEmailID())) {

				oldSuperAdmin.setPhone(updateSuperAdmin.getPhone());
				oldSuperAdmin.setSuperAdminName(updateSuperAdmin.getSuperAdminName());
				oldSuperAdmin.setAddress(updateSuperAdmin.getAddress());
				oldSuperAdmin.setUpdatedAt(new Date());
				Users users = usersDao.getUserByID("adminID",
						updateSuperAdmin.getId());
				if (users != null) {
					boolean b = usersDao.saveAndUpdate(users);
					System.out.println(b);
				}
				oldSuperAdmin.setImage(updateSuperAdmin.getImage());
				superAdminDao.update(oldSuperAdmin);
				message.setMessage("Super Admin has been updated successfully.");
				return message;
			}
			else{
				
				Users users = usersDao.getUserByUsername(updateSuperAdmin.getEmailID());
				
				if(users!=null)
				{
					message.setMessage("This Email Address already used so Please enter another Email Address.");
					return message;
				}
				else{
					
					oldSuperAdmin.setEmailID(updateSuperAdmin.getEmailID());
					oldSuperAdmin.setPhone(updateSuperAdmin.getPhone());
					oldSuperAdmin.setSuperAdminName(updateSuperAdmin.getSuperAdminName());
					oldSuperAdmin.setAddress(updateSuperAdmin.getAddress());
					oldSuperAdmin.setUpdatedAt(new Date());
					
					Users usersNew = usersDao.getUserByID("adminID",
							updateSuperAdmin.getId());
					
					if (usersNew != null) {
						
						
						boolean b1 = usersDao.saveAndUpdate(usersNew);
						System.out.println(b1);
						
						String userSql="update users set username='"+updateSuperAdmin.getEmailID()+"' where username='"+usersNew.getUsername()+"';";
						String authSql="update authorities set username='"+updateSuperAdmin.getEmailID()+"' where username='"+usersNew.getUsername()+"';";
						
						boolean b = usersDao.update(userSql,authSql);
						System.out.println(b);
						
						if(b)
						{
							
							StringBuilder builder = new StringBuilder();

							EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
							emailTemplateValue.setUsername(oldSuperAdmin.getSuperAdminName());
							
							emailTemplateValue.setFirstEmail(usersNew.getUsername());
							emailTemplateValue.setSecondEmail(updateSuperAdmin.getEmailID());

							builder.append(new EmailTemplate().sendEmail(
									"changedemail.vm", emailTemplateValue));
							System.out.println(builder.toString());

							MailApi mailApi = new MailApi();
							mailApi.mail("Email Changed", builder.toString(),
									usersNew.getUsername());
							
							System.out.println("email sent.");
						}
					}
					oldSuperAdmin.setImage(updateSuperAdmin.getImage());
					superAdminDao.update(oldSuperAdmin);
					message.setMessage("Super Admin has been updated successfully.");
					return message;
					
				}
				
			}
		}
		message.setMessage("Super Admin not updated.");
		return message;
	}

	public Message<HcgOrgnization> getAllHCGAdminByID() {
		Message<HcgOrgnization> message=new Message<>();
		
		List<HcgOrgnization> list=superAdminDao.getAllHCGAdminByID();

		if(list!=null)
		{
			message.setListentity(list);
			return message;
		}
		
		
		return message;
	}
	
	public Message<Patient> createPatient(String patient, String client_url) {
		Message<Patient> message = new Message<Patient>();

		if (client_url == null) {
			return message;
		}

		Patient createPatient = new Gson().fromJson(patient, Patient.class);
		createPatient.setCreatedAt(new Date());
		createPatient.setUpdatedAt(new Date());

		System.out.println(createPatient.getImage());

		if (createPatient.getEmail() != null) {

			int res = (Integer) superAdminDao.create(createPatient);

			if (res > 0) {

				String userID = Constant.randomString();
				String uniqueID = Constant.randomString();

				Users users = new Users();
				users.setUsername(createPatient.getEmail());
				users.setPassword(userID);
				users.setEnabled(true);
				users.setIsDeleted(0);
				users.setStatus(0);
				users.setPatientID(res);
				users.setCreatedAT(new Date());
				users.setUpdatedAT(new Date());
				users.setUniqueID(uniqueID);

				Authorities authorities = new Authorities();
				authorities.setUsername(createPatient.getEmail());
				authorities.setAuthority(Constant.patientRole);
				authorities.setUsers(users);

				users.setAuthorities(authorities);

				boolean createUser = superAdminDao.createObject(users);

				if (createUser) {

					String Url = client_url
							+ "password/createPassword.html?username="
							+ createPatient.getEmail() + "&userID=" + uniqueID
							+ "&status=" + false;

					StringBuilder builder = new StringBuilder();
					// builder.append("<html><head><title>Confirmation Email</title></head><body>");
					// builder.append("<b>Please Click Here For Registration:-</b><br/>");
					// builder.append("<a href='" + Url + "'></a>");
					// builder.append("</body></html>");

					// builder.append("Thank you for registering with RPMS. Please follow the link below to activate your account:-");
					// builder.append(Url);
					// builder.append("Best Regards\n Remote Patient Monitoring System \n");
					//
					// System.out.println(builder.toString());

					EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
					emailTemplateValue.setUrl(Url);
					emailTemplateValue.setUsername(createPatient.getFirstname()
							+ " " + createPatient.getLastname());

					builder.append(new EmailTemplate().sendEmail(
							"registration.vm", emailTemplateValue));
					System.out.println(builder.toString());

					message.setMessage("Patient has been created successfully.");

					MailApi mailApi = new MailApi();
					mailApi.mail("Confirmation Email", builder.toString(),
							createPatient.getEmail());

					message.setMessage("Patient Registered successfully and the verification link has been sent to '"+createPatient.getEmail()+"' email address.");

					return message;
				}
			}
		}

		return message;

	}

	public Message<Doctor> createDoctor(String doctor, String client_url) {
		Message<Doctor> message = new Message<Doctor>();

		if (client_url == null) {
			return message;
		}

		Doctor createDoctor = new Gson().fromJson(doctor, Doctor.class);
		createDoctor.setCreatedAt(new Date());
		createDoctor.setUpdatedAt(new Date());

		if (createDoctor.getEmail() != null) {

			int res = (Integer) superAdminDao.create(createDoctor);

			if (res > 0) {

				String userID = Constant.randomString();
				String uniqueID = Constant.randomString();

				Users users = new Users();
				users.setUsername(createDoctor.getEmail());
				users.setPassword(userID);
				users.setEnabled(true);
				users.setIsDeleted(0);
				users.setStatus(0);
				users.setDocID(res);
				users.setCreatedAT(new Date());
				users.setUpdatedAT(new Date());
				users.setUniqueID(uniqueID);

				Authorities authorities = new Authorities();
				authorities.setUsername(createDoctor.getEmail());
				authorities.setAuthority(Constant.docRole);
				authorities.setUsers(users);

				users.setAuthorities(authorities);

				boolean createUser = superAdminDao.createObject(users);

				if (createUser) {

					String Url = client_url
							+ "password/createPassword.html?username="
							+ createDoctor.getEmail() + "&userID=" + uniqueID
							+ "&status=" + false;

					StringBuilder builder = new StringBuilder();
					// builder.append("<html><head><title>Confirmation Email</title></head><body>");
					// builder.append("<b>Please Click Here For Registration:-</b></br>");
					// builder.append("<a href='" + Url + "'></a>");
					// builder.append("</body></html>");

					// builder.append("Thank you for registering with RPMS. Please follow the link below to activate your account:-");
					// builder.append(Url);
					// builder.append("Best Regards\n Remote Patient Monitoring System \n");
					//
					// System.out.println(builder.toString());

					EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
					emailTemplateValue.setUrl(Url);
					emailTemplateValue.setUsername(createDoctor.getFirstname()
							+ " " + createDoctor.getLastname());

					builder.append(new EmailTemplate().sendEmail(
							"registration.vm", emailTemplateValue));
					System.out.println(builder.toString());

					message.setMessage("Doctor has been created successfully.");

					MailApi mailApi = new MailApi();
					mailApi.mail("Confirmation Email", builder.toString(),
							createDoctor.getEmail());

					message.setMessage("Doctor Registered successfully and the verification link has been sent to '"+createDoctor.getEmail()+"' email address.");

					return message;
				}
			}
		}

		return message;

	}

	public Message<Nurse> createNurse(String nurse, String client_url) {
		Message<Nurse> message = new Message<Nurse>();

		if (client_url == null) {
			return message;
		}

		Nurse createNurse = new Gson().fromJson(nurse, Nurse.class);
		createNurse.setCreatedAt(new Date());
		createNurse.setUpdatedAt(new Date());

		if (createNurse.getEmail() != null) {

			int res = (Integer) superAdminDao.create(createNurse);

			if (res > 0) {

				String userID = Constant.randomString();
				String uniqueID = Constant.randomString();

				Users users = new Users();
				users.setUsername(createNurse.getEmail());
				users.setPassword(userID);
				users.setEnabled(true);
				users.setIsDeleted(0);
				users.setStatus(0);
				users.setNurseID(res);
				users.setUniqueID(uniqueID);
				users.setCreatedAT(new Date());
				users.setUpdatedAT(new Date());
				//users.setUniqueID(uniqueID);

				Authorities authorities = new Authorities();
				authorities.setUsername(createNurse.getEmail());
				authorities.setAuthority(Constant.nurseRole);
				authorities.setUsers(users);

				users.setAuthorities(authorities);

				boolean createUser = superAdminDao.createObject(users);

				if (createUser) {

					String Url = client_url
							+ "password/createPassword.html?username="
							+ createNurse.getEmail() + "&userID=" + uniqueID
							+ "&status=" + false;

					StringBuilder builder = new StringBuilder();
					// builder.append("<html><head><title>Registartion Email</title></head><body>");
					// builder.append("<b>Please Click Here For Registration:-</b>");
					// builder.append("<a href='" + Url + "'></a>");
					// builder.append("</body></html>");

					// builder.append("Thank you for registering with RPMS. Please follow the link below to activate your account:-");
					// builder.append(Url);
					// builder.append("Best Regards\n Remote Patient Monitoring System \n");
					//
					// System.out.println(builder.toString());

					EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
					emailTemplateValue.setUrl(Url);
					emailTemplateValue.setUsername(createNurse.getFirstname()
							+ " " + createNurse.getLastname());

					builder.append(new EmailTemplate().sendEmail(
							"registration.vm", emailTemplateValue));
					System.out.println(builder.toString());

					message.setMessage("Nurse has been created successfully.");

					MailApi mailApi = new MailApi();
					mailApi.mail("Confirmation email", builder.toString(),
							createNurse.getEmail());

					message.setMessage("Nurse has been created successfully and verification link is sent to your registered Email Address.");

					return message;
				}
			}
		}

		return message;
	}
	
	
	public Message<Patient> updatePatient(String patient) {
		Message<Patient> message = new Message<Patient>();

		Patient updatePatient = new Gson().fromJson(patient, Patient.class);

		if (updatePatient.getId() != null) {

			Patient oldPatient = patientDao
					.getPatietByID(updatePatient.getId());

			if (updatePatient.getEmail().equals(oldPatient.getEmail())) {

				oldPatient.setFirstname(updatePatient.getFirstname());
				oldPatient.setLastname(updatePatient.getLastname());
				oldPatient.setMiddlename(updatePatient.getMiddlename());
				oldPatient.setNickname(updatePatient.getNickname());
				oldPatient.setCity(updatePatient.getCity());
				oldPatient.setHomephone(updatePatient.getHomephone());
				oldPatient.setCellphone(updatePatient.getCellphone());
				oldPatient.setCountry(updatePatient.getCountry());
				oldPatient.setHcgID(updatePatient.getHcgID());
				oldPatient.setMailingAddress(updatePatient.getMailingAddress());
				oldPatient.setHomeaddress(updatePatient.getHomeaddress());
				oldPatient.setMr_number(updatePatient.getMr_number());
				//oldPatient.setSsn_number(updatePatient.getSsn_number());
				oldPatient.setSex(updatePatient.getSex());
				oldPatient.setZipcode(updatePatient.getZipcode());
				oldPatient.setState(updatePatient.getState());

				oldPatient.setDocID(updatePatient.getDocID());
				oldPatient.setNurseID(updatePatient.getNurseID());
				
				

				Users users = usersDao.getUserByID("patientID",
						updatePatient.getId());
				if (users != null) {
					users.setStatus(updatePatient.getStatus());
					boolean b = usersDao.saveAndUpdate(users);
					System.out.println(b);
				}

				oldPatient.setStatus(updatePatient.getStatus());

				oldPatient.setUpdatedAt(new Date());

				oldPatient.setCategories(updatePatient.getCategories());

				oldPatient.setImage(updatePatient.getImage());

				oldPatient.setBloodPresure(updatePatient.getBloodPresure());

				oldPatient.setBloodsugur(updatePatient.getBloodsugur());
				
				oldPatient.setBloodPresureMax(updatePatient.getBloodPresureMax());

				oldPatient.setBloodsugurMax(updatePatient.getBloodsugurMax());
				
				oldPatient.setDate_of_birth(updatePatient.getDate_of_birth());

				patientDao.update(oldPatient);
				message.setMessage("Patient has been updated successfully.");
				return message;
			}
			else{
				
				Users users = usersDao.getUserByUsername(updatePatient.getEmail());
				
				if(users!=null)
				{
					message.setMessage("This Email Address already used so Please enter another Email Address.");
					return message;
				}
				else{
					
					oldPatient.setEmail(updatePatient.getEmail());
					
					oldPatient.setFirstname(updatePatient.getFirstname());
					oldPatient.setLastname(updatePatient.getLastname());
					oldPatient.setMiddlename(updatePatient.getMiddlename());
					oldPatient.setNickname(updatePatient.getNickname());
					oldPatient.setCity(updatePatient.getCity());
					oldPatient.setHomephone(updatePatient.getHomephone());
					oldPatient.setCellphone(updatePatient.getCellphone());
					oldPatient.setCountry(updatePatient.getCountry());
					oldPatient.setHcgID(updatePatient.getHcgID());
					oldPatient.setMailingAddress(updatePatient.getMailingAddress());
					oldPatient.setHomeaddress(updatePatient.getHomeaddress());
					oldPatient.setMr_number(updatePatient.getMr_number());
					//oldPatient.setSsn_number(updatePatient.getSsn_number());
					oldPatient.setSex(updatePatient.getSex());
					oldPatient.setZipcode(updatePatient.getZipcode());
					oldPatient.setState(updatePatient.getState());

					oldPatient.setDocID(updatePatient.getDocID());
					oldPatient.setNurseID(updatePatient.getNurseID());
					
					
					Users usersNew = usersDao.getUserByID("patientID",
							updatePatient.getId());
					if (usersNew != null) {
						
						usersNew.setStatus(updatePatient.getStatus());
						boolean b1 = usersDao.saveAndUpdate(usersNew);
						System.out.println(b1);
						
						String userSql="update users set username='"+updatePatient.getEmail()+"' where username='"+usersNew.getUsername()+"';";
						String authSql="update authorities set username='"+updatePatient.getEmail()+"' where username='"+usersNew.getUsername()+"';";
						
						boolean b = usersDao.update(userSql,authSql);
						System.out.println(b);
						
						if(b)
						{
							
							StringBuilder builder = new StringBuilder();

							EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
							emailTemplateValue.setUsername(oldPatient.getFirstname()
									+ " " + oldPatient.getLastname());

							builder.append(new EmailTemplate().sendEmail(
									"changedemail.vm", emailTemplateValue));
							System.out.println(builder.toString());

							MailApi mailApi = new MailApi();
							mailApi.mail("Email Changed", builder.toString(),
									usersNew.getUsername());
							
							System.out.println("email send.");
						}
						
					}

					oldPatient.setStatus(updatePatient.getStatus());

					oldPatient.setUpdatedAt(new Date());

					oldPatient.setCategories(updatePatient.getCategories());

					oldPatient.setImage(updatePatient.getImage());

					oldPatient.setBloodPresure(updatePatient.getBloodPresure());

					oldPatient.setBloodsugur(updatePatient.getBloodsugur());
					
					oldPatient.setBloodPresureMax(updatePatient.getBloodPresureMax());

					oldPatient.setBloodsugurMax(updatePatient.getBloodsugurMax());
					
					oldPatient.setDate_of_birth(updatePatient.getDate_of_birth());
					
					patientDao.update(oldPatient);
					message.setMessage("Patient has been updated successfully.");
					return message;
				}
						
				
			}
		}
		message.setMessage("patient not updated.");
		return message;
	}

	public Message<Doctor> updateDoctor(String doctor) {

		Message<Doctor> message = new Message<Doctor>();

		Doctor updateDoctor = new Gson().fromJson(doctor, Doctor.class);

		if (updateDoctor.getId() != null) {

			Doctor oldDoctor = doctorDao.getDoctorByID(updateDoctor.getId());

			if (updateDoctor.getEmail().equals(oldDoctor.getEmail())) {

				oldDoctor.setCellphone(updateDoctor.getCellphone());
				oldDoctor.setFirstname(updateDoctor.getFirstname());
				oldDoctor.setLastname(updateDoctor.getLastname());
				oldDoctor.setHcg_identifier(updateDoctor.getHcg_identifier());
				oldDoctor.setHcgID(updateDoctor.getHcgID());
				oldDoctor.setHomeaddress(updateDoctor.getHomeaddress());
				oldDoctor.setHomephone(updateDoctor.getHomephone());
				oldDoctor.setMailingAddress(updateDoctor.getMailingAddress());
				oldDoctor.setMiddlename(updateDoctor.getMiddlename());
				oldDoctor.setNickname(updateDoctor.getNickname());
				oldDoctor.setNpi(updateDoctor.getNpi());
				oldDoctor.setSex(updateDoctor.getSex());
				oldDoctor.setUpdatedAt(new Date());
				oldDoctor.setStatus(updateDoctor.getStatus());

				Users users = usersDao.getUserByID("docID",
						updateDoctor.getId());
				if (users != null) {
					users.setStatus(updateDoctor.getStatus());
					boolean b = usersDao.saveAndUpdate(users);
					System.out.println(b);
				}
				oldDoctor.setImage(updateDoctor.getImage());
				doctorDao.update(oldDoctor);
				message.setMessage("Doctor has been updated successfully.");
				return message;
			}
			else{
				
				Users users = usersDao.getUserByUsername(updateDoctor.getEmail());
				
				if(users!=null)
				{
					message.setMessage("This Email Address already used so Please enter another Email Address.");
					return message;
				}
				else{
					
					oldDoctor.setEmail(updateDoctor.getEmail());
					
					oldDoctor.setCellphone(updateDoctor.getCellphone());
					oldDoctor.setFirstname(updateDoctor.getFirstname());
					oldDoctor.setLastname(updateDoctor.getLastname());
					oldDoctor.setHcg_identifier(updateDoctor.getHcg_identifier());
					oldDoctor.setHcgID(updateDoctor.getHcgID());
					oldDoctor.setHomeaddress(updateDoctor.getHomeaddress());
					oldDoctor.setHomephone(updateDoctor.getHomephone());
					oldDoctor.setMailingAddress(updateDoctor.getMailingAddress());
					oldDoctor.setMiddlename(updateDoctor.getMiddlename());
					oldDoctor.setNickname(updateDoctor.getNickname());
					oldDoctor.setNpi(updateDoctor.getNpi());
					oldDoctor.setSex(updateDoctor.getSex());
					oldDoctor.setUpdatedAt(new Date());
					oldDoctor.setStatus(updateDoctor.getStatus());

					Users usersNew = usersDao.getUserByID("docID",
							updateDoctor.getId());
					if (usersNew != null) {
						
						usersNew.setStatus(updateDoctor.getStatus());
						boolean b1 = usersDao.saveAndUpdate(usersNew);
						System.out.println(b1);
						
						String userSql="update users set username='"+updateDoctor.getEmail()+"' where username='"+usersNew.getUsername()+"';";
						String authSql="update authorities set username='"+updateDoctor.getEmail()+"' where username='"+usersNew.getUsername()+"';";
						
						boolean b = usersDao.update(userSql,authSql);
						System.out.println(b);
						
						if(b)
						{
							
							StringBuilder builder = new StringBuilder();

							EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
							emailTemplateValue.setUsername(oldDoctor.getFirstname()
									+ " " + oldDoctor.getLastname());

							builder.append(new EmailTemplate().sendEmail(
									"changedemail.vm", emailTemplateValue));
							System.out.println(builder.toString());

							MailApi mailApi = new MailApi();
							mailApi.mail("Email Changed", builder.toString(),
									usersNew.getUsername());
							
							System.out.println("email send.");
						}
					}
					oldDoctor.setImage(updateDoctor.getImage());
					doctorDao.update(oldDoctor);
					message.setMessage("Doctor has been updated successfully.");
					return message;
					
				}
				
			}
		}
		message.setMessage("Doctor not updated.");
		return message;
	}

	public Message<Nurse> updateNurse(String nurse) {
		Message<Nurse> message = new Message<Nurse>();

		Nurse updateNurse = new Gson().fromJson(nurse, Nurse.class);

		if (updateNurse.getId() != null) {

			Nurse oldNurse = nurseDao.getNurseByID(updateNurse.getId());

			if (updateNurse.getEmail().equals(oldNurse.getEmail())) {

				oldNurse.setCellphone(updateNurse.getCellphone());
				oldNurse.setFirstname(updateNurse.getFirstname());
				oldNurse.setLastname(updateNurse.getLastname());
				oldNurse.setHcg_identifier(updateNurse.getHcg_identifier());
				oldNurse.setHcgID(updateNurse.getHcgID());
				oldNurse.setHomeaddress(updateNurse.getHomeaddress());
				oldNurse.setHomephone(updateNurse.getHomephone());
				oldNurse.setMailingAddress(updateNurse.getMailingAddress());
				oldNurse.setMiddlename(updateNurse.getMiddlename());
				oldNurse.setNickname(updateNurse.getNickname());
				oldNurse.setNpi(updateNurse.getNpi());
				oldNurse.setSex(updateNurse.getSex());
				oldNurse.setUpdatedAt(new Date());
				oldNurse.setStatus(updateNurse.getStatus());

				Users users = usersDao.getUserByID("nurseID",
						updateNurse.getId());
				if (users != null) {
					users.setStatus(updateNurse.getStatus());
					boolean b = usersDao.saveAndUpdate(users);
					System.out.println(b);
				}
				oldNurse.setImage(updateNurse.getImage());
				nurseDao.update(oldNurse);
				message.setMessage(" Nurse has been updated successfully.");
				return message;
			}
			else{
				
				Users users = usersDao.getUserByUsername(updateNurse.getEmail());
				
				if(users!=null)
				{
					message.setMessage("This Email Address already used so Please enter another Email Address.");
					return message;
				}
				else{
					
					oldNurse.setEmail(updateNurse.getEmail());
					
					oldNurse.setCellphone(updateNurse.getCellphone());
					oldNurse.setFirstname(updateNurse.getFirstname());
					oldNurse.setLastname(updateNurse.getLastname());
					oldNurse.setHcg_identifier(updateNurse.getHcg_identifier());
					oldNurse.setHcgID(updateNurse.getHcgID());
					oldNurse.setHomeaddress(updateNurse.getHomeaddress());
					oldNurse.setHomephone(updateNurse.getHomephone());
					oldNurse.setMailingAddress(updateNurse.getMailingAddress());
					oldNurse.setMiddlename(updateNurse.getMiddlename());
					oldNurse.setNickname(updateNurse.getNickname());
					oldNurse.setNpi(updateNurse.getNpi());
					oldNurse.setSex(updateNurse.getSex());
					oldNurse.setUpdatedAt(new Date());
					oldNurse.setStatus(updateNurse.getStatus());

					Users usersNew = usersDao.getUserByID("nurseID",
							updateNurse.getId());
					if (usersNew != null) {
						usersNew.setStatus(updateNurse.getStatus());
						boolean b1 = usersDao.saveAndUpdate(usersNew);
						System.out.println(b1);
						
						String userSql="update users set username='"+updateNurse.getEmail()+"' where username='"+usersNew.getUsername()+"';";
						String authSql="update authorities set username='"+updateNurse.getEmail()+"' where username='"+usersNew.getUsername()+"';";
						
						boolean b = usersDao.update(userSql,authSql);
						System.out.println(b);
						
						if(b)
						{
							
							StringBuilder builder = new StringBuilder();

							EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
							emailTemplateValue.setUsername(oldNurse.getFirstname()
									+ " " + oldNurse.getLastname());

							builder.append(new EmailTemplate().sendEmail(
									"changedemail.vm", emailTemplateValue));
							System.out.println(builder.toString());

							MailApi mailApi = new MailApi();
							mailApi.mail("Email Changed", builder.toString(),
									usersNew.getUsername());
							
							System.out.println("email send.");
						}
					}
					oldNurse.setImage(updateNurse.getImage());
					nurseDao.update(oldNurse);
					message.setMessage(" Nurse has been updated successfully.");
					return message;
					
				}
					
					
			}
		}
		message.setMessage("Nurse not updated.");
		return message;
	}

	public Message<Patient> getAllAssignedPatient(Integer id, String status) {
		Message<Patient> message=new Message<>();

		if(status.equals("doctor"))
		{
			Doctor doctor=doctorDao.getDoctorByID(id);
			
			if(doctor.getHcgID()!=null)
			{
				List<Patient> list=superAdminDao.getAllAssignedPatient("docID",id,doctor.getHcgID());
				System.out.println(list);
				if(list!=null)
				{
					message.setListentity(list);
					return message;
				}
				
				
			}
			message.setMessage("HCG ID is null");
			return message;
		}
		else if(status.equals("nurse"))
		{
			Nurse nurse=nurseDao.getNurseByID(id);
			
			if(nurse.getHcgID()!=null)
			{
				List<Patient> list=superAdminDao.getAllAssignedPatient("nurseID",id,nurse.getHcgID());
				System.out.println(list);
				if(list!=null)
				{
					message.setListentity(list);
					return message;
				}
			}
			message.setMessage("HCG ID is null");
			return message;
		}
		message.setMessage("values is null");
		return message;
	}
	
	public Message<Users> viewBlockedUserDetails(){
		Message<Users> message = new Message<Users>();
		List<Users> list = superAdminDao.getAllBlockedUsers();
		if(list!=null){
			  message.setListentity(list);
			  return message;
		}
		message.setMessage("Status is null");
		return message;
		
	}
	public Message<Users> searchBlockedUsers(String username){
		
		Message<Users> message = new Message<Users>();
		
		List<Users>  list = superAdminDao.getSearchedBlockedUsers(username);
		
		if(list !=null){
			
			message.setListentity(list);
			return message;
		}
		
		message.setMessage("User Name not Found");
		return message;
	}
	
	public Message<SuperAdmin> getSuperAdminDetails(String  username) {
		Message<SuperAdmin> message = new Message<SuperAdmin>();
		try{
		SuperAdmin getSuperAdmin = superAdminDao.getSuperAdminByEmailID(username).get(0);
	    message.setObject(getSuperAdmin);
		
		}
		catch(Exception e){
				
			
		}
		return message;
	
			}
	
	
	
}
