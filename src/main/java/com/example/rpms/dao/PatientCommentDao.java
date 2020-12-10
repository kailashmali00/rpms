package com.example.rpms.dao;

import java.util.Collections;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.rpms.domain.Patient;
import com.example.rpms.domain.PatientComment;


@Component
@SuppressWarnings({ "unchecked", "rawtypes" })
public class PatientCommentDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	public List<PatientComment> getPatientCommnet(int maxSize, int patientid){
		List<PatientComment> list = (List<PatientComment>) sessionFactory
				.getCurrentSession().createCriteria(PatientComment.class)
				.add(Restrictions.eq("patientid",patientid))
				.add(Restrictions.eq("stauts", 0)).addOrder(Order.desc("id"))
				.setMaxResults(maxSize).list();
		Collections.reverse(list);
		return list;
	}
	
	public boolean saveComment(PatientComment pc){
		try{
			sessionFactory.getCurrentSession().save(pc);
			return true;
		}catch(Exception e){
			return false;
		}
	}

}
