package com.example.rpms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.MessageTable;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.service.DoctorServices;
import com.example.rpms.service.PatientServices;

@Controller
public class PatientController {

	@Autowired
	private PatientServices patientServices;
	
	@Autowired
	private DoctorServices doctorService;
	
	@RequestMapping(value = "/rpms/patient/dashboard_count", method = RequestMethod.POST)
	public @ResponseBody
	Message<Count> dashboardCount(@RequestParam Integer patientID) {

		Message<Count> message = new Message<Count>();

		Count list = patientServices.dashboardCount(patientID);

		message.setObject(list);

		return message;
	}

	@RequestMapping(value="/rpms/patient/get_patient",method=RequestMethod.POST)
	public @ResponseBody
	Message<Patient> getPatientByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Patient> message = patientServices.getPatientByID(id);

		return message;
	}
	
	@RequestMapping(value="/rpms/patient/get_doctor",method=RequestMethod.POST)
	public @ResponseBody
	Message<Doctor> getDoctorByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Doctor> message = patientServices.getDoctorByID(id);

		return message;
	}
	
	@RequestMapping(value="/rpms/patient/get_nurse",method=RequestMethod.POST)
	public @ResponseBody
	Message<Nurse> getNurseByID(@RequestParam Integer id) {
		System.out.println(id);

		Message<Nurse> message = patientServices.getNurseByID(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/get_message_for_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<MessageTable> getMessageForPatient(@RequestParam String messageTable, @RequestParam int initMessage) {
		System.out.println(messageTable);
		
		Message<MessageTable> message = patientServices.getMessageForPatient(messageTable,initMessage);
		
		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/send_message_for_patient", method = RequestMethod.POST)
	public @ResponseBody
	Message<MessageTable> SendMessageForAssigner(@RequestParam String messageTable) {
		System.out.println(messageTable);
		
		Message<MessageTable> message = patientServices.SendMessageForAssigner(messageTable);
		
		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/unread_message", method = RequestMethod.POST)
	public @ResponseBody
	Message UnReadMessage(@RequestParam Integer id) {
		System.out.println(id);

		Message message = patientServices.UnReadMessage(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/read_message", method = RequestMethod.POST)
	public @ResponseBody
	Message ReadMessage(@RequestParam String messageTable) {
		System.out.println(messageTable);

		Message message = patientServices.ReadMessage(messageTable);

		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/hcg_admin", method = RequestMethod.POST)
	public @ResponseBody
	Message getHCGDetails(@RequestParam Integer hcgID) {
		System.out.println(hcgID);

		Message message = patientServices.getHCGDetails(hcgID);

		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/patientWithphyoslogicAllData", method = RequestMethod.POST)
	public @ResponseBody
	Message patientWithphyoslogicAllData(@RequestParam Integer id) {
		System.out.println(id);
		
		Message message = patientServices.patientWithphyoslogicAllData(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/patientWithProblematicData", method = RequestMethod.POST)
	public @ResponseBody
	Message patientWithProblematicData(@RequestParam Integer id) {
		System.out.println(id);
		
		Message message = patientServices.patientWithProblematicData(id);

		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/getpatientdata_withtime", method = RequestMethod.POST)
	public @ResponseBody 
	Message getPatientDataWithTime(@RequestParam Integer patientID,
			@RequestParam String datatype,@RequestParam long current,@RequestParam long last,@RequestParam String status) {
		System.out.println(patientID + "/" + datatype+"/"+""+current+"/"+last+"/"+status);
		
		Message message = doctorService.getPatientDataWithTime(patientID, datatype,current,last,status);

		return message;
	}
	
	@RequestMapping(value = "/rpms/patient/getpatientproblematicdata_withtime", method = RequestMethod.POST)
	public @ResponseBody 
	Message getPatientProblematicDataWithTime(@RequestParam Integer patientID,
			@RequestParam String datatype,@RequestParam long current,@RequestParam long last,@RequestParam String status) {
		System.out.println(patientID + "/" + datatype+"/"+""+current+"/"+last+"/"+status);
		
		Message message = doctorService.getPatientProblematicDataWithTime(patientID, datatype,current,last,status);

		return message;
	}
	

}
