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
import com.example.rpms.domain.SuperAdmin;
import com.example.rpms.service.DoctorServices;
import com.example.rpms.service.HCGServices;
import com.example.rpms.service.NurseServices;
import com.example.rpms.service.SuperAdminService;
import com.google.gson.Gson;


@Controller
public class SuperAdminController {
	
	@Autowired
	private SuperAdminService superAdminService;
	
	@Autowired
	private HCGServices hcgService;
	
	@Autowired
	private DoctorServices doctorService;
	
	@Autowired
	private NurseServices nurseService;
	
	@RequestMapping(value = "/rpms/superadmin/dashboard_count", method = RequestMethod.POST)
	public @ResponseBody
	Message<Count> dashboardCount(@RequestParam Integer adminID) {

		Message<Count> message = new Message<Count>();

		Count list = superAdminService.dashboardCount(adminID);

		message.setObject(list);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_admin", method = RequestMethod.POST)
	public @ResponseBody
	Message<SuperAdmin> getSuperAdminByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<SuperAdmin> message = superAdminService.getSuperAdminByID(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/view_person_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewPersonDetails(@RequestParam String personID,
			@RequestParam Integer adminID) {
		System.out.println(personID + "/" + adminID);

		Message message = superAdminService.viewPersonDetails(personID, adminID);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/search_hcgadmin", method = RequestMethod.POST)
	public @ResponseBody
	Message<HcgOrgnization> searchHCGAdmin(@RequestParam String hcgDetail,
			@RequestParam Integer adminID,@RequestParam String[] searchStatus) {
		System.out.println(hcgDetail + "/" + adminID);

		Message<HcgOrgnization> message = superAdminService.searchHCGAdmin(hcgDetail, adminID,searchStatus);

		return message; 
	}
	
	@RequestMapping(value = "/rpms/superadmin/create_hcgadmin", method = RequestMethod.POST)
	public @ResponseBody
	Message<HcgOrgnization> createHCGAdmin(@RequestParam String hcgOrgnization,
			@RequestParam String client_url) {
		System.out.println(hcgOrgnization);

		Message<HcgOrgnization> message = superAdminService.createHCGAdmin(hcgOrgnization, client_url);
		

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/check_email", method = RequestMethod.POST)
	public @ResponseBody
	String checkEmail(@RequestParam String email) {
		boolean value = superAdminService.checkEmail(email);

		CheckPassword checkPassword = new CheckPassword();
		checkPassword.setValid(value);

		String result = new Gson().toJson(checkPassword);

		System.out.println(result);

		return result;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_hcgadmin", method = RequestMethod.POST)
	public @ResponseBody
	Message<HcgOrgnization> getHCGAdminByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<HcgOrgnization> message = superAdminService.getHCGAdminByID(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_all_hcgadmin", method = RequestMethod.POST)
	public @ResponseBody
	Message<HcgOrgnization> getAllHCGAdminByID() {

		Message<HcgOrgnization> message = superAdminService.getAllHCGAdminByID();

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/update_hcgadmin", method = RequestMethod.POST)
	public @ResponseBody
	Message<HcgOrgnization> updateHCGAdmin(@RequestParam String hcgOrgnization) {
		System.out.println(hcgOrgnization);

		Message<HcgOrgnization> message = superAdminService.updateHCGAdmin(hcgOrgnization);
		

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/update_superadmin", method = RequestMethod.POST)
	public @ResponseBody
	Message<SuperAdmin> updateSuperAdmin(@RequestParam String superadmin) {
		System.out.println(superadmin);

		Message<SuperAdmin> message = superAdminService.updateSuperAdmin(superadmin);
		

		return message;
	}
	
	
	@RequestMapping(value = "/rpms/superadmin/create_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> createPatient(@RequestParam String patient,
			@RequestParam String client_url) {
		System.out.println(patient + "" + client_url);

		Message<Patient> message = superAdminService.createPatient(patient,
				client_url);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/create_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> createDoctor(@RequestParam String doctor,
			@RequestParam String client_url) {
		System.out.println(doctor);

		Message<Doctor> message = superAdminService.createDoctor(doctor, client_url);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/create_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> createNurse(@RequestParam String nurse,
			@RequestParam String client_url) {
		System.out.println(nurse);

		Message<Nurse> message = superAdminService.createNurse(nurse, client_url);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/check_npi", method = RequestMethod.POST)
	public @ResponseBody
	String checkNPI(@RequestParam String npi) {
		boolean value = hcgService.checkNPI(npi);

		CheckPassword checkPassword = new CheckPassword();
		checkPassword.setValid(value);

		String result = new Gson().toJson(checkPassword);

		System.out.println(result);

		return result;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_all_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> getAllDoctor(@RequestParam Integer hcgID) {

		Message<Doctor> message = hcgService.getAllDoctor(hcgID);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/get_all_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> getAllNurse(@RequestParam Integer hcgID) {

		Message<Nurse> message = hcgService.getAllNurse(hcgID);

		return message;
	}
	
	
	@RequestMapping(value = "/rpms/superadmin/get_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> getPatietByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Patient> message = hcgService.getPatietByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/get_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> getDoctorByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Doctor> message = hcgService.getDoctorByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/get_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> getNurseByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Nurse> message = hcgService.getNurseByID(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/update_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> updatePatient(@RequestParam String patient) {
		System.out.println(patient);

		Message<Patient> message = superAdminService.updatePatient(patient);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/update_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> updateDoctor(@RequestParam String doctor) {
		System.out.println(doctor);

		Message<Doctor> message = superAdminService.updateDoctor(doctor);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/update_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> updateNurse(@RequestParam String nurse) {
		System.out.println(nurse);

		Message<Nurse> message = superAdminService.updateNurse(nurse);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/search_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> searchPatient(@RequestParam String patientDetail,
			@RequestParam Integer hcgID, @RequestParam String[] searchValue,
			@RequestParam String[] searchStatus) {
		System.out.println(patientDetail + "/" + hcgID + "/"
				+ searchValue.length + "/" + searchStatus.length);

		Message<Patient> message = hcgService.searchPatient(patientDetail,
				hcgID, searchValue, searchStatus);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/search_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> searchDoctor(@RequestParam String doctorDetail,
			@RequestParam Integer hcgID, @RequestParam String[] searchStatus) {
		System.out.println(doctorDetail + "/" + hcgID);

		Message<Doctor> message = hcgService.searchDoctor(doctorDetail, hcgID,
				searchStatus);

		return message;
	}

	@RequestMapping(value = "/rpms/superadmin/search_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> searchNurse(@RequestParam String nurseDetails,
			@RequestParam Integer hcgID, @RequestParam String[] searchStatus) {
		System.out.println(nurseDetails + "/" + hcgID);

		Message<Nurse> message = hcgService.searchNurse(nurseDetails, hcgID,
				searchStatus);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/getall_assigned_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<Patient> getAllAssignedPatient(@RequestParam Integer id,@RequestParam String status) {
		System.out.println(id + "/" + status);

		Message<Patient> message = superAdminService.getAllAssignedPatient(id, status);
		

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/getpatientdata", method = RequestMethod.POST)
	public @ResponseBody
	Message getPatientData(@RequestParam Integer patientID,
			@RequestParam String datatype) {
		System.out.println(patientID + "/" + datatype);

		Message message = doctorService.getPatientData(patientID, datatype);

		return message;
	}
	

	@RequestMapping(value = "/rpms/superadmin/hcg_admin", method = RequestMethod.POST)
	public @ResponseBody
	Message getHCGDetails(@RequestParam Integer hcgID) {
		System.out.println(hcgID);

		Message message = doctorService.getHCGDetails(hcgID);

		return message;
	}
	
	
	
	@RequestMapping(value = "/rpms/superadmin/get_super_admin", method = RequestMethod.POST)
	public @ResponseBody
	Message getSuperAdminDetails(@RequestParam String username) {
		System.out.println(username);

		Message message = superAdminService.getSuperAdminDetails(username);

		return message;
	}
	
	
	@RequestMapping(value = "/rpms/superadmin/get_assigned_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message getAssignedNurse(@RequestParam Integer id) {
		System.out.println(id);

		Message message = doctorService.getAssignedNurse(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_assigned_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message getAssignedDoctor(@RequestParam Integer id) {
		System.out.println(id);

		Message message = nurseService.getAssignedDoctor(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_assigned_nurse_name", method = RequestMethod.POST)
	public @ResponseBody
	Message getAssignedNurseName(@RequestParam Integer id) {
		System.out.println(id);

		Message message = nurseService.getNurseByID(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_assigned_doctor_name", method = RequestMethod.POST)
	public @ResponseBody
	Message getAssignedDoctorName(@RequestParam Integer id) {
		System.out.println(id);

		Message message = doctorService.getDoctorByID(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_message_for_patient_doc", method = RequestMethod.POST)
	public @ResponseBody
	Message getMessageForPatientDoc(@RequestParam String messageTable, @RequestParam int initMessage) {
		System.out.println(messageTable);

		Message message = doctorService.getMessageForPatient(messageTable,initMessage);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/get_message_for_patient_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message getMessageForPatientNurse(@RequestParam String messageTable, @RequestParam int initMessage) {
		System.out.println(messageTable);

		Message message = nurseService.getMessageForPatient(messageTable,initMessage);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/getpatientdata_withtime_doc", method = RequestMethod.POST)
	public @ResponseBody
	Message getPatientDataWithTimeDoc(@RequestParam Integer patientID,
			@RequestParam String datatype,@RequestParam long current,@RequestParam long last,@RequestParam String status) {
		System.out.println(patientID + "/" + datatype+"/"+""+current+"/"+last+"/"+status);
		
		Message message = doctorService.getPatientDataWithTime(patientID, datatype,current,last,status);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/getpatientdata_withtime_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message getPatientDataWithTime(@RequestParam Integer patientID,
			@RequestParam String datatype,@RequestParam long current,@RequestParam long last,@RequestParam String status) {
		System.out.println(patientID + "/" + datatype+"/"+""+current+"/"+last+"/"+status);
		
		Message message = nurseService.getPatientDataWithTime(patientID, datatype,current,last,status);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/getdatapoint_doc", method = RequestMethod.POST)
	public @ResponseBody
	Message getDataPoint_doc(@RequestParam Integer patientID,
			@RequestParam Integer docID, @RequestParam Integer dataPointId,
			@RequestParam String mr_number, @RequestParam String status,
			@RequestParam String datatype) {

		System.out.println(patientID + "/" + docID + "/" + dataPointId + "/"
				+ mr_number + "/" + status+"/"+datatype);

		Message message = doctorService.getDataPoint(patientID, docID,
				dataPointId, mr_number, status,datatype);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/getdatapoint_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message getDataPoint(@RequestParam Integer patientID,
			@RequestParam Integer nurseID, @RequestParam Integer dataPointId,
			@RequestParam String mr_number, @RequestParam String status,
			@RequestParam String datatype) {

		System.out.println(patientID + "/" + nurseID + "/" + dataPointId + "/"
				+ mr_number + "/" + status+"/"+datatype);

		Message message = nurseService.getDataPoint(patientID, nurseID,
				dataPointId, mr_number, status,datatype);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/getdatapointcomment_doc", method = RequestMethod.POST)
	public @ResponseBody
	Message getDataPointComment_doc(@RequestParam String comment ) {
		System.out.println(comment);

		Message message = doctorService.getDataPointComment(comment);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/getdatapointcomment_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message getDataPointComment_nurse(@RequestParam String comment) {
		System.out.println(comment);

		Message message = nurseService.getDataPointComment(comment);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/deletedatapoint_doc", method = RequestMethod.POST)
	public @ResponseBody
	Message deleteDataPoint_doc(@RequestParam Integer dataPointId) {

		System.out.println(dataPointId);

		Message message = doctorService.deleteDataPoint(dataPointId);

		return message;
	}
	
	@RequestMapping(value = "/rpms/superadmin/deletedatapoint_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message deleteDataPoint(@RequestParam Integer dataPointId) {

		System.out.println(dataPointId);

		Message message = nurseService.deleteDataPoint(dataPointId);

		return message;
	}
	@RequestMapping(value = "/rpms/superadmin/view_blocked_user_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewBlockedUserDetails(@RequestParam boolean status) {

		System.out.println(status);

		Message message = superAdminService.viewBlockedUserDetails();

		return message;
	}
	@RequestMapping(value="/rpms/superadmin/search_blocked_users", method=RequestMethod.POST)
	public @ResponseBody
	Message searchBlockedUsers(@RequestParam String username){
		System.out.println(username);
		Message  message=superAdminService.searchBlockedUsers(username);
		return message;
	}

}
