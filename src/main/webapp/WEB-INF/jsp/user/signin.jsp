<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style2.css" type="text/css">
</head>
<body>

	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
			
			<div>
				<div class="border border-dark rounded shadow-lg">
				
					<div class="d-flex justify-content-center logo mt-2">
						<h1>JuStargram</h1>
					</div>
				
					<div class="d-flex justify-content-center">
						<form id="loginForm">
							<input type="text" id="inputId" placeholder="아이디" class="form-control mt-2">
							<input type="password" id="inputPass" placeholder="비밀번호" class="form-control mt-2">
							<button type="submit" id="loginBtn" class="btn btn-primary btn-block my-4">로그인</button>
						</form>
					</div>
				
				
					<div class="d-flex">
						<hr class="col-3">
						<span>또는</span>
						<hr class="col-3">
					</div>
					
					<div class="small text-center my-3">비밀번호를 잊으셨나요?</div>
				
			
				</div>
			
				<div class="border border-dark rounded shadow-lg logo mt-3">
					
					<div class="box1  d-flex justify-content-center align-items-center">
						계정이 없으신가요? <a href="/user/signup/view">가입하기</a>			
					</div>
				
				</div>
				
			</div>	
			
		</section>
		
		
		<hr>

		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#loginForm").on("submit", function(e){
			//$("#loginBtn").on("click", function(){
				
				// 해당 이벤트의 기능을 모두 취소한다.
				e.preventDefault();
				
				let id = $("#inputId").val();
				let password = $("#inputPass").val();
				
				if(id == ""){
					alert("아이디를 입력해주세요.");
					return;
				}
				
				if(password == ""){
					alert("비밀번호를 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post"
					,url:"/user/signin"
					,data:{"loginId": id, "password": password}
					,success:function(data){
						if(data.result == "success"){
							location.href="/post/timeline/view";
						}else if(data.result == "idFail"){
							alert("아이디를 확인해주세요.");
							return;
						}else{
							alert("비밀번호를 확인해주세요.");
							return;
						}
						
						
					}
					,error:function(){
						alert("로그인 에러!");
					}
				})
				
				
			})
			
			
		})
	</script>
</body>
</html>