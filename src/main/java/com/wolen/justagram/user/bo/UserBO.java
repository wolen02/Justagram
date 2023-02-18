package com.wolen.justagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolen.justagram.common.EncryptUtils;
import com.wolen.justagram.user.dao.UserDAO;
import com.wolen.justagram.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	
	//중복 확인
	public  boolean getCountByLoginId(
			String loginId) {
		
		int count = userDAO.selectCountByLoginId(loginId);
		
		if(count == 1) {
			return true;
		}else {
			return false;
		}
		
		
	}
	
	
	// 유저정보 삽입
	public int addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	
	// 유저 선택
	public User getUser(
			String loginId) {
		
		return userDAO.selectUser(loginId);
	}
	

	
}
