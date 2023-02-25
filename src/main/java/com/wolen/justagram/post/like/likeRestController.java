package com.wolen.justagram.post.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wolen.justagram.post.like.bo.LikeBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/post")
public class likeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/like")
	public Map<String, String> like(
			@RequestParam("postId") int postId
			, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = likeBO.addLike(userId, postId);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
		
	}
}
