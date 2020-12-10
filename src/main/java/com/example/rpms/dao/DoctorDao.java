package com.example.rpms.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.rpms.domain.Comments;
import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.MessageTable;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.PatientPhysiologicalData;
import com.example.rpms.domain.Users;
import com.google.gson.Gson;

@Component
@SuppressWarnings({ "unchecked", "rawtypes" })
public class DoctorDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Doctor getDoctorByID(Integer id) {

		Doctor doctor = (Doctor) sessionFactory.getCurrentSession()
				.createCriteria(Doctor.class).add(Restrictions.idEq(id))
				// .add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();

		return doctor;
	}

	public boolean update(Object createPatient) {
		try {
			sessionFactory.getCurrentSession().update(createPatient);
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public List<Doctor> getAllDoctor(Integer hcgID) {

		List<Doctor> list = (List<Doctor>) sessionFactory.getCurrentSession()
				.createCriteria(Doctor.class).add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();

		List<Users> Users = (List<Users>) sessionFactory.getCurrentSession()
				.createCriteria(Users.class).add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("password_creation_status", true))
				.add(Restrictions.isNotNull("docID")).list();

		Map<Integer, Users> map = new HashMap<Integer, Users>();

		for (Users user : Users) {
			System.out.println(user.isPassword_creation_status());
			if (user.isPassword_creation_status()) {
				map.put(user.getDocID(), user);
			}

		}

		List<Doctor> doctors = new ArrayList<Doctor>();

		for (Doctor doc : list) {

			if (map.get(doc.getId()) != null) {
				doctors.add(doc);
			}

		}

		return doctors;
	}

	public List viewDoctor(Integer hcgID) {
		List<Doctor> list = (List<Doctor>) sessionFactory.getCurrentSession()
				.createCriteria(Doctor.class)
				.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public Count dashboardCount(Integer docID) {

		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("CALL rpms_doctor_dashboard(" + docID + ")")
				.addEntity(Count.class);

		Count count = (Count) query.uniqueResult();
		
		System.out.println("count json values:- "+new Gson().toJson(count));

		return count;
	}

	public List<Doctor> searchDoctor(String search, Integer hcgID,
			String[] searchStatus) {

		List<Doctor> list = null;

		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(Doctor.class)
				.add(Restrictions.or(Restrictions.or(
						Restrictions.like("firstname", search + "%"),
						Restrictions.like("lastname", search + "%"))));

		int statusVal = searchStatus.length;

		if (statusVal == 1) {

			criteria.add(Restrictions.eq("status",
					Integer.parseInt(searchStatus[0])));

		} else if (statusVal == 2) {

			criteria.add(Restrictions.or(Restrictions.eq("status",
					Integer.parseInt(searchStatus[0])), Restrictions.eq(
					"status", Integer.parseInt(searchStatus[1]))));

		} else {

			criteria.add(Restrictions.or(
					Restrictions.eq("status", Integer.parseInt("0")),
					Restrictions.eq("status", Integer.parseInt("1"))));

		}
		
		if(hcgID==null)
		{
			list = criteria.add(Restrictions.eq("isDeleted", 0)).list();

			return list;
		}

		list = criteria.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();

		return list;
	}

	public boolean save(Object object) {
		try {
			sessionFactory.getCurrentSession().save(object);

			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public List<MessageTable> getMessageForPatient(
			MessageTable createMessageTable, int msgcount) {

		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				MessageTable.class);

		List<MessageTable> list = null;

		if (createMessageTable.getNurseID() == null) {
			// list = criteria
			// .add(Restrictions.eq("docID", createMessageTable.getDocID()))
			// .add(Restrictions.eq("patientID",
			// createMessageTable.getPatientID()))
			// .add(Restrictions.eq("hcgID", createMessageTable.getHcgID()))
			// .add(Restrictions.eq("isDeleted", 0))
			// .addOrder(Order.asc("id")).list();
			// return list;
			list = criteria
					.add(Restrictions.isNull("nurseID"))
					.add(Restrictions.eq("patientID",
							createMessageTable.getPatientID()))
					.add(Restrictions.eq("hcgID", createMessageTable.getHcgID()))
					.add(Restrictions.eq("isDeleted", 0))
					.addOrder(Order.desc("id")).setMaxResults(msgcount).list();
			Collections.reverse(list);
			return list;
		} else {
			list = criteria
					.add(Restrictions.eq("docID", createMessageTable.getDocID()))
					.add(Restrictions.eq("patientID",
							createMessageTable.getPatientID()))
					.add(Restrictions.eq("nurseID",
							createMessageTable.getNurseID()))
					.add(Restrictions.eq("hcgID", createMessageTable.getHcgID()))
					.add(Restrictions.eq("isDeleted", 0))
					.addOrder(Order.desc("id")).setMaxResults(msgcount).list();
			Collections.reverse(list);
			return list;
		}

	}

	public List<Patient> assignedSearchPatientForDoctor(String search,
			Integer docID, String[] searchValue, String[] searchStatus) {

		List<Patient> list = null;
		/*String s[]=search.split(" ");
		String s1=s[0]+s[1];*/
		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(Patient.class)
				.add(Restrictions.or(Restrictions.or(
						Restrictions.like("firstname", search + "%"),
						Restrictions.like("lastname", search + "%"))));

		int statusVal = searchStatus.length;

		if (statusVal == 1) {
			System.out.println(1);
			int len = searchValue.length;

			if (len == 1) {
				criteria.add(
						Restrictions.or(Restrictions.eq("categories",
								searchValue[0]))).add(
						Restrictions.eq("status",
								Integer.parseInt(searchStatus[0])));
			} else if (len == 2) {
				criteria.add(
						Restrictions.or(Restrictions.or(
								Restrictions.eq("categories", searchValue[0]),
								Restrictions.eq("categories", searchValue[1]))))
						.add(Restrictions.eq("status",
								Integer.parseInt(searchStatus[0])));
			} else if (len == 3) {
				criteria.add(
						Restrictions.or(Restrictions.or(Restrictions.eq(
								"categories", searchValue[0]), Restrictions.or(
								Restrictions.eq("categories", searchValue[1]),
								Restrictions.eq("categories", searchValue[2])))))
						.add(Restrictions.eq("status",
								Integer.parseInt(searchStatus[0])));
			} else {
				criteria.add(Restrictions.eq("status",
						Integer.parseInt(searchStatus[0])));
			}

		} else if (statusVal == 2) {
			System.out.println(2);
			int len = searchValue.length;

			if (len == 1) {
				criteria.add(
						Restrictions.or(Restrictions.eq("categories",
								searchValue[0]))).add(
						Restrictions.or(
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[0])),
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[1]))));
			} else if (len == 2) {
				criteria.add(
						Restrictions.or(Restrictions.or(
								Restrictions.eq("categories", searchValue[0]),
								Restrictions.eq("categories", searchValue[1]))))
						.add(Restrictions.or(
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[0])),
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[1]))));
			} else if (len == 3) {
				criteria.add(
						Restrictions.or(Restrictions.or(Restrictions.eq(
								"categories", searchValue[0]), Restrictions.or(
								Restrictions.eq("categories", searchValue[1]),
								Restrictions.eq("categories", searchValue[2])))))
						.add(Restrictions.or(
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[0])),
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[1]))));
			} else {
				criteria.add(Restrictions.or(
						Restrictions.eq("status",
								Integer.parseInt(searchStatus[0])),
						Restrictions.eq("status",
								Integer.parseInt(searchStatus[1]))));
			}

		} else {
			System.out.println("nil");
			int len = searchValue.length;

			if (len == 1) {
				criteria.add(Restrictions.or(Restrictions.eq("categories",
						searchValue[0])));
			} else if (len == 2) {
				criteria.add(Restrictions.or(Restrictions.or(
						Restrictions.eq("categories", searchValue[0]),
						Restrictions.eq("categories", searchValue[1]))));
			} else if (len == 3) {
				criteria.add(Restrictions.or(Restrictions.or(Restrictions.eq(
						"categories", searchValue[0]), Restrictions.or(
						Restrictions.eq("categories", searchValue[1]),
						Restrictions.eq("categories", searchValue[2])))));
			} else {
				criteria.add(Restrictions.or(
						Restrictions.eq("status", Integer.parseInt("0")),
						Restrictions.eq("status", Integer.parseInt("1"))));
			}
		}

		// int len = searchValue.length;
		// if (len == 1) {
		// criteria.add(Restrictions.or(Restrictions.eq("categories",
		// searchValue[0])));
		// } else if (len == 2) {
		// criteria.add(Restrictions.or(Restrictions.or(
		// Restrictions.eq("categories", searchValue[0]),
		// Restrictions.eq("categories", searchValue[1]))));
		// } else if (len == 3) {
		// criteria.add(Restrictions.or(Restrictions.or(Restrictions.eq(
		// "categories", searchValue[0]), Restrictions.or(
		// Restrictions.eq("categories", searchValue[1]),
		// Restrictions.eq("categories", searchValue[2])))));
		// }

		list = (List<Patient>) criteria.add(Restrictions.eq("docID", docID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List<Patient> viewSearchPatient(String search, Integer hcgID,
			String[] searchValue, String[] searchStatus) {
		List<Patient> list = null;

		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(Patient.class)
				.add(Restrictions.or(Restrictions.or(
						Restrictions.like("firstname", search + "%"),
						Restrictions.like("lastname", search + "%"))));

		// int len = searchValue.length;
		// if (len == 1) {
		// criteria.add(Restrictions.or(Restrictions.eq("categories",
		// searchValue[0])));
		// } else if (len == 2) {
		// criteria.add(Restrictions.or(Restrictions.or(
		// Restrictions.eq("categories", searchValue[0]),
		// Restrictions.eq("categories", searchValue[1]))));
		// } else if (len == 3) {
		// criteria.add(Restrictions.or(Restrictions.or(Restrictions.eq(
		// "categories", searchValue[0]), Restrictions.or(
		// Restrictions.eq("categories", searchValue[1]),
		// Restrictions.eq("categories", searchValue[2])))));
		// }
		int statusVal = searchStatus.length;

		if (statusVal == 1) {
			System.out.println(1);
			int len = searchValue.length;

			if (len == 1) {
				criteria.add(
						Restrictions.or(Restrictions.eq("categories",
								searchValue[0]))).add(
						Restrictions.eq("status",
								Integer.parseInt(searchStatus[0])));
			} else if (len == 2) {
				criteria.add(
						Restrictions.or(Restrictions.or(
								Restrictions.eq("categories", searchValue[0]),
								Restrictions.eq("categories", searchValue[1]))))
						.add(Restrictions.eq("status",
								Integer.parseInt(searchStatus[0])));
			} else if (len == 3) {
				criteria.add(
						Restrictions.or(Restrictions.or(Restrictions.eq(
								"categories", searchValue[0]), Restrictions.or(
								Restrictions.eq("categories", searchValue[1]),
								Restrictions.eq("categories", searchValue[2])))))
						.add(Restrictions.eq("status",
								Integer.parseInt(searchStatus[0])));
			} else {
				criteria.add(Restrictions.eq("status",
						Integer.parseInt(searchStatus[0])));
			}

		} else if (statusVal == 2) {
			System.out.println(2);
			int len = searchValue.length;

			if (len == 1) {
				criteria.add(
						Restrictions.or(Restrictions.eq("categories",
								searchValue[0]))).add(
						Restrictions.or(
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[0])),
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[1]))));
			} else if (len == 2) {
				criteria.add(
						Restrictions.or(Restrictions.or(
								Restrictions.eq("categories", searchValue[0]),
								Restrictions.eq("categories", searchValue[1]))))
						.add(Restrictions.or(
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[0])),
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[1]))));
			} else if (len == 3) {
				criteria.add(
						Restrictions.or(Restrictions.or(Restrictions.eq(
								"categories", searchValue[0]), Restrictions.or(
								Restrictions.eq("categories", searchValue[1]),
								Restrictions.eq("categories", searchValue[2])))))
						.add(Restrictions.or(
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[0])),
								Restrictions.eq("status",
										Integer.parseInt(searchStatus[1]))));
			} else {
				criteria.add(Restrictions.or(
						Restrictions.eq("status",
								Integer.parseInt(searchStatus[0])),
						Restrictions.eq("status",
								Integer.parseInt(searchStatus[1]))));
			}

		} else {
			System.out.println("nil");
			int len = searchValue.length;

			if (len == 1) {
				criteria.add(Restrictions.or(Restrictions.eq("categories",
						searchValue[0])));
			} else if (len == 2) {
				criteria.add(Restrictions.or(Restrictions.or(
						Restrictions.eq("categories", searchValue[0]),
						Restrictions.eq("categories", searchValue[1]))));
			} else if (len == 3) {
				criteria.add(Restrictions.or(Restrictions.or(Restrictions.eq(
						"categories", searchValue[0]), Restrictions.or(
						Restrictions.eq("categories", searchValue[1]),
						Restrictions.eq("categories", searchValue[2])))));
			} else {
				criteria.add(Restrictions.or(
						Restrictions.eq("status", Integer.parseInt("0")),
						Restrictions.eq("status", Integer.parseInt("1"))));
			}
		}

		list = (List<Patient>) criteria.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List<MessageTable> UnReadMessage(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				MessageTable.class);

		List<MessageTable> list = criteria.add(Restrictions.eq("docID", id))
				.add(Restrictions.eq("isReadDoc", 0)).list();
		return list;

	}

	public boolean updateReadMessage(Integer docID, Integer patientID,
			Integer nurseID) {
		try {
			String sql = "";
			if(docID==null){
			sql = "update message set isReadDoc=1 where docID is null and patientID=" + patientID + " and nurseID=" + nurseID
					+ "";}
			
			else if(patientID==null){
				sql = "update message set isReadDoc=1 where docID =" + docID + " and patientID is null and nurseID=" + nurseID
						+ "";}
			
			else if(nurseID==null){
				sql = "update message set isReadDoc=1 where docID =" + docID + " and patientID=" + patientID + " and nurseID is null"
						+ "";}
			
			else{
				sql = "update message set isReadDoc=1 where docID =" + docID + " and patientID=" + patientID + " and nurseID=" + nurseID
						+ "";}
			
			
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}



	public Doctor getDoctorByNPI(String npi) {

		Doctor doctor = (Doctor) sessionFactory.getCurrentSession()
				.createCriteria(Doctor.class).add(Restrictions.eq("npi", npi))
				.add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();

		return doctor;
	}

	public List<Comments> getDataPointComment(Comments comment) {
		try {

			Criteria criteria = sessionFactory.getCurrentSession()
					.createCriteria(Comments.class);

			List<Comments> list = criteria
					.add(Restrictions.eq("data_point_id",
							comment.getData_point_id()))
					/*.add(Restrictions.eq("docID", comment.getDocID()))
					.add(Restrictions.eq("nurseID",comment.getNurseID()))
					.add(Restrictions.eq("patientID", comment.getPatientID()))*/
					.list();

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public PatientPhysiologicalData getDataPoint(Integer dataPointId,
			String mr_number, String status, String datatype) {
		try {

			Criteria criteria = sessionFactory.getCurrentSession()
					.createCriteria(PatientPhysiologicalData.class);

			if (status.equals("right")) {
				PatientPhysiologicalData physiologicalData = (PatientPhysiologicalData) criteria
						.add(Restrictions.gt("id", dataPointId))
						.add(Restrictions.eq("patientMRid", mr_number))
						.addOrder(Order.asc("id")).setMaxResults(1)
						.add(Restrictions.eq("isDeleted", 0))
						.add(Restrictions.eq("measurementtype", datatype))
						.uniqueResult();

				return physiologicalData;
			} else {
				PatientPhysiologicalData physiologicalData = (PatientPhysiologicalData) criteria
						.add(Restrictions.lt("id", dataPointId))
						.add(Restrictions.eq("patientMRid", mr_number))
						.addOrder(Order.desc("id")).setMaxResults(1)
						.add(Restrictions.eq("isDeleted", 0))
						.add(Restrictions.eq("measurementtype", datatype))
						.uniqueResult();

				return physiologicalData;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public PatientPhysiologicalData deleteDataPoint(Integer dataPointId) {
		try {

			Criteria criteria = sessionFactory.getCurrentSession()
					.createCriteria(PatientPhysiologicalData.class);

			PatientPhysiologicalData physiologicalData = (PatientPhysiologicalData) criteria
					.add(Restrictions.idEq(dataPointId))
					.add(Restrictions.eq("isDeleted", 0)).uniqueResult();

			return physiologicalData;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<Patient> assignedPatientWithProblematicData(
			Integer id) {
		try {

			Query query = sessionFactory.getCurrentSession()
					.createSQLQuery("SELECT * from (SELECT CAST(AES_DECRYPT(p.firstname,'E$t!!#RRT') AS CHAR)as firstname,CAST(AES_DECRYPT(p.lastname,'E$t!!#RRT')AS CHAR)as lastname,CAST(AES_DECRYPT(p.email,'E$t!!#RRT')AS CHAR)as email,CAST(AES_DECRYPT(p.sex,'E$t!!#RRT')AS CHAR)as sex,CAST(AES_DECRYPT(p.categories,'E$t!!#RRT')AS CHAR)as categories,CAST(AES_DECRYPT(p.date_of_birth,'E$t!!#RRT') AS CHAR)as date_of_birth,p.id,p.docID,p.nurseID,p.hcgID,p.isDeleted,p.mr_number,p.middlename,p.nickname,p.weight,p.height,p.cellphone,p.homephone,p.homeaddress,p.mailingAddress,p.createdAt,p.updatedAt,p.startActivePeriod,p.endActivePeriod,p.reasonForLeaving,p.status,p.ssn_number,p.city,p.state,p.country,p.zipcode,p.image,p.bloodPresure,p.bloodsugur,p.bloodPresureMax,p.bloodsugurMax  FROM patientphysiologicaldata pd join patient p on pd.patientMRid = p.mr_number  join doctor d on p.docID = d.id where  (pd.sugervalue>pd.glucoseMax or pd.sugervalue<pd.glucoseMin or pd.pressuresystolic>pd.bloodPressureMax or pd.pressurediastolic<pd.bloodPressureMin) and pd.docId is null and pd.isdeleted=0  and d.id="+id+" group by patientMRid )a")
					.addEntity(Patient.class);

			
			List<Patient> physiologicalData = (List<Patient>) query.list();

			return physiologicalData;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public List<Patient> patientOfUnreadDataPoints(
			Integer id){
		try{
			Query query = sessionFactory.getCurrentSession()
					.createSQLQuery("SELECT * from (SELECT CAST(AES_DECRYPT(p.firstname,'E$t!!#RRT') AS CHAR)as firstname,CAST(AES_DECRYPT(p.lastname,'E$t!!#RRT')AS CHAR)as lastname,CAST(AES_DECRYPT(p.email,'E$t!!#RRT')AS CHAR)as email,CAST(AES_DECRYPT(p.sex,'E$t!!#RRT')AS CHAR)as sex,CAST(AES_DECRYPT(p.categories,'E$t!!#RRT')AS CHAR)as categories,CAST(AES_DECRYPT(p.date_of_birth,'E$t!!#RRT') AS CHAR)as date_of_birth,p.id,p.docID,p.nurseID,p.hcgID,p.isDeleted,p.mr_number,p.middlename,p.nickname,p.weight,p.height,p.cellphone,p.homephone,p.homeaddress,p.mailingAddress,p.createdAt,p.updatedAt,p.startActivePeriod,p.endActivePeriod,p.reasonForLeaving,p.status,p.ssn_number,p.city,p.state,p.country,p.zipcode,p.image,p.bloodPresure,p.bloodsugur,p.bloodPresureMax,p.bloodsugurMax  FROM patientphysiologicaldata pd join patient p on pd.patientMRid = p.mr_number join doctor d on p.docID = d.id where pd.isDeleted=0 and pd.docid is null and d.id="+id+" group by patientMRid) a")
					.addEntity(Patient.class);
			
			List<Patient> physiologicalData = (List<Patient>)query.list();
			return physiologicalData;
		}catch(Exception e){
			e.printStackTrace();
			
			return null;
		}
	}
	public List<Doctor> getDoctorByEmailId(String userid){
		
		try{
			    Query query =sessionFactory.getCurrentSession()
			    			 .createSQLQuery("select firstname,lastname,email from doctor where email='"+userid+"'")
			    			 .addEntity(Doctor.class);
			    
			    List<Doctor> doctordata =(List<Doctor>)query.list();
			    
			    return doctordata;
		}
		catch(Exception e){
			//e.printStackTrace();
			return null;
		}
	}
	
	
	public List<Doctor> getDoctorByPatientId(Integer id){
		
		try{
			    Query query =sessionFactory.getCurrentSession()
			    			 .createSQLQuery("select d.* from doctor d  where d.id='"+id+"'")
			    			 .addEntity(Doctor.class);
			    
			    List<Doctor> docdata =(List<Doctor>)query.list();
			    
			    return docdata;
		}
		catch(Exception e){
			//e.printStackTrace();
			return null;
		}
	}
	
	

}
