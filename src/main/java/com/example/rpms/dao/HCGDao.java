package com.example.rpms.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
import com.example.rpms.domain.Users;

@Component
public class HCGDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Count dashboardCount(Integer hcgID) {
		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("CALL rpms_admin_dashboard(" + hcgID + ")")
				.addEntity(Count.class);

		Count count = (Count) query.uniqueResult();

		System.out.println(count.getDoctorCount() + "/" + count.getNurseCount()
				+ "/" + count.getPatientCount() + "/"
				+ count.getUnAssignedPatientCount());

		return count;
	}

	public Serializable create(Object createPatient) {
		try {
			Serializable id = sessionFactory.getCurrentSession().save(
					createPatient);
			return id;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	public boolean createObject(Object createPatient) {
		try {
			sessionFactory.getCurrentSession().save(createPatient);
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public HcgOrgnization getHCGByID(Integer id) {
		HcgOrgnization hcgOrgnization = (HcgOrgnization) sessionFactory
				.getCurrentSession().createCriteria(HcgOrgnization.class)
				.add(Restrictions.idEq(id))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();
		return hcgOrgnization;
	}

	public boolean update(HcgOrgnization orgnization) {
		try {
			sessionFactory.getCurrentSession().update(orgnization);
		
					
		
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updatePhysologicaldata(Double suger, Double pressure,
			Integer hcgID) {
		System.out.println(suger+"/"+pressure+"/"+hcgID);
		try {
			
			
			Query query1 = sessionFactory.getCurrentSession()
					.createSQLQuery("CALL rpms_changed_categories("+suger+","+pressure+","+ hcgID +")")
					.addEntity(Count.class);

			//query1.executeUpdate();
			
			Query query2 = sessionFactory.getCurrentSession()
					.createSQLQuery("CALL rpms_changed_categories_suger("+suger+","+ hcgID +")")
					.addEntity(Count.class);

			//query2.executeUpdate();
			
			Query query3 = sessionFactory.getCurrentSession()
					.createSQLQuery("CALL rpms_changed_categories_pressure("+pressure+","+ hcgID +")")
					.addEntity(Count.class);

			//query3.executeUpdate();
			System.out.println("query 1 : "+query1.executeUpdate());
			System.out.println("query 2 : "+query2.executeUpdate());
			System.out.println("query 3 : "+query3.executeUpdate());
			return true;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public List<HcgOrgnization> getHCGByEmailId(String userid){
		
		try{
			   Query query =sessionFactory.getCurrentSession()
					   		.createSQLQuery("select firstname,lastname,emailID from hcgorgnization where emailID='"+userid+"'")
					   		.addEntity(HcgOrgnization.class);
			   List<HcgOrgnization> hcgdata = (List<HcgOrgnization>)query.list();
			   
			   return hcgdata;
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			return null;
			
		}
	}
public List<Patient> getAllBlockedPatients(Integer hcgid,String uservalue) {
		
		try{
			
			
			Query query = sessionFactory.getCurrentSession()
					.createSQLQuery("select pt.* from users u join attempt atm join patient pt on u.username=atm.username and pt.id=u.patientID   where  u.enabled=0 and pt.hcgID='"+hcgid+"' and u.password_creation_status=1 and atm.attemp=3")
					.addEntity(Patient.class);
			List<Patient> list = (List<Patient>)query.list();
				
			
			return list;

		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
	}
public List<Nurse> getAllBlockedNurses(Integer hcgid,String uservalue) {
	
	try{
		
		
		
		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("select nr.* from users u join attempt atm join nurse nr on u.username=atm.username and nr.id=u.nurseID   where u.enabled=0 and nr.hcgID='"+hcgid+"' and u.password_creation_status=1 and atm.attemp=3")
				.addEntity(Nurse.class);
		List<Nurse> list = (List<Nurse>)query.list();
		
	
		return list;

	}
	catch(Exception e){
		e.printStackTrace();
		return null;
	}
	
}
public List<Doctor> getAllBlockedDoctors(Integer hcgid,String uservalue) {
	
	try{
		
		
	
		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("select dc.* from users u join attempt atm join doctor dc on u.username=atm.username and dc.id=u.docID   where u.enabled=0 and dc.hcgID='"+hcgid+"' and u.password_creation_status=1 and atm.attemp=3")
				.addEntity(Doctor.class);
		List<Doctor> list = (List<Doctor>)query.list();
		
		
		return list;

	}
	catch(Exception e){
		e.printStackTrace();
		return null;
	}
	
}

public List<Users> getSearchedBlockedUsers(String username ,Integer hcgid){
	
	try{
		
		Query query = sessionFactory.getCurrentSession()
				.createSQLQuery("select u.* from users u join attempt atm join patient pt on u.username=atm.username and pt.id=u.patientID   where u.username like '%"+username+"%' and u.enabled=0 and pt.hcgID='"+hcgid+"' and u.password_creation_status=1 and atm.attemp=3")
				.addEntity(Users.class);
		List<Users> list1 = (List<Users>)query.list();
		Query query1 = sessionFactory.getCurrentSession()
				.createSQLQuery("select u.* from users u join attempt atm join nurse nr on u.username=atm.username and nr.id=u.nurseID   where u.username like '%"+username+"%' and u.enabled=0 and nr.hcgID='"+hcgid+"' and u.password_creation_status=1 and atm.attemp=3")
				.addEntity(Users.class);
		List<Users> list2 = (List<Users>)query1.list();
		Query query3 = sessionFactory.getCurrentSession()
				.createSQLQuery("select u.* from users u join attempt atm join doctor dc on u.username=atm.username and dc.id=u.docID   where u.username like '%"+username+"%' and u.enabled=0 and dc.hcgID='"+hcgid+"' and u.password_creation_status=1 and atm.attemp=3")
				.addEntity(Users.class);
		List<Users> list3 = (List<Users>)query3.list();
		
		List<Users> list= new ArrayList<Users>();
		for(Users u : list1)
			list.add(u);
		for(Users u : list2)
			list.add(u);
		for(Users u : list3)
			list.add(u);
		
		return list;

	}
	catch(Exception e){
		e.printStackTrace();
		return null;
	}
			
}

}
