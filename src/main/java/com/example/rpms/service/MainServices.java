package com.example.rpms.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.rpms.dao.DoctorDao;
import com.example.rpms.dao.HCGDao;
import com.example.rpms.dao.MainDao;
import com.example.rpms.dao.NurseDao;
import com.example.rpms.dao.PatientDao;
import com.example.rpms.dao.UsersDao;
import com.example.rpms.domain.Attempts;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.EmailTemplateValue;
import com.example.rpms.domain.HcgOrgnization;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.PatientData;
import com.example.rpms.domain.PatientPhysiologicalData;
import com.example.rpms.domain.Users;
import com.example.rpms.emailTemplate.EmailTemplate;
import com.example.rpms.mailapi.MailApi;
import com.google.gson.Gson;

@Component
@Transactional
public class MainServices {

	@Autowired
	private MainDao mainDao;

	@Autowired
	private UsersDao usersDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private PatientDao patientDao;

	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private HCGDao hcgdao;

	public Message<Users> createPassword(String username, String user_id,
			String password, Boolean patient_status) {
		Message<Users> message = new Message<Users>();

		if (patient_status == true) {
			System.out.println("Update Password");

			boolean b = mainDao.updateNewPassword(username, user_id, password);
			if (b) {
				message.setMessage("Password has been updated successfully. Now you can login with new password.");
				return message;
			}

			message.setMessage("Password is not updated. There is some error so please check it.");
			return message;
		} else if (patient_status == false) {

			System.out.println("create Password");
			boolean b = mainDao.createPassword(username, user_id, password);

			if (b) {
				message.setMessage("Password has been updated successfully. Now you can login with new password.");
				return message;
			}

			message.setMessage("Password is not updated. There is some error so please check it.");
			return message;
		} else {
			message.setMessage("Password is not updated. There is some error so please check it.");
			return message;
		}

	}

	public Message<Users> updatePassword(String username, String client_url) {
		Message<Users> message = new Message<Users>();

		if (client_url == null) {
			return message;
		}

		Users b = mainDao.updatePassword(username);
		if (b != null) {

			if (!b.isPassword_creation_status()) {
				message.setMessage("You are not the verified user so please check your account details.");
				message.setValid(false);
				return message;
			}

			String Url = client_url + "password/createPassword.html?username="
					+ username + "&userID=" + b.getUniqueID() + "&status="
					+ true;

			StringBuilder builder = new StringBuilder();
			// builder.append("<html><head><title>Update Password</title></head><body>");
			// builder.append("<b>Please Click Here For Update Password:-</b></br>");
			// builder.append("<a href='" + Url + "'></a>");
			// builder.append("</body></html>");

			// builder.append("Hello &userID, \n In reference to your "Forgot
			// Password" query, please follow the link below to reset your password:- \nIf you will follow the link below you can reset your password:- ");
			// builder.append(Url);
			// builder.append("Best Regards\n Remote Patient Monitoring System \n");

			EmailTemplateValue emailTemplateValue = new EmailTemplateValue();
			emailTemplateValue.setUrl(Url);

			if (b.getDocID() != null) {
				Doctor basicName = doctorDao.getDoctorByID(b.getDocID());
				if (basicName != null) {
					emailTemplateValue.setUsername(basicName.getFirstname()
							+ " " + basicName.getLastname());
				}

			} else if (b.getNurseID() != null) {
				Nurse basicName = nurseDao.getNurseByID(b.getNurseID());
				if (basicName != null) {
					emailTemplateValue.setUsername(basicName.getFirstname()
							+ " " + basicName.getLastname());
				}
			} else if (b.getPatientID() != null) {
				Patient basicName = patientDao.getPatietByID(b.getPatientID());
				if (basicName != null) {
					emailTemplateValue.setUsername(basicName.getFirstname()
							+ " " + basicName.getLastname());
				}
			}

			builder.append(new EmailTemplate().sendEmail("forgot.vm",
					emailTemplateValue));

			System.out.println(builder.toString());

			MailApi mailApi = new MailApi();
			mailApi.mail("Forgot Password", builder.toString(), username);

			message.setMessage("Mail has been sent successfully to your Email Address. Please check your Mail Box.");
			return message;
		}

		message.setMessage("Mail is not sent. There is some error in data so please check it.");
		return message;
	}

