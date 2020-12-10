package com.example.rpms.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import javax.mail.Flags.Flag;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.example.rpms.dao.DoctorDao;
import com.example.rpms.dao.HCGDao;
import com.example.rpms.dao.NurseDao;
import com.example.rpms.dao.PatientDao;
import com.example.rpms.dao.SuperAdminDao;
import com.example.rpms.domain.Comments;
import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.HcgOrgnization;
import com.example.rpms.domain.Measure;
import com.example.rpms.domain.Message;
import com.example.rpms.domain.MessageTable;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.PatientData;
import com.example.rpms.domain.PatientPhysiologicalData;
import com.example.rpms.domain.SuperAdmin;
import com.google.gson.Gson;

@Component
@Transactional
@SuppressWarnings({ "unchecked", "rawtypes" })
public class DoctorServices {

	@Autowired
	private DoctorDao doctorDao;

	@Autowired
	private PatientDao patientDao;

	@Autowired
	private NurseDao nurseDao;

	@Autowired
	private HCGDao hcgDao;

	public Message viewPersonDetails(String personID, Integer docID) {

		if (personID.equals("assingedpatient")) {
			Message message = new Message<>();
			message.setListentity(patientDao.assignedPatientForDoctor(docID));
			return message;
		} else if (personID.equals("patient")) {

			Doctor doctor = doctorDao.getDoctorByID(docID);

			Message message = new Message<>();
			if (doctor != null) {
				message.setListentity(patientDao.viewPatient(doctor.getHcgID(),
						"doctor"));
			}
			return message;
		} else {
			Message message = new Message<>();
			message.setMessage("There is some error occurred. So please check it carefully.");
			return message;
		}
	}

	public Count dashboardCount(Integer docID) {

		Count count = doctorDao.dashboardCount(docID);

		if (count == null) {
			count = new Count();
			return count;
		}

		return count;
	}

	public Message SendMessagePatient(String MessageTable) {
		Message<MessageTable> message = new Message<MessageTable>();

		MessageTable createMessageTable = new Gson().fromJson(MessageTable,
				MessageTable.class);
		createMessageTable.setCreatedAT(new Date());
		createMessageTable.setUpdatedAT(new Date());
		createMessageTable.setEntryTime(new Date());
		createMessageTable.setIsSentDoc(1);
		createMessageTable.setIsDeleted(0);

		boolean flag = doctorDao.save(createMessageTable);

		if (flag) {
			message.setMessage("Message has been sent successfully.");
			return message;
		}

		message.setMessage("Message not sent successfully.");
		return message;
	}

	public Message<Doctor> getDoctorByID(Integer id) {
		Message<Doctor> message = new Message<>();

		try {
			Doctor doctor = doctorDao.getDoctorByID(id);
			if (doctor != null) {
				message.setObject(doctor);
			}

			message.setMessage("doctor Found");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("doctor Not Found");
		}
		return message;
	}

	public Message getAssignedNurse(Integer id) {
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

		message.setListentity(doctorDao
				.getMessageForPatient(createMessageTable,msgcount));

		message.setMessage("Message has been sent successfully.");

		return message;
	}

