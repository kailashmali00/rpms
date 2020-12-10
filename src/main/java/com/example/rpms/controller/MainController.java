package com.example.rpms.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.rpms.domain.Attempts;
import com.example.rpms.domain.CheckPassword;
import com.example.rpms.domain.HcgOrgnization;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.PatientPhysiologicalData;
import com.example.rpms.domain.Users;
import com.example.rpms.dto.PatientDTO;
import com.example.rpms.service.HCGServices;
import com.example.rpms.service.MainServices;
import com.example.rpms.service.PatientServices;
import com.google.gson.Gson;

@Controller
public class MainController extends BaseController {

	@Autowired
	private MainServices mainServices;
	
	@Autowired
	private HCGServices hcgServices;
	
	@Autowired
	private PatientServices pservice;

	@RequestMapping(value = "/rpms/hcg/", method = RequestMethod.GET)
	public @ResponseBody
	Message<Users> defaultPage1() {

		Users users = getUniqueID(getUserName());

		Message<Users> message = new Message<Users>();
		if (users != null) {
			message.setObject(users);
		}

		return message;
	}

	@RequestMapping(value = "/rpms/doc/", method = RequestMethod.GET)
	public @ResponseBody
	Message<Users> defaultPage2() {

		Users users = getUniqueID(getUserName());

		Message<Users> message = new Message<Users>();
		if (users != null) {
			message.setObject(users);
		}

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/", method = RequestMethod.GET)
	public @ResponseBody
	Message<Users> defaultPage3() {

		Users users = getUniqueID(getUserName());

		Message<Users> message = new Message<Users>();
		if (users != null) {
			message.setObject(users);
		}

		return message;
	}

	@RequestMapping(value = "/rpms/patient/", method = RequestMethod.GET)
	public @ResponseBody
	Message<Users> defaultPage4() {

		Users users = getUniqueID(getUserName());

		Message<Users> message = new Message<Users>();
		if (users != null) {
			message.setObject(users);
		}

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/", method = RequestMethod.GET)
	public @ResponseBody
	Message<Users> defaultPage5() {

		Users users = getUniqueID(getUserName());

		Message<Users> message = new Message<Users>();
		if (users != null) {
			message.setObject(users);
		}

		return message;
	}

	@RequestMapping(value = "/users/create_password", method = RequestMethod.POST)
	public @ResponseBody
	Message<Users> createPassword(@RequestParam String username,
			@RequestParam String patient_userid, @RequestParam String password,
			@RequestParam Boolean patient_status) {

		System.out.println(username + "/" + patient_userid + "/"
				+ patient_status + "/password:- " + password);

		Message<Users> message = mainServices.createPassword(username,
				patient_userid, password, patient_status);

		return message;
	}

	@RequestMapping(value = "/users/update_password", method = RequestMethod.POST)
	public @ResponseBody
	Message<Users> updatePassword(@RequestParam String username,
			@RequestParam String client_url) {

		System.out.println(username + "/" + client_url);

		Message<Users> message = mainServices.updatePassword(username,
				client_url);

		return message;
	}

	@RequestMapping(value = "/users/upload", method = RequestMethod.POST)
	public @ResponseBody
	String updatePassword(@RequestParam("file") MultipartFile file) {

		String locationPath = mainServices.uploadImage(file);

		return locationPath;
	}
	
	@RequestMapping(value = "/users/check_email", method = RequestMethod.POST)
	public @ResponseBody
	String checkEmail(@RequestParam String email) {
		boolean value = hcgServices.checkEmail(email);
		
		if(value)
		{
			CheckPassword checkPassword = new CheckPassword();
			checkPassword.setValid(false);

			String result = new Gson().toJson(checkPassword);


			return result;
		}
		else{
			CheckPassword checkPassword = new CheckPassword();
			checkPassword.setValid(true);

			String result = new Gson().toJson(checkPassword);


			return result;
		}

		
	}
	
	@RequestMapping(value = "/users/login_attempt", method = RequestMethod.POST)
	public @ResponseBody
	Message<Attempts> loginAttempt(@RequestParam String attempt) {
		
		Message<Attempts> message=mainServices.loginAttempt(attempt);
				
		return message;
		
	}
	@RequestMapping(value = "/users/unblock_users", method = RequestMethod.POST)
	public @ResponseBody
	Message<Users> unblockUsers(@RequestParam String userid) {
		
		Message<Users> message=mainServices.unblockUsers(userid);
				
		return message;
		
	}
	
	@RequestMapping(value = "/users/patientbymrid", method = RequestMethod.GET)
	public @ResponseBody
	Message<PatientDTO> patientByMrid(@RequestParam String mrid) {
		Message<PatientDTO> mp = new Message<PatientDTO>();
		
		Patient pat = pservice.getPatientByMR(mrid);
		if(pat !=null){
		HcgOrgnization hch = hcgServices.HCGByID(pat.getHcgID());
		
		PatientDTO pdto = new PatientDTO();
		pdto.patientMr = pat.getMr_number();
		pdto.pressureMax = pat.getBloodPresureMax();
		pdto.pressureMin = pat.getBloodPresure();
		pdto.sugarMax = pat.getBloodsugurMax();
		pdto.sugarMin = pat.getBloodsugur();
		pdto.sugarUnit = (hch.getGulcose().split(","))[1];
		pdto.pressureUnit = (hch.getBloodPresure().split(","))[1];
		mp.setObject(pdto);
		}
		return mp;
		
	}
	
	@RequestMapping(value = "/users/patientdata", method = RequestMethod.POST)
	public @ResponseBody
	String patientData(HttpServletRequest request) {
	
		String androidData=request.getParameter("PhysiologicalData");
		
		Message message= mainServices.patientData(androidData);
		
		
		return "received";
	}
	
	
//	@RequestMapping(value = "/api/set", method = RequestMethod.POST)
//	@ResponseBody
//	public String getApi(HttpServletRequest request){
//		/*Enumeration e= request.getParameterNames();
//		//System.out.println("Enum: "+request.getParameterNames().toString());
//		while(e.hasMoreElements()){
//			System.out.println("Enum: "+e.toString());
//		}*/
//		String db=request.getParameter("PhysiologicalData");
//		//String total=request.getParameter("Total");
//		String total=request.getParameter("MyKey");
//		
//		
//		System.out.println("My Key: "+total+" & database: "+db);
//		return "received";
//	}
	
	
	public class forAndroid{
		public List<PatientPhysiologicalData> PhysiologicalData = new ArrayList<>();
	}

}
