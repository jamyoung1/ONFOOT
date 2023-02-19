<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="/resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" href="../resources/css/loginpage.css" />
<%@include file="../fragments/header.jsp"%>



<body class="text-center">
	<div id="container">
		<form id="login_form" method="post">
			<div id="loginBox">
				<div id="loginBoxTitle">ONLOOK LOGIN</div>
				<div id="inputBox">
					<div class="input-form-box">
						<strong style="width: 80px;">아이디 </strong><input type="text"
							name="userid" class="form-control id-login-input">
					</div>
					<div class="input-form-box">
						<strong style="width: 80px;">비밀번호 </strong><input type="password"
							name="passwd" class="form-control passwd-login-input">
					</div>
						<c:if test="${result==0}">
							<span class="login-fail">ID 또는 비밀번호를 잘못 입력하셨습니다</span>
						</c:if>	
					<div class="button-login-box">
						<button type="button" class="btn btn-primary btn-s" id="login-btn"
							style="width: 100%; height: 50px; background-color: black;">로그인</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	

<script>
	$("#login-btn").click(function(){
		// alert("login");
		$("#login_form").attr("action","/user/login");
		$("#login_form").submit();
	});
	
</script>	