package com.example.rpms.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.rpms.domain.Count;
import com.example.rpms.domain.Doctor;
import com.example.rpms.domain.HcgOrgnization;
import com.example.rpms.domain.Nurse;
import com.example.rpms.domain.Patient;
import com.example.rpms.domain.PatientPhysiologicalData;
import com.example.rpms.domain.SuperAdmin;
import com.example.rpms.domain.Users;

@Component
public class SuperAdminDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public Count dashboardCount(Integer adminID) {
		
		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("CALL rpms_superAdmin_dashboard(" + adminID + ")")
				.addEntity(Count.class);

		Count count = (Count) query.uniqueResult();

		System.out.println(count.getDoctorCount() + "/" + count.getNurseCount()
				+ "/" + count.getPatientCount() + "/"
				+ count.getUnAssignedPatientCount());

		return count;
	}

	public SuperAdmin getSuperAdminByID(Integer id) {
		SuperAdmin superAdmin = (SuperAdmin) sessionFactory
				.getCurrentSession().createCriteria(SuperAdmin.class)
				.add(Restrictions.idEq(id))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();
		return superAdmin;
	}

	public List getHCGAdmin(Integer adminID) {
		
		@SuppressWarnings("unchecked")
		List<HcgOrgnization> list = (List<HcgOrgnization>) sessionFactory
				.getCurrentSession().createCriteria(HcgOrgnization.class)
				.add(Restrictions.eq("adminID", adminID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<HcgOrgnization> searchHCGAdmin(String hcgDetail, Integer adminID,String[] searchStatus) {
		List<HcgOrgnization> list = null;

		Criteria criteria = sessionFactory
				.getCurrentSession()
				.createCriteria(HcgOrgnization.class)
				.add(Restrictions.or(Restrictions.or(
						Restrictions.like("firstname", hcgDetail + "%"),
						Restrictions.like("lastname", hcgDetail + "%"))));
			/*	.add(Restrictions.or(Restrictions.like("hcgName", hcgDetail + "%")));*/

		

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
		
		if(adminID==null)
		{
			list = criteria.add(Restrictions.eq("isDeleted", 0)).list();

			return list;
		}

		
		list = criteria.add(Restrictions.eq("adminID", adminID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		
		return list;
	}

	public Serializable create(Object createHcgOrgnization) {
		try {
			Serializable id = sessionFactory.getCurrentSession().save(
					createHcgOrgnization);
			return id;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	public boolean createObject(Users users) {
		try {
			sessionFactory.getCurrentSession().save(users);
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public HcgOrgnization getHCGAdminByID(Integer id) {
		
		HcgOrgnization hcgOrgnization = (HcgOrgnization) sessionFactory.getCurrentSession()
				.createCriteria(HcgOrgnization.class).add(Restrictions.idEq(id))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();
		
		return hcgOrgnization;
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

	@SuppressWarnings("unchecked")
	public List getAllDoctor(Integer adminID) {
		
		List<Doctor> list = (List<Doctor>) sessionFactory
				.getCurrentSession().createCriteria(Doctor.class)
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List getAllNurse(Integer adminID) {
		
		List<Nurse> list = (List<Nurse>) sessionFactory
				.getCurrentSession().createCriteria(Nurse.class)
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	
	@SuppressWarnings("unchecked")
	public List getAllPatient(Integer adminID) {
		
		List<Patient> list = (List<Patient>) sessionFactory
				.getCurrentSession().createCriteria(Patient.class)
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List<HcgOrgnization> getAllHCGAdminByID() {
		@SuppressWarnings("unchecked")
		List<HcgOrgnization> list = (List<HcgOrgnization>) sessionFactory
				.getCurrentSession().createCriteria(HcgOrgnization.class)
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}

	public List<Patient> getAllAssignedPatient(String string, Integer id,Integer hcgID) {
		@SuppressWarnings("unchecked")
		List<Patient> list = (List<Patient>) sessionFactory
				.getCurrentSession().createCriteria(Patient.class)
				.add(Restrictions.eq(string, id))
				.add(Restrictions.eq("hcgID", hcgID))
				.add(Restrictions.eq("isDeleted", 0)).list();
		return list;
	}
    
	public List<Users> getAllBlockedUsers() {
		
		try{
			Query query = sessionFactory.getCurrentSession()
					.createSQLQuery("select u.* from users u join attempt atm join hcgorgnization hcg on u.username=atm.username and u.hcgID=hcg.id where u.enabled=0  and u.password_creation_status=1 and atm.attemp=3")
					.addEntity(Users.class);
		/*	List<Users> list = (List<Users>) sessionFactory
					.getCurrentSession().createCriteria(Users.class)
					.add(Restrictions.eq("password_creation_status", true))
					.add(Restrictions.eq("enabled", false)).list();*/
			List<Users> list = (List<Users>)query.list();
			return list;

		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
	public List<Users> getSearchedBlockedUsers(String username){
		
		try{
		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("select u.* from users u join attempt atm join hcgorgnization hcg on u.username=atm.username and u.hcgID=hcg.id  where u.username like '%"+username+"%' and  u.enabled=0  and u.password_creation_status=1 and atm.attemp=3")
				.addEntity(Users.class);
		List<Users> list =(List<Users>)query.list();
		return list;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
				
	}
	public List<SuperAdmin> getSuperAdminByEmailID(String EmailID){
		try{
			Query query = sessionFactory.getCurrentSession()
					.createSQLQuery("select * from admin where emailID='"+EmailID+"'")
					.addEntity(SuperAdmin.class);
			List<SuperAdmin> list =(List<SuperAdmin>)query.list();
			return list;
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

}