	public String uploadImage(MultipartFile file) {

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				System.out.println(bytes.length);

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();
				System.out.println(dir.getAbsolutePath());
				// Create the file on server for server :
				// /Storage/Hosting/tomcat/tomcat8/rpmsimages/ , for local :
				// E:/rpms_profile_image/ C:/propimages
				File serverFile = new File("/Storage/Hosting/tomcat/tomcat8/rpmsimages/"
						+ +(new Date()).getTime() + ".jpg");
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				System.out.println("Server File Location="
						+ serverFile.getAbsolutePath());

				System.out.println("You have successfully uploaded file="
						+ file.getName());

				return "images/" + serverFile.getName();
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		} else {
			System.out.println("You failed to upload " + file.getName()
					+ " because the file was empty.");

			return null;
		}

	}
    
	public Message<Users> unblockUsers(String userid){
		Message<Users> message = new Message<Users>();
		
		
		Users users= new Users();
		
		users=usersDao.getUserByUsername(userid);
		if(users.getPatientID()!=null){
			Patient pat = patientDao.getPatietByID(users.getPatientID());
			if( !users.isEnabled()){
				Attempts resetAttempt = mainDao.getAttemptsByUserName("username",
						users.getUsername());
				if(resetAttempt.getAttemp()==3)
				{
					resetAttempt.setAttemp(0);
				}
				else{
					
				}
				if(!users.isPassword_creation_status()){
					users.setPassword_creation_status(true);
				}
				else{
					
				}
			/*	if(users.getStatus()==1){
					users.setStatus(0);
				}*/
			 
				users.setEnabled(true);
				
				message.setMessage("'"+users.getUsername()+"' is activated user now!");
				MailApi activatemail = new MailApi();
				activatemail.mail("For unblock your account","Hello "+pat.getFirstname()+" "+pat.getLastname()+", \n \n \n Your account has been activated, Now you can login into the system with valid credentials \n \n \n \n \n \n Best Regards \n Remote Patient Monitoring System",users.getUsername());

				message.setValid(true);
				return message;
			}
			else{
				   message.setMessage("'"+users.getUsername()+"' is already activated user");
				   message.setValid(false);
				   return message;
			}
		}
		else if(users.getNurseID()!=null){
			Nurse nur = nurseDao.getNurseByID(users.getNurseID());
			
			if( !users.isEnabled()){
				Attempts resetAttempt = mainDao.getAttemptsByUserName("username",
						users.getUsername());
				if(resetAttempt.getAttemp()==3)
				{
					resetAttempt.setAttemp(0);
				}
				else{
					
				}
				if(!users.isPassword_creation_status()){
					users.setPassword_creation_status(true);
				}
				else{
					
				}
			/*	if(users.getStatus()==1){
					users.setStatus(0);
				}*/
			
				users.setEnabled(true);
				
				message.setMessage("'"+users.getUsername()+"' is activated user now!");
				MailApi activatemail = new MailApi();
				activatemail.mail("For unblock your account","Hello "+nur.getFirstname()+" "+nur.getLastname()+", \n \n \n Your account has been activated, Now you can login into the system with valid credentials \n \n \n \n \n \n Best Regards \n Remote Patient Monitoring System",users.getUsername());
				message.setValid(true);
				return message;
			}
			else{
				   message.setMessage("'"+users.getUsername()+"' is already activated user");
				   message.setValid(false);
				   return message;
			}
		}
		else if(users.getDocID()!=null){
			
			Doctor doc= doctorDao.getDoctorByID(users.getDocID());
			
			if( !users.isEnabled()){
				Attempts resetAttempt = mainDao.getAttemptsByUserName("username",
						users.getUsername());
				if(resetAttempt.getAttemp()==3)
				{
					resetAttempt.setAttemp(0);
				}
				else{
					
				}
				if(!users.isPassword_creation_status()){
					users.setPassword_creation_status(true);
				}
				else{
					
				}
			/*	if(users.getStatus()==1){
					users.setStatus(0);
				}*/
			
				users.setEnabled(true);
				
				message.setMessage("'"+users.getUsername()+"' is activated user now!");
				MailApi activatemail = new MailApi();
				activatemail.mail("For unblock your account","Hello "+doc.getFirstname()+" "+doc.getLastname()+", \n \n \n Your account has been activated, Now you can login into the system with valid credentials \n \n \n \n \n \n Best Regards \n Remote Patient Monitoring System",users.getUsername());
				message.setValid(true);
				return message;
			}
			else{
				   message.setMessage("'"+users.getUsername()+"' is already activated user");
				   message.setValid(false);
				   return message;
			}
		}
		else if(users.getHcgID()!=null){
			
			HcgOrgnization hcg =hcgdao.getHCGByID(users.getHcgID());
			if( !users.isEnabled()){
				Attempts resetAttempt = mainDao.getAttemptsByUserName("username",
						users.getUsername());
				if(resetAttempt.getAttemp()==3)
				{
					resetAttempt.setAttemp(0);
				}
				else{
					
				}
				if(!users.isPassword_creation_status()){
					users.setPassword_creation_status(true);
				}
				else{
					
				}
			/*	if(users.getStatus()==1){
					users.setStatus(0);
				}*/
			
				users.setEnabled(true);
				
				message.setMessage("'"+users.getUsername()+"' is activated user now!");
				MailApi activatemail = new MailApi();
				activatemail.mail("For unblock your account","Hello "+hcg.getFirstname()+" "+hcg.getLastname()+", \n \n \n Your account has been activated, Now you can login into the system with valid credentials \n \n \n \n \n \n Best Regards \n Remote Patient Monitoring System",users.getUsername());
				message.setValid(true);
				return message;
			}
			else{
				   message.setMessage("'"+users.getUsername()+"' is already activated user");
				   message.setValid(false);
				   return message;
			}
		}
		
		
		
	
		 message.setMessage("Please select an user for Activation");
		   message.setValid(false);
		   return message;
		
			
		

		
	}
	
	public Message<Attempts> loginAttempt(String attempt) {
		Message<Attempts> message = new Message<Attempts>();
		Attempts attempts = new Gson().fromJson(attempt, Attempts.class);

		Users users = usersDao.getUserByUsername(attempts.getUsername());

		if (users != null) {
			
			if (users.getStatus()==1) {
				message.setMessage("Your are deactivated user so please check your account details.");
				message.setValid(false);
				return message;
			}

			if (!users.isPassword_creation_status()) {
				message.setMessage("You are not the verified user so please check your account details.");
				message.setValid(false);
				return message;
			}

			Attempts attemptUpdate = mainDao.getAttemptsByUserName("username",
					attempts.getUsername());

			if (attemptUpdate != null) {
				System.out.println("attempts not null.");
				if (attemptUpdate.getAttemp() >= 3) {
					message.setMessage("You have exceeded the maximum number of Login Attempts. Your account is blocked. Kindly contact to administrator to unblock.");
					message.setValid(false);
					return message;
				} else {
					if (attempts.getLoginStatus().endsWith("success")) {

						attemptUpdate.setAttemp(0);
						attemptUpdate.setUpdatedAT(new Date());
						if (mainDao.update(attemptUpdate)) {
							System.out.println("login successfully");
						}

						message.setValid(true);
						return message;
					} else {
						int val = attemptUpdate.getAttemp() + 1;
						if (val >= 3) {

							attemptUpdate.setAttemp(val);
							attemptUpdate.setUpdatedAT(new Date());
							if (mainDao.update(attemptUpdate)) {
								System.out
										.println("Attempts over and you are blocked.");
							}

							users.setEnabled(false);
							mainDao.update(users);
							message.setMessage("You have exceeded the maximum number of Login Attempts. Your account is blocked. Kindly contact to administrator to unblock.");
							message.setValid(false);
							return message;
						} else {
							attemptUpdate.setAttemp(val);
							attemptUpdate.setUpdatedAT(new Date());
							if (mainDao.update(attemptUpdate)) {
								System.out.println("login unsuccessfully");
							}

							message.setMessage("Entering wrong password again will block your account. Now you have only "
									+ (3 - val) + " attempt.");
							message.setValid(false);
							return message;
						}
					}
				}

			} else {
				if (attempts.getLoginStatus().endsWith("success")) {
					attempts.setUpdatedAT(new Date());
					attempts.setCreatedAT(new Date());
					attempts.setAttemp(0);
					if (mainDao.save(attempts)) {
						System.out.println("save");
					} else {
						System.out.println("not save");
					}
					// message.setMessage("Entering wrong password 3 times will block account. ");
					message.setValid(true);
					return message;
				} else {
					attempts.setUpdatedAT(new Date());
					attempts.setCreatedAT(new Date());
					attempts.setAttemp(1);
					if (mainDao.save(attempts)) {
						System.out.println("save");
					} else {
						System.out.println("not save");
					}
					message.setMessage("Entering wrong password 3 times will block account.");
					message.setValid(false);
					return message;
				}

			}
		} else {
			message.setMessage("The email id or password you entered is incorrect.");
			message.setValid(false);
			return message;
		}

	}

	public Message patientData(String androidData) {
		Message<String> m = new Message<>();
		
		System.out.println(" database: "+androidData);
		
		PatientData patientData=new Gson()
		.fromJson(androidData, PatientData.class);

		for (PatientPhysiologicalData data : patientData.getPatientPhysiologicalData()) {
			try {
				data.setIsDeleted(0);
				mainDao.save(data);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		m.setMessage("Patient Data is saved");
		m.setValid(true);
		return m;

	}

}
