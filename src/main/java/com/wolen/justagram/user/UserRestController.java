package com.wolen.justagram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wolen.justagram.common.EncryptUtils;
import com.wolen.justagram.user.bo.UserBO;
import com.wolen.justagram.user.model.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	
	//중복확인 api
	
	@GetMapping("/duplicate_id")
	public Map<String, Boolean> isDuplicate(
			@RequestParam("loginId") String loginId) {
		
		boolean isDuplicate = userBO.getCountByLoginId(loginId);
		
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("isDuplicate", isDuplicate);
		
		return map;
		
	}	
	
	// 회원가입 api
	
	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email) {
		 
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
			return map;
		}else {
			map.put("result", "fail");
			return map;
		}
	
	}
	
	// 로그인 api 
	
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request){
		
		User user = userBO.getUser(loginId);
		
		Map map = new HashMap<>();
		
		String encryptPassword = EncryptUtils.md5(password);
		
		if(user != null) {
			// 아이디는 맞는데 패스워드가 틀린 경우
			if(!user.getPassword().equals(encryptPassword)) {
				map.put("result", "passFail");
			}else {
				
				// 아이디와 패스워드 둘다 맞는 경우
				HttpSession session = request.getSession();
				session.setAttribute("userId", user.getId());
				session.setAttribute("userName", user.getName());
				
				map.put("result", "success");
			}
				
		}else {
			map.put("result", "idFail");
		}
		return map;
		
	}
	
}
