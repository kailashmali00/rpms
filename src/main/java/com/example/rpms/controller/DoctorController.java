package com.example.rpms.controller;

//import java.util.Date;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.MessageTable;
import com.example.rpms.domain.PatientComment;
import com.example.rpms.service.DoctorServices;
import com.example.rpms.service.NurseServices;
import com.example.rpms.service.PatientCommentService;
import com.google.gson.Gson;

@Controller
@Transactional
@SuppressWarnings({ "rawtypes" })
public class DoctorController {

	@Autowired
	private DoctorServices doctorService;

	@Autowired
	private NurseServices nurseServices;
	
	@Autowired
	private PatientCommentService patientCommentService;

	@RequestMapping(value = "/rpms/doc/dashboard_count", method = RequestMethod.POST)
	public @ResponseBody
	Message<Count> dashboardCount(@RequestParam Integer docID) {

		Message<Count> message = new Message<Count>();

		Count list = doctorService.dashboardCount(docID);

		message.setObject(list);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/view_person_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewPersonDetails(@RequestParam String personID,
			@RequestParam Integer docID) {
		System.out.println(personID);

		Message message = doctorService.viewPersonDetails(personID, docID);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/get_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> getDoctorByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Doctor> message = doctorService.getDoctorByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/send_message_to_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message SendMessageToPatient(@RequestParam String messageTable) {
		System.out.println(messageTable);

		Message message = doctorService.SendMessagePatient(messageTable);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/send_message_for_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message SendMessageForPatient(@RequestParam String messageTable) {
		System.out.println(messageTable);

		Message message = doctorService.SendMessagePatient(messageTable);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/get_assigned_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message getAssignedNurse(@RequestParam Integer id) {
		System.out.println(id);

		Message message = doctorService.getAssignedNurse(id);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/get_message_for_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message getMessageForPatient(@RequestParam String messageTable, @RequestParam int initMessage) {
		Message message = doctorService.getMessageForPatient(messageTable,initMessage);
		return message;
	}

	@RequestMapping(value = "/rpms/doc/get_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message getPatient(@RequestParam Integer id) {
		System.out.println(id);

		Message message = doctorService.getAssignedNurse(id);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/get_assigned_nurse_name", method = RequestMethod.POST)
	public @ResponseBody
	Message getAssignedNurseName(@RequestParam Integer id) {
		System.out.println(id);

		Message message = nurseServices.getNurseByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/view_search_person_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewSearchPersonDetails(@RequestParam String patientDetail,
			@RequestParam String personID, @RequestParam Integer docID,
			@RequestParam String[] searchValue,
			@RequestParam String[] searchStatus) {
		System.out.println(personID + "/" + docID + "/" + searchValue.length
				+ "/" + patientDetail + "/" + searchStatus.length);

		Message message = doctorService.viewSearchPersonDetails(patientDetail,
				personID, docID, searchValue, searchStatus);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/unread_message", method = RequestMethod.POST)
	public @ResponseBody
	Message UnReadMessage(@RequestParam Integer id) {
		System.out.println(id);

		Message message = doctorService.UnReadMessage(id);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/read_message", method = RequestMethod.POST)
	public @ResponseBody
	Message ReadMessage(@RequestParam String messageTable) {

		Message message = doctorService.ReadMessage(messageTable);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/update_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message updatePatient(@RequestParam String patient) {

		Message message = doctorService.updatePatient(patient);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/get_all_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message getAllNurse(@RequestParam Integer id) {

		Message message = doctorService.getAllNurse(id);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/hcg_admin", method = RequestMethod.POST)
	public @ResponseBody
	Message getHCGDetails(@RequestParam Integer hcgID) {
		System.out.println(hcgID);

		Message message = doctorService.getHCGDetails(hcgID);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/getpatientdata", method = RequestMethod.POST)
	public @ResponseBody
	Message getPatientData(@RequestParam Integer patientID,
			@RequestParam String datatype) {
		System.out.println(patientID + "/" + datatype);

		Message message = doctorService.getPatientData(patientID, datatype);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/datapointcomment", method = RequestMethod.POST)
	public @ResponseBody
	Message dataPointComment(@RequestParam String comment) {
		System.out.println(comment);

		Message message = doctorService.dataPointComment(comment);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/getdatapointcomment", method = RequestMethod.POST)
	public @ResponseBody
	Message getDataPointComment(@RequestParam String comment) {
		System.out.println(comment);

		Message message = doctorService.getDataPointComment(comment);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/getdatapoint", method = RequestMethod.POST)
	public @ResponseBody
	Message getDataPoint(@RequestParam Integer patientID,
			@RequestParam Integer docID, @RequestParam Integer dataPointId,
			@RequestParam String mr_number, @RequestParam String status,
			@RequestParam String datatype) {

		Message message = doctorService.getDataPoint(patientID, docID,
				dataPointId, mr_number, status,datatype);

		return message;
	}

	@RequestMapping(value = "/rpms/doc/deletedatapoint", method = RequestMethod.POST)
	public @ResponseBody
	Message deleteDataPoint(@RequestParam Integer dataPointId) {
		Message message = doctorService.deleteDataPoint(dataPointId);
		return message;
	}
	
	@RequestMapping(value = "/rpms/doc/getpatientdata_withtime", method = RequestMethod.POST)
	public @ResponseBody 
	Message getPatientDataWithTime(@RequestParam Integer patientID,
			@RequestParam String datatype,@RequestParam long current,@RequestParam long last,@RequestParam String status) {
		Message message = doctorService.getPatientDataWithTime(patientID, datatype,current,last,status);

		return message;
	}
	
	@RequestMapping(value = "/rpms/doc/updatePatientDataComment", method = RequestMethod.POST)
	public @ResponseBody
	Message updatePatientDataComment(@RequestParam Integer id,@RequestParam String status,@RequestParam Integer docID) {
		Message message = doctorService.updatePatientDataComment(id,status,docID);

		return message;
	}
	
	
	@RequestMapping(value = "/rpms/doc/assignedPatientWithProblematicData", method = RequestMethod.POST)
	public @ResponseBody
	Message assignedPatientWithProblematicData(@RequestParam Integer id) {
		Message message = doctorService.assignedPatientWithProblematicData(id);

		return message;
	}
	
	@RequestMapping(value="/rpms/doc/patientOfUnreadDataPoints", method = RequestMethod.POST)
	public @ResponseBody
	Message patientOfUnreadDataPoints(@RequestParam Integer id){
		Message message=doctorService.patientOfUnreadDataPoints(id);
		return message;
	}
	

	@RequestMapping(value = "/rpms/doc/getpatientcomment", method = RequestMethod.POST)
	public @ResponseBody
	Message getpatientcomment(@RequestParam Integer index, @RequestParam Integer patientid) {

		Message message = patientCommentService.getPatientComment(index, patientid);

		return message;
	}
	
	@RequestMapping(value = "/rpms/doc/savepatientcomment", method = RequestMethod.POST)
	public @ResponseBody
	Message savepatientcomment(@RequestParam String comment) {
		PatientComment pc = new Gson().fromJson(comment, PatientComment.class);
		pc.setInsertdate(new Date());
		Message message = patientCommentService.savePatientComment(pc);
		return message;
	}
	

}
