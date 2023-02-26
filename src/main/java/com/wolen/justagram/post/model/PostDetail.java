package com.wolen.justagram.post.model;

import java.util.Date;
import java.util.List;

import com.wolen.justagram.post.comment.model.Comment;
import com.wolen.justagram.post.comment.model.CommentDetail;

/**
 * @author wnwlt
 *
 */
public class PostDetail {

	private int id;
	private int userId;
	private String userName;
	private String content;
	private String imagePath;
	private Date createdAt;
	private int likeCount;
	private boolean isLike;
	private List<CommentDetail> commentList;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}	
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public boolean isLike() {
		return isLike;
	}
	public void setLike(boolean isLike) {
		this.isLike = isLike;
	}
	public List<CommentDetail> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommentDetail> commentList) {
		this.commentList = commentList;
	}
	
	
}
