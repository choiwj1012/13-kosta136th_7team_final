<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>

	<nav id="mainNav" class="navbar navbar-default navbar-static-top navbar-default">
	
		<div class="container">
		
			<div class="navbar-header">
			
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> Menu
				</button>
				
				<a href="/" class="navbar-brand">
					<img id="main_logo_image" src="../../resources/img/logo_header.png" alt="bitriver_logo" />
				</a>
				
			</div>
			
			<div class="collapse navbar-collapse navbar-right">
				<ul class="nav navbar-nav">
					<li><a href="/marketPrice">실시간 시세</a></li>
					<li><a href="/news">최신 뉴스</a></li>
					<li><a href="/btcInfoLand">BTC 정보광장</a></li>
					<li><a href="/board_list">자유게시판</a></li>
				</ul>
			</div>
			
			<%@ include file="loginout.jsp" %>
			
		</div> <!-- ./mainNav Container -->
	
	</nav> <!-- ./navbar -->

	<script>
		var signinSession = { 'email' : '',
							'nickname' : ''};
		var isSignupEmailUnique = false;
		var isAuthenticate = false;
	</script>
	
	<c:if test="${not empty signinSessionDTO}">
		<script>
			signinSession.email = 
				'${signinSessionDTO.email}';
			signinSession.nickname = '${signinSessionDTO.nickname}';
		</script>
	</c:if>
	
	<script>
	$(document).ready(function(){
		if (signinSession.email === '' || signinSession.nickname === ''){
			$('.navbar-nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
			$('.navbar-nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>');	
		} else {
			$('.navbar-nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
			$('.navbar-nav').append('<li><a href="#" id="signoutBtn">로그아웃</a></li>');
		}
	});
	</script>		