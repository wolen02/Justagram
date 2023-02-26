<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타임라인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="/static/css/style3.css" type="text/css">
</head>
<body>

	<div id="wrap">
				
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		
			<nav class="bg-success">
				
				<div class="d-flex justify-content-center">
					<ul class="nav nav-fill w-100">
						<li class="nav-item"><a href="/post/create/view" class="nav-link text-dark">게시물 작성</a></li>
					</ul>
				</div>
			</nav>
			
			<section class="d-flex justify-content-center">
				
				
				<div>

					<c:forEach var="post" items="${posts }">
						<div class="border border-dark rounded d-flex justify-content-center post my-5">
						
							<div>

								<div class="d-flex justify-content-between">
									<span class="mt-2 ml-2">${post.userName }</span> 
									<%-- 로그인한 userId와 해당 게시글의 작성자 userId 가 일치하는 경우만 more-btn을 보여줘라 --%>
									<c:if test="${userId eq post.userId }">
									
									 <div class="more-btn" data-toggle="modal" data-target="#moreMenuModal" data-post-id="${post.id }"><i class="bi bi-three-dots btn"></i></div>							
									</c:if>
								</div>
								
								<div>
									<img width="400px" height="500px" class="px-1" src="${post.imagePath }" alt="사진">
								</div>
								<div class="d-flex">
									<c:choose>
										<c:when test="${post.like }">
											<i class="bi bi-heart-fill btn text-danger heart-fill-btn" data-post-id="${post.id }"><span class="small ml-2">좋아요 ${post.likeCount }개</span></i>
										</c:when>
										
										<c:otherwise>
											<i class="bi bi-suit-heart btn like-btn" data-post-id="${post.id }"><span class="small ml-2">좋아요 ${post.likeCount }개</span></i> 
										</c:otherwise>
									</c:choose>
									
								
									<i class="bi bi-chat btn"></i>
								 	<i class="bi bi-chat-left-fill btn"></i>
								 </div>
								
								<div class="ml-3">
									<c:forEach var="comment" items="${post.commentList }">
										<div><b>${comment.userName }</b> ${comment.content }</div>
									</c:forEach>
								</div>
						
								<div class="d-flex my-2 px-1 small">
									<input class="form-control mr-2" id="commentInput${post.id }" type="text" placeholder="댓글 달기..">
									<button class="btn btn-info comment-btn" data-post-id="${post.id }" type="button">입력</button>
								</div>
						
							</div>
				
						</div>
					</c:forEach>
				</div>
				
			</section>
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  				Launch demo modal
			</button>
			
			<div class="modal fade" id="moreMenuModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			     
			      <div class="modal-body text-center">
					<a href="#" id="deleteBtn" data-post-id="">삭제하기</a>
			      </div>
			    </div>
			  </div>
			</div>
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
		
	<script>
		$(document).ready(function(){
			
			$(".more-btn").on("click", function(){
				// 해당 more-btn 태그에 있는 post-id를 모달의 a태그에 넣는다.
				
				let postId = $(this).data("post-id");
				
				
				// data-post-id=""
				$("#deleteBtn").data("post-id", postId);
				
				
			});
			
			$("#deleteBtn").on("click", function(){
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/delete"
					, data:{"postId": postId}
					, success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("게시물 삭제 실패");
						}
					}
					, error:function(){
						alert("게시물 삭제 오류");
					}
				});
				
			});
			
			
			$(".heart-fill-btn").on("click", function(){
					let postId = $(this).data("post-id");
					
					$.ajax({
						type:"get"
						, url:"/post/unlike"
						, data:{"postId": postId}
						, success:function(data){
							if(data.result == "success"){
								location.reload();
							}else{
								alert("좋아요 취소 실패");
							}
							
						}
						, error:function(){
							alert("좋아요 취소 오류");
						}
					});
			});
			
			
			$(".comment-btn").on("click", function(){
				
				// post id, 작성한 댓글내용
				let postId = $(this).data("post-id");
				
				// 바로 이전 태그
				//let comment = $(this).prev().val();
				
				// 형제태그
				//$(this).siblings()[0];
				
				let comment = $("#commentInput" + postId).val();
				
				$.ajax({
					type:"post"
					,url:"/post/comment/create"
					, data:{"postId": postId, "content": comment}
					, success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("댓글 작성 실패");
						}
					}
					,error:function(){
						alert("댓글 작성 오류");					}
				})
				
			});
			
			
			
			$(".like-btn").on("click", function(){
				
				// 클릭한 하트 아이콘을 지칭하는 this
				let id = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId": id}
					, success:function(data){
						if(data.result == "success"){
							location.reload();
						}else{
							alert("좋아요 실패");
						}
					}
					, error: function(){
						alert("좋아요 오류");
					}
					
					
				});

			});
			
		});	
	
	</script>


</body>
</html>