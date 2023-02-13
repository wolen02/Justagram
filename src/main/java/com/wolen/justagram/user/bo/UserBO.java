package com.wolen.justagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolen.justagram.user.dao.UserDAO;
import com.wolen.justagram.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	// 유저 선택
	public User getUser(
			String loginId
			, String password
			, String name
			, String email) {
		return userDAO.selectUser(loginId, password, name, email);
	}
	
	// 유저정보 삽입
	public int addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		return userDAO.insertUser(loginId, password, name, email);
	}
	
}
