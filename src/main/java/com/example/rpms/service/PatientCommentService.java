package com.example.rpms.service;

import java.lang.annotation.Documented;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.example.rpms.dao.PatientCommentDao;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.PatientComment;

@Component
@Transactional
@SuppressWarnings({ "unchecked", "rawtypes" })
public class PatientCommentService {
  
	@Autowired
	PatientCommentDao dao;
	@Autowired
	NurseServices nurseService;
	@Autowired
	DoctorServices doctorService;
	
	public Message savePatientComment(PatientComment pc) {
	     Message<PatientComment> message = new Message<PatientComment>();
	     
	     boolean b = dao.saveComment(pc);
	     if(b==true)
	    	 message.setMessage("Patient Comment Saved Successfully");
	     else
	    	 message.setMessage("Something issue with server, Please try later.");
	     
	     return message;
	}
	
	public Message getPatientComment(int index, int patientid) {
	     Message<PatientComment> message = new Message<PatientComment>();
	     List<PatientComment> lpc = dao.getPatientCommnet(index, patientid);	
	     for(PatientComment pc : lpc){
	    	 if(pc.getDocid()!=null){
	    		 
	    		 pc.setName(doctorService.getDoctorDetails(pc.getDocid()));
	    	 }
	    	 else if(pc.getNurseid()!=null){
	    		 pc.setName(nurseService.getNurseDetails(pc.getNurseid()));
	    	 }
	     }
	     message.setListentity(lpc);	     
	     return message;
	}
	
	
}
