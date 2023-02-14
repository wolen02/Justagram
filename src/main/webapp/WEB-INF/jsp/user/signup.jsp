<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div id="wrap">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
			<div>
				<div class="border rounded shadow-lg">
					<div class="d-flex justify-content-center logo">
						<h1>JuStargram</h1>
					</div>
					<div class="d-flex align-items-center justify-content-center">
						<div>
							<div class="d-flex mt-2">
								<input type="text" placeholder="아이디" id="inputLoginId" class="form-control">
								<button type="button" id="duplicationBtn" class="btn btn-primary ml-2">중복확인</button>
							</div>
							<input type="password" placeholder="비밀번호" id="inputPassword"  class="form-control mt-2">
							<input type="password" placeholder="비밀번호 확인" id="inputConfirmPassword"  class="form-control mt-2">
							<input type="text" placeholder="이름" id="inputName"  class="form-control mt-2">
							<input type="text" placeholder="이메일" id="inputEmail"  class="form-control mt-2">
							<button class="btn btn-primary btn-block my-2" id="joinBtn">가입</button>
						</div>
					</div>					
				</div>
				
				<div class="border d-flex justify-content-center mt-3 login_part align-items-center rounded shadow-lg">
						계정이 있으신가요? <a href="/user/signin/view">로그인</a>
				</div>
			</div>
		</section>
		
		<br>
		<hr>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	</div>
	
	
	<script>
		$(document).ready(function(){
			
			//중복확인
			
			var isDuplicateCheck = false;
			
			$("#duplicationBtn").on("click", function(){
				let id = $("#inputLoginId").val();
				
				if(id == ""){
					alert("아이디를 입력해주세요");
					return;
				}
				
				$.ajax({
					type:"get"
					,url:"/user/duplicate_id"
					,data:{"loginId":id}
					,success:function(data){
						
						if(data.isDuplicate){
							alert("다른아이디를 사용해주세요.");
						}else{
							alert("사용가능합니다.");
							isDuplicateCheck = true;
						}						
					}
					,error:function(){
						alert("에러!");
					}
				})
				
				
			});
			
			
			
			
			
			
			
			// 회원가입
			$("#joinBtn").on("click", function(){
				let id = $("#inputLoginId").val();
				let password = $("#inputPassword").val();
				let confirmPassword = $("#inputConfirmPassword").val();
				let name = $("#inputName").val();
				let email = $("#inputEmail").val();
				
				if(id == ""){
					alert("아이디를 입력해주세요");
					return;
				}
				
				if(password == ""){
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				if(confirmPassword == ""){
					alert("비밀번호 확인란을 입력해주세요");
					return;
				}
				
				
				if(name == ""){
					alert("이름을 입력해주세요");
					return;
				}
				
				if(email == ""){
					alert("이메일을 입력해주세요");
					return;
				}
				
				if(!isDuplicateCheck){
					alert("아이디 중복확인을 해주세요.");
					return;
				}
				
				
				if(password != confirmPassword){
					alert("비밀번호를 확인해주세요");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId":id, "password": password, "name":name, "email":email}
					,success:function(data){
						if(data.result == "success"){
							location.href="/user/signin/view";
						}else{
							alert("회원가입 실패!");
						}
					}
					,error:function(){
						alert("회원가입 오류!");
					}					
				});
				
			})
		});
	
	
	</script>

</body>
</html>