package com.example.rpms.dao;

import java.util.Date;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.rpms.domain.Attempts;
import com.example.rpms.domain.Users;

@Component
public class MainDao {

	@Autowired
	private SessionFactory sessionFactory;

	public boolean createPassword(String username, String user_id,
			String password) {

		Users list = (Users) sessionFactory.getCurrentSession()
				.createCriteria(Users.class).add(Restrictions.idEq(username))
				.add(Restrictions.eq("uniqueID", user_id))
				.add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0))
				.add(Restrictions.eq("password_creation_status", false))
				.uniqueResult();

		if (list != null) {
			System.out.println("not null");
			list.setPassword(password);
			list.setPassword_creation_status(true);
			list.setUpdatedAT(new Date());
			update(list);
			return true;
		}

		return false;
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

	public Users updatePassword(String username) {
		Users list = (Users) sessionFactory.getCurrentSession()
				.createCriteria(Users.class).add(Restrictions.idEq(username))
				.add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();
		if (list != null) {
			System.out.println("not null");
			return list;
		}

		return null;
	}

	public boolean updateNewPassword(String username, String user_id,
			String password) {
		
		Users list = (Users) sessionFactory.getCurrentSession()
				.createCriteria(Users.class).add(Restrictions.idEq(username))
				.add(Restrictions.eq("uniqueID", user_id))
				.add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0))
				.add(Restrictions.eq("password_creation_status", true))
				.uniqueResult();

		if (list != null) {
			System.out.println("not null");
			list.setPassword(password);
			list.setPassword_creation_status(true);
			list.setUpdatedAT(new Date());
			update(list);
			return true;
		}

		return false;
	}

	public Attempts getAttemptsByUserName(String string, String username) {
		Attempts list = (Attempts) sessionFactory.getCurrentSession()
				.createCriteria(Attempts.class)
				.add(Restrictions.eq(string, username)).uniqueResult();
		
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

}
