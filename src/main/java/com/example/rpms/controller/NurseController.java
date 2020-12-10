package com.example.rpms.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.rpms.domain.Count;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.PatientComment;
import com.example.rpms.service.DoctorServices;
import com.example.rpms.service.NurseServices;
import com.example.rpms.service.PatientCommentService;
import com.google.gson.Gson;

@Controller
@Transactional
@SuppressWarnings({ "rawtypes" })
public class NurseController {

	@Autowired
	private NurseServices nurseService;

	@Autowired
	private DoctorServices doctorServices;
	
	@Autowired
	private PatientCommentService patientCommentService;

	@RequestMapping(value = "/rpms/nurse/dashboard_count", method = RequestMethod.POST)
	public @ResponseBody
	Message<Count> dashboardCount(@RequestParam Integer nurseID) {

		Message<Count> message = new Message<Count>();

		Count list = nurseService.dashboardCount(nurseID);

		message.setObject(list);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/view_person_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewPersonDetails(@RequestParam String personID,
			@RequestParam Integer nurseID) {
		System.out.println(personID);

		Message message = nurseService.viewPersonDetails(personID, nurseID);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/get_nurse", method = RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> getNurseByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Nurse> message = nurseService.getNurseByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/send_message_to_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message SendMessageToPatient(@RequestParam String messageTable) {
		System.out.println(messageTable);

		Message message = nurseService.SendMessagePatient(messageTable);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/send_message_for_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message SendMessageForPatient(@RequestParam String messageTable) {
		System.out.println(messageTable);

		Message message = nurseService.SendMessagePatient(messageTable);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/get_assigned_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message getAssignedDoctor(@RequestParam Integer id) {
		System.out.println(id);

		Message message = nurseService.getAssignedDoctor(id);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/get_message_for_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message getMessageForPatient(@RequestParam String messageTable, @RequestParam int initMessage) {
		System.out.println(messageTable);

		Message message = nurseService.getMessageForPatient(messageTable,initMessage);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/get_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message getPatient(@RequestParam Integer id) {
		System.out.println(id);

		Message message = nurseService.getAssignedDoctor(id);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/get_assigned_doctor_name", method = RequestMethod.POST)
	public @ResponseBody
	Message getAssignedDoctorName(@RequestParam Integer id) {
		System.out.println(id);

		Message message = doctorServices.getDoctorByID(id);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/view_search_person_details", method = RequestMethod.POST)
	public @ResponseBody
	Message viewSearchPersonDetails(@RequestParam String patientDetail,
			@RequestParam String personID, @RequestParam Integer nurseID,
			@RequestParam String[] searchValue,
			@RequestParam String[] searchStatus) {
		System.out.println(personID + "/" + nurseID + "/" + searchValue.length
				+ "/" + patientDetail);

		Message message = nurseService.viewSearchPersonDetails(patientDetail,
				personID, nurseID, searchValue, searchStatus);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/unread_message", method = RequestMethod.POST)
	public @ResponseBody
	Message UnReadMessage(@RequestParam Integer id) {
		System.out.println(id);

		Message message = nurseService.UnReadMessage(id);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/read_message", method = RequestMethod.POST)
	public @ResponseBody
	Message ReadMessage(@RequestParam String messageTable) {
		System.out.println(messageTable);

		Message message = nurseService.ReadMessage(messageTable);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/get_all_doctor", method = RequestMethod.POST)
	public @ResponseBody
	Message getAllDoctor(@RequestParam Integer id) {
		System.out.println(id);

		Message message = nurseService.getAllDoctor(id);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/hcg_admin", method = RequestMethod.POST)
	public @ResponseBody
	Message getHCGDetails(@RequestParam Integer hcgID) {
		System.out.println(hcgID);

		Message message = nurseService.getHCGDetails(hcgID);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/getpatientdata", method = RequestMethod.POST)
	public @ResponseBody
	Message getPatientData(@RequestParam Integer patientID,
			@RequestParam String datatype) {
		System.out.println(patientID + "/" + datatype);

		Message message = nurseService.getPatientData(patientID, datatype);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/datapointcomment", method = RequestMethod.POST)
	public @ResponseBody
	Message dataPointComment(@RequestParam String comment) {
		System.out.println(comment);

		Message message = nurseService.dataPointComment(comment);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/getdatapointcomment", method = RequestMethod.POST)
	public @ResponseBody
	Message getDataPointComment(@RequestParam String comment) {
		System.out.println(comment);

		Message message = nurseService.getDataPointComment(comment);

		return message;
	}

	@RequestMapping(value = "/rpms/nurse/getdatapoint", method = RequestMethod.POST)
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

	@RequestMapping(value = "/rpms/nurse/deletedatapoint", method = RequestMethod.POST)
	public @ResponseBody
	Message deleteDataPoint(@RequestParam Integer dataPointId) {

		System.out.println(dataPointId);

		Message message = nurseService.deleteDataPoint(dataPointId);

		return message;
	}
	
	@RequestMapping(value = "/rpms/nurse/getpatientdata_withtime", method = RequestMethod.POST)
	public @ResponseBody
	Message getPatientDataWithTime(@RequestParam Integer patientID,
			@RequestParam String datatype,@RequestParam long current,@RequestParam long last,@RequestParam String status) {
		System.out.println(patientID + "/" + datatype+"/"+""+current+"/"+last+"/"+status);
		
		Message message = nurseService.getPatientDataWithTime(patientID, datatype,current,last,status);

		return message;
	}
	
	@RequestMapping(value = "/rpms/nurse/updatePatientDataComment", method = RequestMethod.POST)
	public @ResponseBody
	Message updatePatientDataComment(@RequestParam Integer id,@RequestParam String status,@RequestParam Integer nurseID) {
		System.out.println(id + "/" + status);
		
		Message message = nurseService.updatePatientDataComment(id,status,nurseID);

		return message;
	}


	@RequestMapping(value = "/rpms/nurse/assignedPatientWithProblematicData", method = RequestMethod.POST)
	public @ResponseBody
	Message assignedPatientWithProblematicData(@RequestParam Integer id) {
		System.out.println(id);
		
		Message message = nurseService.assignedPatientWithProblematicData(id);

		return message;
	}
	
	@RequestMapping(value="/rpms/nurse/patientOfUnreadDataPoints", method = RequestMethod.POST)
	public @ResponseBody
	Message patientOfUnreadDataPoints(@RequestParam Integer id){
		System.out.println(id);
		
		Message message=nurseService.patientOfUnreadDataPoints(id);
		
		return message;
	}
	
	@RequestMapping(value = "/rpms/nurse/getpatientcomment", method = RequestMethod.POST)
	public @ResponseBody
	Message getpatientcomment(@RequestParam Integer index, @RequestParam Integer patientid) {

		Message message = patientCommentService.getPatientComment(index, patientid);

		return message;
	}
	
	@RequestMapping(value = "/rpms/nurse/savepatientcomment", method = RequestMethod.POST)
	public @ResponseBody
	Message savepatientcomment(@RequestParam String comment) {
		PatientComment pc = new Gson().fromJson(comment, PatientComment.class);
		pc.setInsertdate(new Date());
		Message message = patientCommentService.savePatientComment(pc);

		return message;
	}
	
	
	/*@RequestMapping(value = "/rpms/users/get_name", method = RequestMethod.GET)
	public @ResponseBody
	Message getNameDetails(@RequestParam Integer id,@RequestParam String type) {
		System.out.println(id);

		Message message=new Message();	
		if(type.equals("nurse")){
		
			message = nurseService.getNurseDetails(id);		
		}
		if(type.equals("doctor")){
			
			message=doctorServices.getDoctorDetails(id);
		}
		 

		return message;
	}*/

}
