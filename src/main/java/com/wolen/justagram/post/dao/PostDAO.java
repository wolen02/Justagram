package com.wolen.justagram.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.wolen.justagram.post.model.Post;

@Repository
public interface PostDAO {
	
	
	public List<Post> selectPostList();

	public int insertPost(@Param("userId") int userId 
			,@Param("title") String title
			,@Param("content") String content
			, @Param("imagePath") String imagePath );
	
	public Post selectPost(@Param("postId") int postId);
	
	public int deletePost(@Param("postId") int postId
			, @Param("userId") int userId);
	
}
