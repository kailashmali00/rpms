package com.example.rpms.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.example.rpms.dao.DoctorDao;
import com.example.rpms.dao.HCGDao;
import com.example.rpms.dao.NurseDao;
import com.example.rpms.dao.PatientDao;
import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.HcgOrgnization;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.MessageTable;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.PatientData;
import com.example.rpms.domain.PatientPhysiologicalData;
import com.google.gson.Gson;

@Component
@Transactional
public class PatientServices {

	@Autowired
	private PatientDao patientDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private NurseDao nurseDao;
	
	@Autowired
	private HCGDao hcgDao;

	public Count dashboardCount() {

		Count count = patientDao.dashboardCount();

		if (count == null) {
			count = new Count();
			return count;
		}

		return count;
	}

	public Message<Patient> getPatientByID(Integer id) {
		Message<Patient> message = new Message<Patient>();

		Patient patient = patientDao.getPatietByID(id);

		if (patient != null) {
			message.setObject(patient);

			return message;
		}
		message.setMessage("Patient Not Found");
		return message;
	}
	
	public Patient getPatientByMR(String mrid) {
		
		return patientDao.getPatietByMR(mrid);
	}

	public Message<Doctor> getDoctorByID(Integer id) {
		Message<Doctor> message = new Message<Doctor>();

		Doctor doctor = doctorDao.getDoctorByID(id);

		if (doctor != null) {
			message.setObject(doctor);

			return message;
		}
		message.setMessage("Doctor Not Found");
		return message;
	}

	public Message<Nurse> getNurseByID(Integer id) {
		Message<Nurse> message = new Message<Nurse>();

		Nurse nurse = nurseDao.getNurseByID(id);

		if (nurse != null) {
			message.setObject(nurse);

			return message;
		}
		message.setMessage("Patient Not Found");
		return message;
	}

	public Message<MessageTable> getMessageForPatient(String messageTable, int msgcount) {
		Message<MessageTable> message = new Message<MessageTable>();

		MessageTable createMessageTable = new Gson().fromJson(messageTable,
				MessageTable.class);

		message.setListentity(patientDao
				.getMessageForPatient(createMessageTable,msgcount));

		message.setMessage("Message has been send successfully.");

		return message;
	}

	public Message<MessageTable> SendMessageForAssigner(String messageTable) {
		Message<MessageTable> message = new Message<MessageTable>();

		MessageTable createMessageTable = new Gson().fromJson(messageTable,
				MessageTable.class);
		createMessageTable.setCreatedAT(new Date());
		createMessageTable.setUpdatedAT(new Date());
		createMessageTable.setEntryTime(new Date());
		createMessageTable.setIsSentPatient(1);
		createMessageTable.setIsDeleted(0);

		boolean flag = patientDao.save(createMessageTable);

		if (flag) {
			message.setMessage("Message has been send successfully.");
			return message;
		}

		message.setMessage("Message not send successfully.");
		return message;
	}

	public Message UnReadMessage(Integer id) {
		Message<MessageTable> message = new Message<>();

		try {
			List<MessageTable> list = patientDao.UnReadMessage(id);
			if (list != null) {
				Map<String, MessageTable> map=new HashMap<>();
				
				for (MessageTable messageTable : list) {
					map.put(messageTable.getDocID()+" "+messageTable.getPatientID()+" "+messageTable.getNurseID(), messageTable);
				}
				
				List<MessageTable> messageTables=new ArrayList<>(map.values());
				
				message.setListentity(list);
				message.setTable(messageTables);
			}

			message.setMessage("Read Message");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("Not Found Any Unread Message");
		}
		return message;
	}

	public Message ReadMessage(String messageTable) {
		Message<MessageTable> message = new Message<MessageTable>();

		MessageTable createMessageTable = new Gson().fromJson(messageTable,
				MessageTable.class);
		
		if(createMessageTable.getNurseID() == null)
		{
			patientDao.updateReadMessageDoctor(createMessageTable.getDocID(),createMessageTable.getPatientID());
			
			message.setMessage("Read Message Updated");
			return message;
		}
		else{
			patientDao.updateReadMessageNurse(createMessageTable.getPatientID(),createMessageTable.getNurseID());
			message.setMessage("Read Message Updated");
			return message;
		}
	}

	public Count dashboardCount(Integer patientID) {
		
		Patient patient = patientDao.getPatietByID(patientID);
		
		if(patient!= null)
		{

			Count count = patientDao.dashboardCount(patient.getHcgID(),patient.getId(),patient.getDocID(),patient.getNurseID());

			if (count == null) {
				count = new Count();
				return count;
			}
			
			return count;
		}
		
		return null;
	}

	public Message getHCGDetails(Integer hcgID) {
		Message<PatientData> message = new Message<PatientData>();

		HcgOrgnization hcgOrgnization = hcgDao.getHCGByID(hcgID);

		if (hcgOrgnization != null) {

			PatientData oldPatient = new PatientData();
			oldPatient.setBloodPressure(hcgOrgnization.getBloodPresure());
			oldPatient.setBloodSugar(hcgOrgnization.getGulcose());
			
			oldPatient.setBloodPressureMax(hcgOrgnization.getBloodPresureMax());
			oldPatient.setBloodSugarMax(hcgOrgnization.getGulcoseMax());
			
			oldPatient.setDateformat(hcgOrgnization.getDateformat());

			message.setObject(oldPatient);
			message.setMessage("hcg has been updated successfully.");
			return message;
		}

		message.setMessage("hcg not updated.");
		return message;
	}

	public Message patientWithphyoslogicAllData(Integer id) {
		Message message = new Message();

		List<PatientPhysiologicalData> physiologicalData = patientDao.patientWithphyoslogicAllData(id);

		if (physiologicalData != null && physiologicalData.size()>0) {
				
				message.setListentity(physiologicalData);
				message.setValid(true);
				return message;
		}

		message.setValid(false);
		return message;
	}

	public Message patientWithProblematicData(Integer id) {
		Message message = new Message();

		List<PatientPhysiologicalData> physiologicalData = patientDao.patientWithProblematicData(id);

		if (physiologicalData != null) {
				
				message.setListentity(physiologicalData);
				message.setValid(true);
				return message;
			
		}

		message.setValid(false);
		return message;
	}
}
