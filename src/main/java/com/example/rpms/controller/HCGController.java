package com.example.rpms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.rpms.domain.CheckPassword;
import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.HcgOrgnization;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.service.HCGServices;
import com.google.gson.Gson;

@Controller
public class HCGController {

	@Autowired
	private HCGServices hcgServices;

	@RequestMapping(value = "/rpms/hcg/dashboard_count", method = RequestMethod.POST)
	public @ResponseBody
	Message<Count> dashboardCount(@RequestParam Integer hcgID) {

		Message<Count> message = new Message<Count>();

		Count list = hcgServices.dashboardCount(hcgID);

		message.setObject(list);

		return message;
	}

	/*
	 * @RequestMapping(value = "/rpms/hcg/create_patient", method =
	 * RequestMethod.POST) public @ResponseBody Message<Patient>
	 * createPatient(@RequestBody String imageUrl) {
	 * System.out.println(imageUrl);
	 * 
	 * Message<Patient> message =new Message<>(); //Message<Patient> message =
	 * hcgServices.createPatient(patient,client_url);
	 * 
	 * return message; }
	 */
	@RequestMapping(value = "/rpms/hcg/create_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> createPatient(@RequestParam String patient,
			@RequestParam String client_url) {
		System.out.println(patient + "" + client_url);

		Message<Patient> message = hcgServices.createPatient(patient,
				client_url);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/create_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> createDoctor(@RequestParam String doctor,
			@RequestParam String client_url) {
		System.out.println(doctor);

		Message<Doctor> message = hcgServices.createDoctor(doctor, client_url);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/create_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> createNurse(@RequestParam String nurse,
			@RequestParam String client_url) {
		System.out.println(nurse);

		Message<Nurse> message = hcgServices.createNurse(nurse, client_url);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/view_person_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewPersonDetails(@RequestParam String personID,
			@RequestParam Integer hcgID) {
		System.out.println(personID + "/" + hcgID);

		Message message = hcgServices.viewPersonDetails(personID, hcgID);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/get_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> getPatietByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Patient> message = hcgServices.getPatietByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/get_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> getDoctorByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Doctor> message = hcgServices.getDoctorByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/get_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> getNurseByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Nurse> message = hcgServices.getNurseByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/update_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> updatePatient(@RequestParam String patient) {
		System.out.println(patient);

		Message<Patient> message = hcgServices.updatePatient(patient);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/update_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> updateDoctor(@RequestParam String doctor) {
		System.out.println(doctor);

		Message<Doctor> message = hcgServices.updateDoctor(doctor);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/update_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> updateNurse(@RequestParam String nurse) {
		System.out.println(nurse);

		Message<Nurse> message = hcgServices.updateNurse(nurse);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/get_all_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> getAllDoctor(@RequestParam Integer hcgID) {

		Message<Doctor> message = hcgServices.getAllDoctor(hcgID);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/get_all_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> getAllNurse(@RequestParam Integer hcgID) {

		Message<Nurse> message = hcgServices.getAllNurse(hcgID);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/assign_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> assignPatient(@RequestParam String patient) {
		System.out.println(patient);

		Message<Patient> message = hcgServices.assignPatient(patient);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/search_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> searchPatient(@RequestParam String patientDetail,
			@RequestParam Integer hcgID, @RequestParam String[] searchValue,
			@RequestParam String[] searchStatus) {
		System.out.println(patientDetail + "/" + hcgID + "/"
				+ searchValue.length + "/" + searchStatus.length);

		Message<Patient> message = hcgServices.searchPatient(patientDetail,
				hcgID, searchValue, searchStatus);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/search_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> searchDoctor(@RequestParam String doctorDetail,
			@RequestParam Integer hcgID, @RequestParam String[] searchStatus) {
		System.out.println(doctorDetail + "/" + hcgID);

		Message<Doctor> message = hcgServices.searchDoctor(doctorDetail, hcgID,
				searchStatus);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/search_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> searchNurse(@RequestParam String nurseDetails,
			@RequestParam Integer hcgID, @RequestParam String[] searchStatus) {
		System.out.println(nurseDetails + "/" + hcgID);

		Message<Nurse> message = hcgServices.searchNurse(nurseDetails, hcgID,
				searchStatus);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/search_un_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> searchUnPatient(@RequestParam String patientDetail,
			@RequestParam Integer hcgID, @RequestParam String[] searchValue,
			@RequestParam String[] searchStatus) {
		System.out.println(patientDetail + "/" + hcgID + "/"
				+ searchValue.length);

		Message<Patient> message = hcgServices.searchUnPatient(patientDetail,
				hcgID, searchValue, searchStatus);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/check_email", method = RequestMethod.POST)
	public @ResponseBody
	String checkEmail(@RequestParam String email) {
		boolean value = hcgServices.checkEmail(email);

		CheckPassword checkPassword = new CheckPassword();
		checkPassword.setValid(value);

		String result = new Gson().toJson(checkPassword);

		System.out.println(result);

		return result;
	}

	@RequestMapping(value = "/rpms/hcg/get_hcg", method = RequestMethod.POST)
	public @ResponseBody
	Message<HcgOrgnization> getHCGByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<HcgOrgnization> message = hcgServices.getHCGByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/update_hcg_setting", method = RequestMethod.POST)
	public @ResponseBody
	Message<HcgOrgnization> updateHCGSetting(@RequestParam String hcgorganize) {
		System.out.println(hcgorganize);

		Message<HcgOrgnization> message = hcgServices
				.updateHCGSetting(hcgorganize);

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/check_npi", method = RequestMethod.POST)
	public @ResponseBody
	String checkNPI(@RequestParam String npi) {
		boolean value = hcgServices.checkNPI(npi);

		CheckPassword checkPassword = new CheckPassword();
		checkPassword.setValid(value);

		String result = new Gson().toJson(checkPassword);

		System.out.println(result);

		return result;
	}

	@RequestMapping(value = "/rpms/hcg/check_mr", method = RequestMethod.POST)
	public @ResponseBody
	String checkMRNumber(@RequestParam String mr_number) {
		boolean value = hcgServices.checkMRNumber(mr_number);

		CheckPassword checkPassword = new CheckPassword();
		checkPassword.setValid(value);

		String result = new Gson().toJson(checkPassword);

		System.out.println(result);

		return result;
	}

	@RequestMapping(value = "/rpms/hcg/update_patient_categories", method = RequestMethod.POST)
	public @ResponseBody
	Message<HcgOrgnization> updatePatientCategories(
			@RequestParam String hcgorganize) {
		System.out.println(hcgorganize);

		Message<HcgOrgnization> message = hcgServices
				.updatePatientCategories(hcgorganize); 

		return message;
	}

	@RequestMapping(value = "/rpms/hcg/update_physologicaldata", method = RequestMethod.POST)
	public @ResponseBody
	Message updatePhysologicaldata(@RequestParam Double suger,
			@RequestParam Double pressure, @RequestParam Integer hcgID) {
		System.out.println(suger+"/"+pressure+"/"+hcgID);

		Message message = hcgServices
				.updatePhysologicaldata(suger,pressure,hcgID);

		return message;
	}
	
	@RequestMapping(value = "/rpms/hcg/view_blocked_patient_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewBlockedPatientDetails(@RequestParam Integer hcgid,@RequestParam String uservalue) {

		System.out.println(hcgid);

		Message message = hcgServices.viewBlockedPatientDetails(hcgid,uservalue);

		return message;
	}
	
	
	@RequestMapping(value = "/rpms/hcg/view_blocked_nurse_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewBlockedNurseDetails(@RequestParam Integer hcgid,@RequestParam String uservalue) {

		System.out.println(hcgid);

		Message message = hcgServices.viewBlockedNurseDetails(hcgid,uservalue);

		return message;
	}
	
	@RequestMapping(value = "/rpms/hcg/view_blocked_doctor_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewBlockedDoctorDetails(@RequestParam Integer hcgid,@RequestParam String uservalue) {

		System.out.println(hcgid);

		Message message = hcgServices.viewBlockedDoctorDetails(hcgid,uservalue);

		return message;
	}
	
	
	@RequestMapping(value="/rpms/hcg/search_blocked_users", method=RequestMethod.POST)
	public @ResponseBody
	Message searchBlockedUsers(@RequestParam String username ,@RequestParam Integer hcgid){
		System.out.println(username);
		Message  message=hcgServices.searchBlockedUsers(username,hcgid);
		return message;
	}

}
