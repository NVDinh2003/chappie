package com.chappie.service;

import java.util.List;

import javax.inject.Inject;

import com.chappie.dao.UserDAO;
import com.chappie.model.User;

public class UserService {

	@Inject
	private UserDAO userDAO;

	public User findByUserNameAndPassWord(String username, String password) {
		return userDAO.findByUserNameAndPassWord(username, password);
	}

	public List<User> findAll() {

		return userDAO.findAll();
	}

	public void save(User user) {
		userDAO.save(user);
	}

	public boolean exists(String email, String sdt) {
		return userDAO.exists(email, sdt);
	}

	public User findByPhoneNumber(String phone) {
		return userDAO.findByPhoneNumber(phone);

	}

	public User getUserByEmail(String email) {

		return userDAO.findByEmail(email);
	}

}
