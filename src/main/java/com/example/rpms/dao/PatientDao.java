package com.example.rpms.dao;

import java.util.Collections;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.rpms.domain.Count;
import com.example.rpms.domain.MessageTable;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.PatientPhysiologicalData;
import com.example.rpms.domain.Users;

@Component
@SuppressWarnings({ "unchecked", "rawtypes" })
public class PatientDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Count dashboardCount() {
		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("CALL rpms_admin_dashboard()")
				.addEntity(Count.class);

		Count count = (Count) query.uniqueResult();

		System.out.println(count.getDoctorCount() + "/" + count.getNurseCount()
				+ "/" + count.getPatientCount() + "/"
				+ count.getUnAssignedPatientCount());

		return count;
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

	public Patient getPatietByID(Integer id) {
		Patient patient = (Patient) sessionFactory.getCurrentSession()
				.createCriteria(Patient.class).add(Restrictions.idEq(id))
				// .add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();
		return patient;
	}
	public List<PatientPhysiologicalData> getProblematicPatietByID(Integer id) {
		Query query =  sessionFactory.getCurrentSession().createSQLQuery("SELECT p.*  FROM patientphysiologicaldata p join patient p1  on p.patientMRid=p1.mr_number where p.fstate in ('High','Low') and p1.status=0 and p1.id='"+id+"' order by p.deviceTime desc")
				       .addEntity(PatientPhysiologicalData.class);
		List<PatientPhysiologicalData> patient =(List<PatientPhysiologicalData>)query.list();
				/*.createCriteria(Patient.class).add(Restrictions.idEq(id))
				// .add(Restrictions.eq("status", 0))
				.add(Restrictions.or(Restrictions.gt("sugervalue","glucoseMax"),Restrictions.lt("sugervalue","glucoseMin")))
				.add(Restrictions.or(Restrictions.gt("pressuresystolic", "bloodPressureMax"),Restrictions.lt("pressuresystolic", "bloodPressureMin")))
				.uniqueResult();*/
		return patient;
	}
	public Patient getPatietByMR(String mrid) {
		Patient patient = (Patient) sessionFactory.getCurrentSession()
				.createCriteria(Patient.class)
				 .add(Restrictions.eq("mr_number", mrid))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();
		return patient;
	}

	public List viewPatient(Integer hcgID, String value) {

		if (value == null) {
			List<Patient> list = (List<Patient>) sessionFactory
					.getCurrentSession().createCriteria(Patient.class)
					.add(Restrictions.eq("hcgID", hcgID))
					.add(Restrictions.eq("isDeleted", 0)).list();
			return list;
		} else {
			List<Patient> list = (List<Patient>) sessionFactory
					.getCurrentSession().createCriteria(Patient.class)
					.add(Restrictions.eq("hcgID", hcgID))
					.add(Restrictions.eq("status", 0))
					.add(Restrictions.eq("isDeleted", 0)).list();
			return list;
		}

	}

