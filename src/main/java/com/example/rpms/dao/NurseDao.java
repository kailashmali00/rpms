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
//import com.google.gson.Gson;

@Component
@SuppressWarnings({ "unchecked", "rawtypes" })
public class NurseDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Nurse getNurseByID(Integer id) {

		Nurse nurse = (Nurse) sessionFactory.getCurrentSession()
				.createCriteria(Nurse.class).add(Restrictions.idEq(id))
				// .add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();

		return nurse;
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

	public List<Nurse> getAllNurse(Integer hcgID) {
		List<Nurse> list = (List<Nurse>) sessionFactory.getCurrentSession()
				.createCriteria(Nurse.class).add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();

		List<Users> Users = (List<Users>) sessionFactory.getCurrentSession()
				.createCriteria(Users.class).add(Restrictions.eq("status", 0))
				.add(Restrictions.isNotNull("nurseID"))
				.add(Restrictions.eq("password_creation_status", true)).list();
		// System.out.println("nurse id:- "+new Gson().toJson(Users));

		Map<Integer, Users> map = new HashMap<Integer, Users>();

		for (Users user : Users) {
			System.out.println(user.isPassword_creation_status());
			if (user.isPassword_creation_status()) {
				map.put(user.getNurseID(), user);
			}

		}

		List<Nurse> nurses = new ArrayList<Nurse>();

		for (Nurse doc : list) {

			if (map.get(doc.getId()) != null) {
				nurses.add(doc);
			}

		}

		return nurses;
	}

