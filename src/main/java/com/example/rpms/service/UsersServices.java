package com.example.rpms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.example.rpms.dao.UsersDao;
import com.example.rpms.domain.Users;

@Component
@Transactional
public class UsersServices {

	@Autowired
	UsersDao usersDao;

	public Users getUserByUsername(String username) {

		Users users = usersDao.getUserByUsername(username);

		if (users == null) {
			return null;
		}

		Users newUser = new Users();
		newUser.setUsername(users.getUsername());
		newUser.setUniqueID(users.getUniqueID());
		newUser.setHcgID(users.getHcgID());
		newUser.setPatientID(users.getPatientID());
		newUser.setDocID(users.getDocID());
		newUser.setNurseID(users.getNurseID());
		newUser.setAdminID(users.getAdminID());

		return newUser;
	}
}
