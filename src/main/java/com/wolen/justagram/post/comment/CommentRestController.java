package com.wolen.justagram.post.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.wolen.justagram.post.comment.bo.CommentBO;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/post/comment")
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;

	@PostMapping("/create")
	public Map<String, String> createComment(
			@RequestParam("postId") int postId
			,@RequestParam("content") String content
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		int count = commentBO.addComment(userId, postId, content);
		
		Map<String, String> map = new HashMap<>();
		
		if(count == 1) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}
		
		return map;
		
		
		
	}
	
	
}
