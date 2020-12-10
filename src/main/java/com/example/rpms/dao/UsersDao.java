package com.example.rpms.dao;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.example.rpms.domain.Users;

@Component
public class UsersDao {

	@Autowired
	private SessionFactory sessionFactory;

	public Users getUserByUsername(String username) {

		Users list = (Users) sessionFactory.getCurrentSession()
				.createCriteria(Users.class).add(Restrictions.idEq(username))
				//.add(Restrictions.eq("status", 0))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();

		return list;
	}

	public Users getUserByID(String string, Integer id) {

		Users list = (Users) sessionFactory.getCurrentSession()
				.createCriteria(Users.class).add(Restrictions.eq(string, id))
				.add(Restrictions.eq("isDeleted", 0)).uniqueResult();

		return list;
	}

	public boolean saveAndUpdate(Object object) {
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(object);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}

	}

	public boolean update(String userSql, String authSql) {
		try {
			
			SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					userSql);
			query.executeUpdate();
			
			SQLQuery authquery = sessionFactory.getCurrentSession().createSQLQuery(
					authSql);
			authquery.executeUpdate();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;

		}
	}

}