	public List viewUNPatient(Integer hcgID) {
		List<Patient> list = (List<Patient>) sessionFactory
				.getCurrentSession()
				.createCriteria(Patient.class)
				.add(Restrictions.or(Restrictions.isNull("docID"),
						Restrictions.isNull("nurseID")))
				// .add(Restrictions.isNull("docID"))
				// .add(Restrictions.isNull("nurseID"))
				.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List assignedPatientForDoctor(Integer docID) {
		List<Patient> list = (List<Patient>) sessionFactory.getCurrentSession()
				.createCriteria(Patient.class)
				.add(Restrictions.isNotNull("docID"))
				.add(Restrictions.eq("docID", docID))
				.add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List assignedPatientForNurse(Integer nurseID) {
		List<Patient> list = (List<Patient>) sessionFactory.getCurrentSession()
				.createCriteria(Patient.class)
				.add(Restrictions.isNotNull("nurseID"))
				.add(Restrictions.eq("nurseID", nurseID))
				.add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List<Patient> searchPatient(String search, Integer hcgID,
			String[] searchValue, String[] searchStatus) {
		List<Patient> list = null;

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

		
		if(hcgID==null)
		{
			list = criteria.add(Restrictions.eq("isDeleted", 0)).list();

			return list;
		}
		
		list = (List<Patient>) criteria.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List<Patient> searchUnPatient(String search, Integer hcgID,
			String[] searchValue, String[] searchStatus) {
		List<Patient> list = null;

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

		list = (List<Patient>) criteria
				.add(Restrictions.or(Restrictions.isNull("docID"),
						Restrictions.isNull("nurseID")))
				// .add(Restrictions.isNull("docID"))
				// .add(Restrictions.isNull("nurseID"))
				.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;

	}

	public List<MessageTable> getMessageForPatient(
			MessageTable createMessageTable, int msgcount) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				MessageTable.class);

		List<MessageTable> list = null;

		if (createMessageTable.getNurseID() == null) {
			list = criteria
					// .add(Restrictions.eq("docID",
					// createMessageTable.getDocID()))
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
					/*
					 * .add(Restrictions.eq("nurseID",
					 * createMessageTable.getNurseID()))
					 */
					.add(Restrictions.isNull("docID"))
					.add(Restrictions.eq("patientID",
							createMessageTable.getPatientID()))
					.add(Restrictions.eq("hcgID", createMessageTable.getHcgID()))
					.add(Restrictions.eq("isDeleted", 0))
					.addOrder(Order.desc("id")).setMaxResults(msgcount).list();
			        Collections.reverse(list);
			return list;
		}
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

	public List<MessageTable> UnReadMessage(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(
				MessageTable.class);

		List<MessageTable> list = criteria
				.add(Restrictions.eq("patientID", id))
				.add(Restrictions.eq("isReadPatient", 0)).list();
		return list;

	}

	public boolean updateReadMessageDoctor(Integer docID, Integer patientID) {
		try {
			// String sql = "update message set isReadPatient=1 where docID="
			// + docID + " and patientID=" + patientID + "";

			String sql = "update message set isReadPatient=1 where nurseID is null and patientID="
					+ patientID + "";
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}
	public boolean updatePatientForInactiveDoctor(Integer docID) {
		try {
			// String sql = "update patient set isReadPatient=1 where docID="
			// + docID + " and patientID=" + patientID + "";

			String sql = "update patient set docID=null where docID="
					+ docID + "";
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}
	
	public boolean updatePatientForInactiveNurse(Integer nurID) {
		try {
			// String sql = "update patient set isReadPatient=1 where docID="
			// + docID + " and patientID=" + patientID + "";

			String sql = "update patient set docID=null where nurseID="
					+ nurID + "";
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	public boolean updateReadMessageNurse(Integer patientID, Integer nurseID) {
		try {
			// String sql = "update message set isReadPatient=1 where nurseID="
			// + nurseID + " and patientID=" + patientID + "";
			String sql = "update message set isReadPatient=1 where docID is null and patientID="
					+ patientID + "";
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
	}

	public Count dashboardCount(Integer hcgID, Integer id, Integer docID,
			Integer nurseID) {
		Query query = sessionFactory
				.getCurrentSession()
				.createSQLQuery(
						"CALL rpms_patient_dashboard(" + hcgID + "," + id + ","
								+ docID + "," + nurseID + ")")
				.addEntity(Count.class);

		Count count = (Count) query.uniqueResult();

		System.out.println(count.getDoctorMsg() + "/" + count.getNurseMsg());

		return count;

	}

	public Patient getMrNumber(String mr_number) {

		Patient patient = (Patient) sessionFactory.getCurrentSession()
				.createCriteria(Patient.class)
				.add(Restrictions.eq("mr_number", mr_number))
				.add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();

		return patient;
	}


	public List<PatientPhysiologicalData> getPatientDataByMrID(String mr_number,String datatype) {
		
		List<PatientPhysiologicalData> list = (List<PatientPhysiologicalData>) sessionFactory
				.getCurrentSession()
				.createCriteria(PatientPhysiologicalData.class)
				.add(Restrictions.eq("patientMRid", mr_number))
				.add(Restrictions.eq("measurementtype", datatype))
				.add(Restrictions.eq("isDeleted", 0))
				.addOrder(Order.desc("deviceTime")).list();
        		//Collections.reverse(list);
		return list;
	}

	public List<PatientPhysiologicalData> getPatientDataByMrIDWithTime(
			String mr_number, String datatype, String currentDate,
			String lastDate) {
		
		System.out.println("dates:- "+lastDate+"/"+currentDate);
		
		List<PatientPhysiologicalData> list = (List<PatientPhysiologicalData>) sessionFactory
				.getCurrentSession()
				.createCriteria(PatientPhysiologicalData.class)
				.add(Restrictions.eq("patientMRid", mr_number))
				.add(Restrictions.eq("measurementtype", datatype))
				.add(Restrictions.between("deviceTime",lastDate, currentDate ))
				.add(Restrictions.eq("isDeleted", 0))
				.list();
		return list;
	}
	public List<PatientPhysiologicalData> getPatientProblemDataByMrIDWithTime(
			String mr_number, String datatype, String currentDate,
			String lastDate) {
		
		System.out.println("dates:- "+lastDate+"/"+currentDate);
		
		List<PatientPhysiologicalData> list = (List<PatientPhysiologicalData>) sessionFactory
				.getCurrentSession()
				.createCriteria(PatientPhysiologicalData.class)
				.add(Restrictions.eq("patientMRid", mr_number))
				.add(Restrictions.eq("measurementtype", datatype))
				.add(Restrictions.between("deviceTime",lastDate, currentDate ))
				.add(Restrictions.or(Restrictions.gt("sugervalue", "glucoseMax"),Restrictions.lt("sugervalue", "glucoseMin")))
				.add(Restrictions.or(Restrictions.gt("pressuresystolic", "bloodPressureMax"),Restrictions.lt("pressuresystolic", "bloodPressureMin")))
				.list();
		return list;
	}
	public List<PatientPhysiologicalData> patientWithphyoslogicAllData(
			Integer id) {
		try {

			Query query = sessionFactory.getCurrentSession()
					.createSQLQuery("CALL assign_patient_with_problematic_patient_AllPoint(" + id + ")")
					.addEntity(PatientPhysiologicalData.class);

			
			List<PatientPhysiologicalData> physiologicalData = (List<PatientPhysiologicalData>) query.list();

			return physiologicalData;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public List<PatientPhysiologicalData> patientWithProblematicData(Integer id) {
		try {

			Query query = sessionFactory.getCurrentSession()
					.createSQLQuery("CALL assign_patient_with_problematic_patient_problematic_data(" + id + ")")
					.addEntity(PatientPhysiologicalData.class);

			
			List<PatientPhysiologicalData> physiologicalData = (List<PatientPhysiologicalData>) query.list();
			return physiologicalData;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public List<Patient> getPatientWithEmailId(String userid){
		try{
			   
			Query query =sessionFactory.getCurrentSession()
						 .createSQLQuery("select * from patient where email='"+userid+"'")
						 .addEntity(Patient.class);
			List<Patient> patientdata =(List<Patient>)query.list();
			System.out.println(patientdata);
			return patientdata;
		}
		catch(Exception e){
			//e.printStackTrace();
			return null;
		}
	}


}