	public List viewNurse(Integer hcgID) {
		List<Nurse> list = (List<Nurse>) sessionFactory.getCurrentSession()
				.createCriteria(Nurse.class)
				.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public Count dashboardCount(Integer nurseID) {
		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("CALL rpms_nurse_dashboard(" + nurseID + ")")
				.addEntity(Count.class);

		Count count = (Count) query.uniqueResult();

		return count;
	}

	public List<Nurse> searchNurse(String search, Integer hcgID,
			String[] searchStatus) {
		/*
		 * List<Nurse> list = (List<Nurse>) sessionFactory .getCurrentSession()
		 * .createCriteria(Nurse.class)
		 * 
		 * // .add(Restrictions.or(Restrictions.or(Restrictions.or( //
		 * Restrictions.eq("firstname", search), // Restrictions.eq("lastname",
		 * search)), Restrictions.or( // Restrictions.eq("email", search), //
		 * Restrictions.eq("hcg_identifier", search))), //
		 * Restrictions.eq("npi", search)))
		 * 
		 * .add(Restrictions.or(Restrictions.or( Restrictions.like("firstname",
		 * search + "%"), Restrictions.like("lastname", search + "%"))))
		 * 
		 * .add(Restrictions.eq("hcgID", hcgID))
		 * .add(Restrictions.eq("isDeleted", 0)).list(); return list;
		 */

		List<Nurse> list = null;

		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(Nurse.class)
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

		if (createMessageTable.getDocID() == null) {
			// list = criteria
			// .add(Restrictions.eq("nurseID",
			// createMessageTable.getNurseID()))
			// .add(Restrictions.eq("patientID",
			// createMessageTable.getPatientID()))
			// .add(Restrictions.eq("hcgID", createMessageTable.getHcgID()))
			// .add(Restrictions.eq("isDeleted", 0))
			// .addOrder(Order.asc("id")).list();
			// return list;
			list = criteria
					.add(Restrictions.isNull("docID"))
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

	public List<Patient> viewsearchPatient(String search, Integer hcgID,
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

	public List<Patient> assignedSearchPatientNurse(String search,
			Integer nurseID, String[] searchValue, String[] searchStatus) {
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

		list = (List<Patient>) criteria
				.add(Restrictions.eq("nurseID", nurseID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List<MessageTable> UnReadMessage(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				MessageTable.class);

		List<MessageTable> list = criteria.add(Restrictions.eq("nurseID", id))
				.add(Restrictions.eq("isReadNurse", 0)).list();
		return list;

	}

	public boolean updateReadMessage(Integer docID, Integer patientID,
			Integer nurseID) {
		try {
			String sql = "update message set isReadNurse=1 where docID="
					+ docID + " and patientID=" + patientID + " and nurseID="
					+ nurseID + "";
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	public boolean updateReadMessage(Integer docID, Integer patientID) {
		try {
			String sql = "update message set isReadNurse=1 where nurseID="
					+ docID + " and patientID=" + patientID + "";
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}

	}

	public List<Comments> getDataPointComment(Comments comment) {
		try {

			Criteria criteria = sessionFactory.getCurrentSession()
					.createCriteria(Comments.class);
			

			List<Comments> list = criteria
					.add(Restrictions.eq("data_point_id",
							comment.getData_point_id()))
					/*.add(Restrictions.eq("nurseID", comment.getNurseID()))
					.add(Restrictions.eq("patientID", comment.getPatientID()))*/
					.list();

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public PatientPhysiologicalData getDataPoint(Integer dataPointId,
			String mr_number, String status,String datatype) {
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
					.createSQLQuery("SELECT * from (SELECT CAST(AES_DECRYPT(p.firstname,'E$t!!#RRT') AS CHAR)as firstname,CAST(AES_DECRYPT(p.lastname,'E$t!!#RRT')AS CHAR)as lastname,CAST(AES_DECRYPT(p.email,'E$t!!#RRT')AS CHAR)as email,CAST(AES_DECRYPT(p.sex,'E$t!!#RRT')AS CHAR)as sex,CAST(AES_DECRYPT(p.categories,'E$t!!#RRT')AS CHAR)as categories,CAST(AES_DECRYPT(p.date_of_birth,'E$t!!#RRT') AS CHAR)as date_of_birth,p.id,p.docID,p.nurseID,p.hcgID,p.isDeleted,p.mr_number,p.middlename,p.nickname,p.weight,p.height,p.cellphone,p.homephone,p.homeaddress,p.mailingAddress,p.createdAt,p.updatedAt,p.startActivePeriod,p.endActivePeriod,p.reasonForLeaving,p.status,p.ssn_number,p.city,p.state,p.country,p.zipcode,p.image,p.bloodPresure,p.bloodsugur,p.bloodPresureMax,p.bloodsugurMax  FROM patientphysiologicaldata pd join patient p on pd.patientMRid = p.mr_number  join nurse n on p.nurseID = n.id where  (pd.sugervalue>pd.glucoseMax or pd.sugervalue<pd.glucoseMin or pd.pressuresystolic>pd.bloodPressureMax or pd.pressurediastolic<pd.bloodPressureMin)and pd.nurseId is null and pd.isDeleted=0  and n.id="+id+" group by patientMRid )a")
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
					.createSQLQuery("SELECT * from (SELECT CAST(AES_DECRYPT(p.firstname,'E$t!!#RRT') AS CHAR)as firstname,CAST(AES_DECRYPT(p.lastname,'E$t!!#RRT')AS CHAR)as lastname,CAST(AES_DECRYPT(p.email,'E$t!!#RRT')AS CHAR)as email,CAST(AES_DECRYPT(p.sex,'E$t!!#RRT')AS CHAR)as sex,CAST(AES_DECRYPT(p.categories,'E$t!!#RRT')AS CHAR)as categories,CAST(AES_DECRYPT(p.date_of_birth,'E$t!!#RRT') AS CHAR)as date_of_birth,p.id,p.docID,p.nurseID,p.hcgID,p.isDeleted,p.mr_number,p.middlename,p.nickname,p.weight,p.height,p.cellphone,p.homephone,p.homeaddress,p.mailingAddress,p.createdAt,p.updatedAt,p.startActivePeriod,p.endActivePeriod,p.reasonForLeaving,p.status,p.ssn_number,p.city,p.state,p.country,p.zipcode,p.image,p.bloodPresure,p.bloodsugur,p.bloodPresureMax,p.bloodsugurMax  FROM patientphysiologicaldata pd join patient p on pd.patientMRid = p.mr_number join nurse n on p.nurseID = n.id where pd.isDeleted=0 and pd.nurseId is null and n.id="+id+" group by patientMRid) a")
					.addEntity(Patient.class);
			
			List<Patient> physiologicalData = (List<Patient>)query.list();
			return physiologicalData;
		}catch(Exception e){
			e.printStackTrace();
			
			return null;
		}
	}
public List<Nurse> getNurseByEmailId(String userid){
		
		try{
			    Query query =sessionFactory.getCurrentSession()
			    			 .createSQLQuery("select firstname,lastname,email from nurse where email='"+userid+"'")
			    			 .addEntity(Nurse.class);
			    
			    List<Nurse> nursedata =(List<Nurse>)query.list();
			    
			    return nursedata;
		}
		catch(Exception e){
			//e.printStackTrace();
			return null;
		}
	}



public List<Nurse> getNurseByPatientId(Integer id){
	
	try{
		    Query query =sessionFactory.getCurrentSession()
		    			 .createSQLQuery("select n.* from nurse n where n.id='"+id+"'")
		    			 .addEntity(Nurse.class);
		    
		    List<Nurse> nursedata =(List<Nurse>)query.list();
		    
		    return nursedata;
	}
	catch(Exception e){
		//e.printStackTrace();
		return null;
	}
}


}
