package com.wolen.justagram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wolen.justagram.user.bo.UserBO;

@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/user/signup")
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
	
}
