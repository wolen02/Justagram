package com.wolen.justagram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wolen.justagram.common.FileManagerService;
import com.wolen.justagram.post.dao.PostDAO;
import com.wolen.justagram.post.like.bo.LikeBO;
import com.wolen.justagram.post.model.Post;
import com.wolen.justagram.post.model.PostDetail;
import com.wolen.justagram.user.bo.UserBO;
import com.wolen.justagram.user.model.User;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private UserBO userBO;
	
	
	@Autowired
	private LikeBO likeBO;
	
	public List<PostDetail> getPostList(int userId){
		
		List<Post> postList = postDAO.selectPostList();
		
		// 생성된 postDetail 객체를 리스트로 구성
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			PostDetail postDetail = new PostDetail();
			
			User user = userBO.getUserById(post.getUserId());
			// 좋아요 개수 조회
			int likeCount = likeBO.likeCount(post.getId());
			
			// 좋아요 여부 조회
			boolean isLike = likeBO.isLike(post.getId(), userId);
			postDetail.setLike(isLike);
			
			
			postDetail.setId(post.getId());
			postDetail.setUserId(post.getUserId());
			postDetail.setContent(post.getContent());
			postDetail.setImagePath(post.getImagePath());
			postDetail.setCreatedAt(post.getCreatedAt());
			postDetail.setUserName(user.getName());
			postDetail.setLikeCount(likeCount);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
	}
	
	public int addPost(int userId ,String title, String content, MultipartFile file) {
		
		String imagePath = FileManagerService.saveFile(userId, file);
		
		
		return postDAO.insertPost(userId, title, content, imagePath);
		
	}
	
	
}