	public Message viewSearchPersonDetails(String patientDetail,
			String personID, Integer docID, String[] searchValue,
			String[] searchStatus) {

		if (personID.equals("assingedpatient")) {
			Message message = new Message<>();
			message.setListentity(doctorDao.assignedSearchPatientForDoctor(
					patientDetail, docID, searchValue, searchStatus));
			return message;
		} else if (personID.equals("patient")) {

			Doctor doctor = doctorDao.getDoctorByID(docID);

			Message message = new Message<>();
			if (doctor != null) {
				message.setListentity(doctorDao.viewSearchPatient(
						patientDetail, doctor.getHcgID(), searchValue,
						searchStatus));
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
			List<MessageTable> list = doctorDao.UnReadMessage(id);
			if (list != null) {

				Map<String, MessageTable> map = new HashMap<>();

				for (MessageTable messageTable : list) {
					map.put(messageTable.getDocID() + " "
							+ messageTable.getPatientID() + " "
							+ messageTable.getNurseID(), messageTable);
				}

				List<MessageTable> messageTables = new ArrayList<>(map.values());

				message.setListentity(list);
				message.setTable(messageTables);
			}

			message.setMessage("Read Message");
		} catch (Exception e) {
			e.printStackTrace();
			message.setMessage("Not Found Any Un Read Message");
		}
		return message;
	}

	public Message ReadMessage(String messageTable) {
		Message<MessageTable> message = new Message<MessageTable>();

		MessageTable createMessageTable = new Gson().fromJson(messageTable,
				MessageTable.class);

		if (createMessageTable.getNurseID() == null) {
			doctorDao.updateReadMessage(createMessageTable.getDocID(),
					createMessageTable.getPatientID(),null);

			message.setMessage("Read Message Updated");
			return message;
		} else {
			doctorDao.updateReadMessage(createMessageTable.getDocID(),
					createMessageTable.getPatientID(),
					createMessageTable.getNurseID());
			message.setMessage("Read Message Updated");
			return message;
		}

	}

	public Message updatePatient(String patient) {
		Message<Patient> message = new Message<Patient>();

		Patient updatePatient = new Gson().fromJson(patient, Patient.class);

		if (updatePatient.getId() != null) {

			Patient oldPatient = patientDao
					.getPatietByID(updatePatient.getId());

			if (oldPatient != null) {

				oldPatient.setUpdatedAt(new Date());

				oldPatient.setCategories(updatePatient.getCategories());

				oldPatient.setBloodPresure(updatePatient.getBloodPresure());
				oldPatient.setBloodsugur(updatePatient.getBloodsugur());

				oldPatient.setBloodPresureMax(updatePatient
						.getBloodPresureMax());
				oldPatient.setBloodsugurMax(updatePatient.getBloodsugurMax());

				patientDao.update(oldPatient);

				Measure measure = new Measure();
				measure.setPatientID(oldPatient.getId());
				measure.setDocID(oldPatient.getDocID());
				measure.setHcgID(oldPatient.getHcgID());
				measure.setBloodPresure(oldPatient.getBloodPresure());
				measure.setBloodsugur(oldPatient.getBloodsugur());

				measure.setBloodPresureMax(oldPatient.getBloodPresureMax());
				measure.setBloodsugurMax(oldPatient.getBloodsugurMax());

				measure.setCreatedAT(new Date());
				measure.setUpdatedAT(new Date());

				patientDao.save(measure);

				message.setMessage("Patient has been updated successfully.");
				return message;
			}
		}
		message.setMessage("Patient not updated.");
		return message;
	}

	public Message getAllNurse(Integer id) {
		Message<Nurse> message = new Message<Nurse>();

		Patient oldPatient = patientDao.getPatietByID(id);

		if (oldPatient != null) {

			message.setListentity(nurseDao.getAllNurse(oldPatient.getHcgID()));
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

		message.setMessage("HCG not updated.");
		return message;
	}
	
	
	


	public Message getPatientData(Integer patientID,String datatype) {
		Message<PatientPhysiologicalData> message = new Message<PatientPhysiologicalData>();
		Patient patient = patientDao.getPatietByID(patientID);

		if (patient != null) {

			if (patient.getMr_number() != null) {
				List<PatientPhysiologicalData> list = patientDao
						.getPatientDataByMrID(patient.getMr_number(),datatype);

				message.setMessage("get MR number details");
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

	public Message dataPointComment(String comment) {
		Message<Comments> message = new Message<Comments>();

		Comments comments = new Gson().fromJson(comment, Comments.class);

		if (comments != null) {

			boolean flag = doctorDao.save(comments);

			if (flag) {
				message.setMessage("Comment has been saved successfully for this data.");
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

			List<Comments> list = doctorDao.getDataPointComment(comments);

			if (list != null) {

				message.setValid(true);
				message.setListentity(list);
				return message;

			}
		}

		message.setValid(false);
		return message;
	}

	public Message getDataPoint(Integer patientID, Integer docID,
			Integer dataPointId, String mr_number,String status,String datatype) {
		Message message = new Message();

		PatientPhysiologicalData physiologicalData = doctorDao.getDataPoint(
				dataPointId, mr_number,status,datatype);

		if (physiologicalData != null) {

			Comments comments = new Comments();

			comments.setPatientID(patientID);
			comments.setDocID(docID);
			comments.setData_point_id(physiologicalData.getId());

			List<Comments> list = doctorDao.getDataPointComment(comments);

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

		PatientPhysiologicalData physiologicalData = doctorDao.deleteDataPoint(
				dataPointId);

		if (physiologicalData != null) {
			
			physiologicalData.setIsDeleted(1);
				
			if(doctorDao.update(physiologicalData))
			{
				message.setMessage("Data has been deleted.");
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
	public Message getPatientProblematicDataWithTime(Integer patientID, String datatype,
			long current, long last, String status) {
		Message<PatientPhysiologicalData> message = new Message<PatientPhysiologicalData>();
		PatientPhysiologicalData patient = patientDao.getProblematicPatietByID(patientID).get(0);

		if (patient != null) {

			if (patient.getPatientMRid() != null) {
				
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
						.getPatientDataByMrIDWithTime(patient.getPatientMRid(),datatype,currentDate,lastDate);

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

	public Message updatePatientDataComment(Integer id, String status,Integer docID) {
		Message message = new Message();

		PatientPhysiologicalData physiologicalData = doctorDao.deleteDataPoint(id);

		if (physiologicalData != null) {
			
			physiologicalData.setDocId(docID);
				
			if(doctorDao.update(physiologicalData))
			{
				message.setMessage("Data has been reviewed.");
				message.setValid(false);
				return message;
			}
			
		}

		message.setValid(false);
		return message;
	}

	public Message assignedPatientWithProblematicData(Integer id) {
		Message message = new Message();

		List<Patient> physiologicalData = doctorDao.assignedPatientWithProblematicData(id);

		if (physiologicalData != null) {
				
				message.setListentity(physiologicalData);
				message.setValid(true);
				return message;
			
		}

		message.setValid(false);
		return message;
	}
    public Message patientOfUnreadDataPoints(Integer id){
    	Message message= new Message();
    	List<Patient> physiologicalData =doctorDao.patientOfUnreadDataPoints(id);
    	if(physiologicalData!=null){
    		message.setListentity(physiologicalData);
    		message.setValid(true);
    		return message;
    		
    	}
    	message.setValid(false);
		return message;
    }
    
    
public String getDoctorDetails(Integer id){
		
		//Message message = new Message();
		
		
			
			List<Doctor> list=doctorDao.getDoctorByPatientId(id);
			return(list.get(0).getFirstname()+" "+list.get(0).getLastname());
		//return message;
		
	}
}
