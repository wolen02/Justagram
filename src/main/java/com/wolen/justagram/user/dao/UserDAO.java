package com.wolen.justagram.user.dao;

import org.apache.ibatis.annotations.Param;

import com.wolen.justagram.user.model.User;

public interface UserDAO {
	
	
	public int selectCountByLoginId(@Param("loginId") String loginId);
	
	
	
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("email") String email);
	
	public User selectUser(
			@Param("loginId") String loginId
			, @Param("password") String password);
	
}
