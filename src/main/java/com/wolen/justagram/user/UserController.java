package com.wolen.justagram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signup/view")
	public String signup() {
		
		return "/user/signup";
	}
	
	@GetMapping("/signin/view")
	public String signin() {
		
		return "/user/signin";
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		return "redirect:/user/signin/view";
		
	}
	
}
