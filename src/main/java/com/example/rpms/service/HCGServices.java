package com.example.rpms.service;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.example.rpms.constant.Constant;
import com.example.rpms.dao.DoctorDao;
import com.example.rpms.dao.HCGDao;
import com.example.rpms.dao.NurseDao;
import com.example.rpms.dao.PatientDao;
import com.example.rpms.dao.UsersDao;
import com.example.rpms.domain.Authorities;
import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.EmailTemplateValue;
import com.example.rpms.domain.HcgOrgnization;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.Users;
import com.example.rpms.emailTemplate.EmailTemplate;
import com.example.rpms.mailapi.MailApi;
import com.google.gson.Gson;

@Component
@Transactional
@SuppressWarnings({ "unchecked", "rawtypes" })
public class HCGServices {

	@Autowired
	private HCGDao hcgDao;

	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private NurseDao nurseDao;

	@Autowired
	private UsersDao usersDao;

	public Count dashboardCount(Integer hcgID) {

		Count count = hcgDao.dashboardCount(hcgID);

		if (count == null) {
			count = new Count();
			return count;
		}

		return count;
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

			int res = (Integer) hcgDao.create(createPatient);

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

				boolean createUser = hcgDao.createObject(users);

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

					message.setMessage("Patient has been created successfully and verification link is sent to the email address.");

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

			int res = (Integer) hcgDao.create(createDoctor);

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

				boolean createUser = hcgDao.createObject(users);

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

					message.setMessage("Doctor has been created successfully and verification link is sent to the email address.");

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

			int res = (Integer) hcgDao.create(createNurse);

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

				boolean createUser = hcgDao.createObject(users);

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

					message.setMessage("Nurse has been created successfully and verification link is sent to the email address.");

					return message;
				}
			}
		}

		return message;
	}

	public Message viewPersonDetails(String personID, Integer hcgID) {

		if (personID.equals("patient")) {
			Message message = new Message<>();
			message.setListentity(patientDao.viewPatient(hcgID, null));
			return message;
		} else if (personID.equals("doctor")) {
			Message message = new Message<>();
			message.setListentity(doctorDao.viewDoctor(hcgID));
			return message;
		} else if (personID.equals("nurse")) {
			Message message = new Message<>();
			message.setListentity(nurseDao.viewNurse(hcgID));
			return message;
		} else if (personID.equals("unpatient")) {
			Message message = new Message<>();
			message.setListentity(patientDao.viewUNPatient(hcgID));
			return message;
		} else {
			Message message = new Message<>();
			message.setMessage("There is some error occurred. So please check it carefully.");
			return message;
		}

	}

	public Message<Patient> getPatietByID(Integer id) {

		Message<Patient> message = new Message<>();

		try {
			Patient patient = patientDao.getPatietByID(id);
			if (patient != null) {
				
				message.setObject(patient);
				message.setValid(true);
			}

			message.setMessage("Patient Found");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("Patient Not Found");
		}
		return message;
	}

	public Message<Doctor> getDoctorByID(Integer id) {
		Message<Doctor> message = new Message<>();

		try {
			Doctor doctor = doctorDao.getDoctorByID(id);
			if (doctor != null) {
				message.setObject(doctor);
			}

			message.setMessage("doctor Found");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("doctor Not Found");
		}
		return message;
	}

	public Message<Nurse> getNurseByID(Integer id) {
		Message<Nurse> message = new Message<>();

		try {
			Nurse nurse = nurseDao.getNurseByID(id);
			if (nurse != null) {
				message.setObject(nurse);
			}

			message.setMessage("Nurse Found");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("Nurse Not Found");
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
					message.setMessage("This email id already used so Please enter another email id.");
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
							
							emailTemplateValue.setFirstEmail(usersNew.getUsername());
							emailTemplateValue.setSecondEmail(updatePatient.getEmail());

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
				if(updateDoctor.getStatus()==1)
				{
					patientDao.updatePatientForInactiveDoctor(updateDoctor.getId());
				}
				message.setMessage("Doctor has been updated successfully.");
				return message;
			}
			else{
				
				Users users = usersDao.getUserByUsername(updateDoctor.getEmail());
				
				if(users!=null)
				{
					message.setMessage("This email id already used so Please enter another email id.");
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
							
							emailTemplateValue.setFirstEmail(usersNew.getUsername());
							emailTemplateValue.setSecondEmail(updateDoctor.getEmail());

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
					message.setMessage("This email id already used so Please enter another email id.");
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
							
							emailTemplateValue.setFirstEmail(usersNew.getUsername());
							emailTemplateValue.setSecondEmail(updateNurse.getEmail());

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
					
					if(updateNurse.getStatus()==1){
						patientDao.updatePatientForInactiveNurse(updateNurse.getId());
					}
					message.setMessage(" Nurse has been updated successfully.");
					return message;
					
				}
					
					
			}
		}
		message.setMessage("Nurse not updated.");
		return message;
	}

	public Message<Doctor> getAllDoctor(Integer hcgID) {
		Message<Doctor> message = new Message<>();
		List<Doctor> list = doctorDao.getAllDoctor(hcgID);
		message.setListentity(list);
		return message;
	}

	public Message<Nurse> getAllNurse(Integer hcgID) {
		Message<Nurse> message = new Message<>();
		List<Nurse> list = nurseDao.getAllNurse(hcgID);
		message.setListentity(list);
		return message;
	}

	public Message<Patient> assignPatient(String patient) {
		Message<Patient> message = new Message<Patient>();

		Patient updatePatient = new Gson().fromJson(patient, Patient.class);

		if (updatePatient.getId() != null) {

			Patient oldPatient = patientDao
					.getPatietByID(updatePatient.getId());

			oldPatient.setDocID(updatePatient.getDocID());
			oldPatient.setNurseID(updatePatient.getNurseID());

			oldPatient.setUpdatedAt(new Date());

			patientDao.update(oldPatient);
			message.setMessage("Patient has been assigned successfully.");
			return message;
		}
		message.setMessage("patient not assigned.");
		return message;
	}

	public Message<Patient> searchPatient(String search, Integer hcgID,
			String[] searchValue, String[] searchStatus) {
		Message<Patient> message = new Message<Patient>();

		List<Patient> list = patientDao.searchPatient(search, hcgID,
				searchValue, searchStatus);

		if (list != null) {
			message.setListentity(list);
			return message;
		}

		message.setMessage("Details Not Found.");
		return message;
	}

	public Message<Doctor> searchDoctor(String search, Integer hcgID,
			String[] searchStatus) {
		Message<Doctor> message = new Message<Doctor>();

		List<Doctor> list = doctorDao.searchDoctor(search, hcgID, searchStatus);

		if (list != null) {
			message.setListentity(list);
			return message;
		}

		message.setMessage("Details Not Found.");
		return message;
	}

	public Message<Nurse> searchNurse(String search, Integer hcgID,
			String[] searchStatus) {
		Message<Nurse> message = new Message<Nurse>();

		List<Nurse> list = nurseDao.searchNurse(search, hcgID, searchStatus);

		if (list != null) {
			message.setListentity(list);
			return message;
		}

		message.setMessage("Details Not Found.");
		return message;
	}

	public Message<Patient> searchUnPatient(String search, Integer hcgID,
			String[] searchValue, String[] searchStatus) {
		Message<Patient> message = new Message<Patient>();

		List<Patient> list = patientDao.searchUnPatient(search, hcgID,
				searchValue, searchStatus);

		if (list != null) {
			message.setListentity(list);
			return message;
		}

		message.setMessage("Details Not Found.");
		return message;
	}

	public boolean checkEmail(String username) {

		Users details = usersDao.getUserByUsername(username);

		if (details != null) {

			return false;
		} else {
			return true;
		}

	}


	public Message<HcgOrgnization> getHCGByID(Integer id) {
		Message<HcgOrgnization> message = new Message<HcgOrgnization>();

		try {
			HcgOrgnization hcgOrgnization = hcgDao.getHCGByID(id);
			if (hcgOrgnization != null) {
				message.setObject(hcgOrgnization);
			}

			message.setMessage("HCG Organization Found");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("HCG Organization Not Found");
		}
		return message;
	}
	
	
	public HcgOrgnization HCGByID(Integer id) {

			return hcgDao.getHCGByID(id);

	}

	public Message<HcgOrgnization> updateHCGSetting(String hcg) {
		Message<HcgOrgnization> message = new Message<HcgOrgnization>();

		HcgOrgnization orgnization = new Gson().fromJson(hcg,
				HcgOrgnization.class);

		if (orgnization.getId() != null) {

			HcgOrgnization hcgOrgnization = hcgDao.getHCGByID(orgnization
					.getId());

			hcgOrgnization.setTimezone(orgnization.getTimezone());
			hcgOrgnization.setBloodPresure(orgnization.getBloodPresure());
			hcgOrgnization.setGulcose(orgnization.getGulcose());
			
			hcgOrgnization.setBloodPresureMax(orgnization.getBloodPresureMax());
			hcgOrgnization.setGulcoseMax(orgnization.getGulcoseMax());
			
			hcgOrgnization.setDateformat(orgnization.getDateformat());

			hcgOrgnization.setUpdatedAt(new Date());

			hcgDao.update(hcgOrgnization);
			message.setMessage("Patient has been assigned successfully.");
			return message;
		}
		message.setMessage("patient not assigned.");
		return message;
	}

	public boolean checkNPI(String npi) {
		Doctor details = doctorDao.getDoctorByNPI(npi);

		if (details != null) {

			return false;
		} else {
			return true;
		}
	}

	public boolean checkMRNumber(String mr_number) {
		Patient details = patientDao.getMrNumber(mr_number);

		if (details != null) {

			return false;
		} else {
			return true;
		}
	}

	public Message<HcgOrgnization> updatePatientCategories(String hcgorganize) {
		Message<HcgOrgnization> message = new Message<HcgOrgnization>();

		HcgOrgnization orgnization = new Gson().fromJson(hcgorganize,
				HcgOrgnization.class);

		if (orgnization.getId() != null) {

			HcgOrgnization hcgOrgnization = hcgDao.getHCGByID(orgnization
					.getId());

			hcgOrgnization.setCategories(orgnization.getCategories());
			
			
			hcgDao.update(hcgOrgnization);
			
			message.setMessage("Patient categories updated.");
			return message;
		}
		message.setMessage("patient categories not updated..");
		return message; 
	}

	public Message updatePhysologicaldata(Double suger,
			Double pressure, Integer hcgID) {
		
		Message message = new Message();
		
		boolean b=hcgDao.updatePhysologicaldata(suger,pressure,hcgID);
		
		if(b)
		{
			message.setMessage("Physological data updated.");
			message.setValid(true);
			return message;
		}
		
		message.setValid(false);
		return message; 
	}
	
	public Message<Patient> viewBlockedPatientDetails(Integer hcgid,String uservalue){
		Message<Patient> message = new Message<Patient>();
		List<Patient> list = hcgDao.getAllBlockedPatients(hcgid,uservalue);
		if(list!=null){
			  message.setListentity(list);
			  return message;
		}
		message.setMessage("Status is null");
		return message;
		
	}

	public Message<Nurse> viewBlockedNurseDetails(Integer hcgid,String uservalue){
		Message<Nurse> message = new Message<Nurse>();
		List<Nurse> list = hcgDao.getAllBlockedNurses(hcgid,uservalue);
		if(list!=null){
			  message.setListentity(list);
			  return message;
		}
		message.setMessage("Status is null");
		return message;
		
	}

	public Message<Doctor> viewBlockedDoctorDetails(Integer hcgid,String uservalue){
		Message<Doctor> message = new Message<Doctor>();
		List<Doctor> list = hcgDao.getAllBlockedDoctors(hcgid,uservalue);
		if(list!=null){
			  message.setListentity(list);
			  return message;
		}
		message.setMessage("Status is null");
		return message;
		
	}
	
public Message<Users> searchBlockedUsers(String username,Integer hcgid){
		
		Message<Users> message = new Message<Users>();
		
		List<Users>  list = hcgDao.getSearchedBlockedUsers(username,hcgid);
		
		if(list !=null){
			
			message.setListentity(list);
			return message;
		}
		
		message.setMessage("User Name not Found");
		return message;
	}

}
