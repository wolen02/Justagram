package com.wolen.justagram.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wolen.justagram.post.dao.PostDAO;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId ,String title, String content) {
		
		return postDAO.insertPost(userId, title, content);
		
	}
	
	
}
