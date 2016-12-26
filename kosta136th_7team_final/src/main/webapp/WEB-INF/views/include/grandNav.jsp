<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<body>

	<nav id="mainNav" class="navbar navbar-default navbar-static-top navbar-fixed-top">
	
		<div id="nav_container" class="container">
		
			<div class="navbar-header">
			
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> Menu
				</button>
				
				<a href="/" class="navbar-brand">
					<img id="main_logo_image" src="../../resources/img/140x56_BitRiver_black.png" alt="bitriver_logo" />
				</a>
				
			</div>
			
			<div class="collapse navbar-collapse navbar-right">
				<ul class="nav navbar-nav">

					<li><a href="/marketPrice">시세</a></li>
					<li><a href="/news">비트코인뉴스</a></li>
					<li><a href="/sub/btcInfoLand/btcInfoLand">리버커뮤니티</a></li>

				</ul>
			</div>
			
			<%@ include file="loginout.jsp" %>
			
		</div> <!-- ./mainNav Container -->
	
	</nav> <!-- ./navbar -->
	<script>
	$(document).ready(function(){
		loginCheck = "${empty login}"
		if(loginCheck == "true")
		{
			$('.navbar-nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
			$('.navbar-nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>');
	
		}
		else
		{
			$('.navbar-nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
			$('.navbar-nav').append('<li><a href="#" id="signoutBtn">로그아웃</a></li>');
		}
		
	});
	</script>

	
	