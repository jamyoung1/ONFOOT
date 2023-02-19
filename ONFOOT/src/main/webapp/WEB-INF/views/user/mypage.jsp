<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<link href="/resources/css/styles.css" rel="stylesheet" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
	

<link rel="stylesheet" href="../resources/css/mypage.css" />	
<%@include file="../fragments/header.jsp"%>




<body class="text-center">
	<div id="container">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<span>${user.userid}</span>
				</td>
			</tr>
			
			<tr>
				<td>비밀번호</td>
				<td>
					<button>패스워드 변경</button>
				</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td>
					<span>${user.name}</span>
				</td>
			</tr>
			
			<tr>
				<td>주소지</td>
				<td>
					<span>${user.addr}</span>
				</td>
			</tr>
			
			<tr>
				<td>연락처</td>
				<td>
					<span>${user.phone}</span>
				</td>
			</tr>
			
			<tr>
				<td>이메일</td>
				<td>
					<span>${user.email}</span>
				</td>
			</tr>
		</table>
	</div>

</body>