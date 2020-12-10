package com.example.rpms.service;

import java.text.SimpleDateFormat;
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
import com.example.rpms.domain.Comments;
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
@SuppressWarnings({ "unchecked", "rawtypes" })
public class NurseServices {

	@Autowired
	private PatientDao patientDao;

	@Autowired
	private NurseDao nurseDao;

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private HCGDao hcgDao;

	public Message viewPersonDetails(String personID, Integer nurseID) {

		if (personID.equals("assingedpatient")) {
			Message message = new Message<>();
			message.setListentity(patientDao.assignedPatientForNurse(nurseID));
			return message;
		} else if (personID.equals("patient")) {

			Nurse nurse = nurseDao.getNurseByID(nurseID);

			Message message = new Message<>();
			if (nurse != null) {
				message.setListentity(patientDao.viewPatient(nurse.getHcgID(),
						"nurse"));
			}
			return message;
		} else {
			Message message = new Message<>();
			message.setMessage("There is some error occurred. So please check it carefully.");
			return message;
		}
	}

	public Count dashboardCount(Integer nurseID) {

		Count count = nurseDao.dashboardCount(nurseID);

		if (count == null) {
			count = new Count();
			return count;
		}

		return count;
	}

	public Message<Nurse> getNurseByID(Integer id) {
		Message<Nurse> message = new Message<Nurse>();

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

	public String getNurseDetails(Integer id){
		
		//Message message = new Message();

			List<Nurse> list=nurseDao.getNurseByPatientId(id);
			return (list.get(0).getFirstname()+" "+list.get(0).getLastname());
		//return message;
		
	}
	
	
	public Message SendMessagePatient(String messageTable) {
		Message<MessageTable> message = new Message<MessageTable>();

		MessageTable createMessageTable = new Gson().fromJson(messageTable,
				MessageTable.class);
		createMessageTable.setCreatedAT(new Date());
		createMessageTable.setUpdatedAT(new Date());
		createMessageTable.setEntryTime(new Date());
		createMessageTable.setIsSentNures(1);
		createMessageTable.setIsDeleted(0);

		boolean flag = nurseDao.save(createMessageTable);

		if (flag) {
			message.setMessage("Message has been send successfully.");
			return message;
		}

		message.setMessage("Message not send successfully.");
		return message;
	}

	public Message getAssignedDoctor(Integer id) {
		Message<Patient> message = new Message<Patient>();
		Patient patient = patientDao.getPatietByID(id);

		if (patient != null) {
			message.setMessage("get nurse details");
			message.setObject(patient);
			message.setValid(true);
			return message;
		}

		message.setMessage("Not found");
		message.setValid(false);
		return message;
	}

	public Message getMessageForPatient(String messageTable, int msgcount) {
		Message<MessageTable> message = new Message<MessageTable>();

		MessageTable createMessageTable = new Gson().fromJson(messageTable,
				MessageTable.class);

		message.setListentity(nurseDao.getMessageForPatient(createMessageTable,msgcount));

		message.setMessage("Message has been send successfully.");

		return message;
	}

	public Message viewSearchPersonDetails(String patientDetail,
			String personID, Integer nurseID, String[] searchValue,
			String[] searchStatus) {

		if (personID.equals("assingedpatient")) {
			Message message = new Message<>();
			message.setListentity(nurseDao.assignedSearchPatientNurse(
					patientDetail, nurseID, searchValue, searchStatus));
			return message;
		} else if (personID.equals("patient")) {

			Nurse nurse = nurseDao.getNurseByID(nurseID);

			Message message = new Message<>();
			if (nurse != null) {
				message.setListentity(nurseDao.viewsearchPatient(patientDetail,
						nurse.getHcgID(), searchValue, searchStatus));
			}
			return message;
		} else {
			Message message = new Message<>();
			message.setMessage("There is some error occurred. So please check it carefully.");
			return message;
		}
	}

	public Message UnReadMessage(Integer id) {
		Message<MessageTable> message = new Message<>();

		try {
			List<MessageTable> list = nurseDao.UnReadMessage(id);
			if (list != null) {
				Map<String, MessageTable> map=new HashMap<>();
				
				for (MessageTable messageTable : list) {
					map.put(messageTable.getDocID()+" "+messageTable.getPatientID()+" "+messageTable.getNurseID(), messageTable);
				}
				
				List<MessageTable> messageTables=new ArrayList<>(map.values());
				
				message.setListentity(list);
				message.setTable(messageTables);;
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

		if (createMessageTable.getDocID() == null) {
			nurseDao.updateReadMessage(createMessageTable.getNurseID(),
					createMessageTable.getPatientID());

			message.setMessage("Read Message Updated");
			return message;
		} else {
			nurseDao.updateReadMessage(createMessageTable.getDocID(),
					createMessageTable.getPatientID(),
					createMessageTable.getNurseID());
			message.setMessage("Read Message Updated");
			return message;
		}
	}

	public Message getAllDoctor(Integer id) {
		Message<Doctor> message = new Message<Doctor>();

		Patient oldPatient = patientDao.getPatietByID(id);

		if (oldPatient != null) {

			message.setListentity(doctorDao.getAllDoctor(oldPatient.getHcgID()));
			message.setMessage("Patient has been updated successfully.");
			return message;
		}

		message.setMessage("Patient not updated.");
		return message;
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
			
			oldPatient.setCategories(hcgOrgnization.getCategories());

			message.setObject(oldPatient);
			message.setMessage("HCG has been updated successfully.");
			return message;
		}

		message.setMessage("hcg not updated.");
		return message;
	}

	public Message getPatientData(Integer patientID,String datatype) {
		Message<PatientPhysiologicalData> message = new Message<PatientPhysiologicalData>();
		Patient patient = patientDao.getPatietByID(patientID);

		if (patient != null) {
			
			if(patient.getMr_number()!=null)
			{
				List<PatientPhysiologicalData> list=patientDao.getPatientDataByMrID(patient.getMr_number(),datatype);
				
				message.setMessage("get mr details");
				message.setListentity(list);
				message.setValid(true);
				return message;
			}
			
			
			message.setMessage("Mr number is null ");
			message.setValid(false);
			return message;
		}

		message.setMessage("Not found");
		message.setValid(false);
		return message;
	}

	public Message dataPointComment(String comment) {
		Message<Comments> message = new Message<Comments>();
		
		Comments comments=new Gson().fromJson(comment, Comments.class);

		if (comments != null) {
			
			boolean flag=nurseDao.save(comments);
			
			if(flag)
			{
				message.setMessage("Comments for this data point submitted.");
				message.setValid(true);
				return message;
			}
			
		}

		message.setMessage("Comments for this data point Not submitted.");
		message.setValid(false);
		return message;
	}

	public Message getDataPointComment(String comment) {
		Message<Comments> message = new Message<Comments>();

		Comments comments = new Gson().fromJson(comment, Comments.class);

		if (comments != null) {

			List<Comments> list = nurseDao.getDataPointComment(comments);

			if (list != null) {

				message.setValid(true);
				message.setListentity(list);
				return message;

			}
		}

		message.setValid(false);
		return message;
	}

	public Message getDataPoint(Integer patientID, Integer nurseID,
			Integer dataPointId, String mr_number, String status,String datatype) {
		
		Message message = new Message();

		PatientPhysiologicalData physiologicalData = nurseDao.getDataPoint(
				dataPointId, mr_number,status,datatype);

		if (physiologicalData != null) {

			Comments comments = new Comments();

			comments.setPatientID(patientID);
			comments.setNurseID(nurseID);
			comments.setData_point_id(physiologicalData.getId());

			List<Comments> list = nurseDao.getDataPointComment(comments);

			if (list != null) {
				
				message.setValid(true);
				message.setObject(physiologicalData);
				message.setListentity(list);
				return message;

			}
		}

		message.setValid(false);
		return message;
	}

	public Message deleteDataPoint(Integer dataPointId) {
		Message message = new Message();

		PatientPhysiologicalData physiologicalData = nurseDao.deleteDataPoint(
				dataPointId);

		if (physiologicalData != null) {
			
			physiologicalData.setIsDeleted(1);
				
			if(nurseDao.update(physiologicalData))
			{
				message.setMessage("Data point deleted.");
				message.setValid(false);
				return message;
			}
			
		}

		message.setValid(false);
		return message;
	}

	public Message getPatientDataWithTime(Integer patientID, String datatype,
			long current, long last, String status) {
		Message<PatientPhysiologicalData> message = new Message<PatientPhysiologicalData>();
		Patient patient = patientDao.getPatietByID(patientID);

		if (patient != null) {

			if (patient.getMr_number() != null) {
				
				String currentDate=null;
				String lastDate=null;
				
				if(status.equals("month"))
				{
					 currentDate=new SimpleDateFormat("yyyy-MM-31 23:59:59").format(new Date(current));
					
					 lastDate=new SimpleDateFormat("yyyy-MM-01 00:00:00").format(new Date(last));
				}
				else if(status.equals("last7days")){
					 currentDate=new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new Date(current));
					
					 lastDate=new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(new Date(last));
				}
				else{
					 currentDate=new SimpleDateFormat("yyyy-MM-dd 00:00:00").format(new Date());
					
					 lastDate=new SimpleDateFormat("yyyy-MM-dd 23:59:59").format(new Date());
				}
				
				
				
						
				List<PatientPhysiologicalData> list = patientDao
						.getPatientDataByMrIDWithTime(patient.getMr_number(),datatype,currentDate,lastDate);

				message.setMessage("get MR number details with date time");
				message.setListentity(list);
				message.setValid(true);
				return message;
			}

			message.setMessage("MR number is null ");
			message.setValid(false);
			return message;
		}

		message.setMessage("Not found");
		message.setValid(false);
		return message;
	}

	public Message updatePatientDataComment(Integer id, String status,Integer nurseID) {
		Message message = new Message();

		PatientPhysiologicalData physiologicalData = nurseDao.deleteDataPoint(
				id);

		if (physiologicalData != null) {
			
			physiologicalData.setNurseId(nurseID);
				
			if(nurseDao.update(physiologicalData))
			{
				message.setMessage("Data point updated.");
				message.setValid(false);
				return message;
			}
			
		}

		message.setValid(false);
		return message;
	}

	public Message assignedPatientWithProblematicData(Integer id) {
		Message message = new Message();

		List<Patient> physiologicalData = nurseDao.assignedPatientWithProblematicData(id);

		if (physiologicalData != null) {
				
				System.out.println(physiologicalData.get(0).getFirstname());
			
				message.setListentity(physiologicalData);
				message.setValid(true);
				return message;
			
		}

		message.setValid(false);
		return message;
	}
	
	
	
	public Message patientOfUnreadDataPoints(Integer id){
    	Message message= new Message();
    	List<Patient> physiologicalData =nurseDao.patientOfUnreadDataPoints(id);
    	
    	if(physiologicalData!=null){
    		
    		System.out.println(physiologicalData.get(0).getFirstname());
    		
    		message.setListentity(physiologicalData);
    		message.setValid(true);
    		return message;
    		
    		
    	}
    	
    	message.setValid(false);
		return message;
    }


}
