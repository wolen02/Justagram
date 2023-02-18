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
<link rel="stylesheet" href="/static/css/style3.css" type="text/css">
</head>
<body>

	<div id="wrap">
		
		<h3>Justagram</h3>
		
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		
			<nav class="bg-success">
				
				<div class="d-flex justify-content-center">
					<ul class="nav nav-fill w-100">
						<li class="nav-item"><a href="#" class="nav-link text-dark">홈</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-dark">검색</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-dark">탐색탭</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-dark">릴스</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-dark">메세지</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-dark">알림</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-dark">게시물</a></li>
						<li class="nav-item"><a href="#" class="nav-link text-dark">프로필</a></li>
					</ul>
				</div>
			</nav>
			
			<section class="bg-warning d-flex justify-content-center">
				<div class="border border-dark rounded d-flex justify-content-center post  mt-5">
					<div>
						<span>이름</span><span>몇분전</span><span>...</span>
						<div class="border border-dark rounded mt-3 photo">
							<img href="#" alt="사진">
						</div>
						
						<div class="d-flex">하트 댓글 디엠보내기</div>
						
						<div class="border border-dark rounded mt-3 comment">
							
						</div>
					
					</div>
				
				</div>
			</section>
		
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
		


</body>
</html>