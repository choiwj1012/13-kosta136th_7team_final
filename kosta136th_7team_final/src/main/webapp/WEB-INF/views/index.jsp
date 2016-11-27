<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="include/header.jsp" %>
<head>
	<link rel="stylesheet" href="../../resources/css/index.css" />
</head>
<body id="page-top">	
	<header>
		<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	
	        <div class="container-fluid">
	        
	            <div class="navbar-header">
	                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="navbar-collapse-1">
	                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
	                </button>
	                <a class="navbar-brand" href="#page-top">비트리버</a>
	            </div>
	
	            <div class="collapse navbar-collapse" id="navbar-collapse-1">
	                <ul class="nav navbar-nav navbar-right">
	       	 			<li><a href="#">실시간 시세</a></li>
						<li><a href="#">최신 뉴스</a></li>
						<li><a href="#">거래소 추천</a></li>
						<li><a href="#">게시판</a></li>
						<li><a href="#">회원가입</a></li>
						<li><a href="#">로그인</a></li>
	                </ul>
	            </div>
	            
	        </div>
		</nav>	
	
		<div class="header-content">
		    <div class="header-content-inner">
		        <h1 id="homeHeading">비트코인에 대한 모든 것. 비트리버</h1>
		        <hr>
		        <p>시세부터 최신뉴스까지 한번에 볼 수 있습니다</p>
		        <a href="#" class="btn btn-primary btn-xl page-scroll">시세보러가기</a>
		        <a href="#" class="btn btn-primary btn-xl page-scroll">최신뉴스보러가기</a>
		    </div>
		</div>
	
	</header>
		
	<section class="bg-first">
		<div class="container">
			<div class="row">
		
				<div class="col-md-12 text-center">
					<img alt="이미지" src="http://lorempixel.com/140/140/" class="img-circle">
					<h2>비트리버</h2>
					<p>비트코인에 대한 최고의 정보를 제공합니다</p>
				</div>
							
			</div>
		</div>
	</section>
	
	<section class="bg-second">
		<div class="container">
			<div class="row">
			
				<div class="col-md-2">
					<img alt="서비스소개" src="http://lorempixel.com/140/140/" class="img-circle">
				</div>
				
				<div class="col-md-10">
					<p>lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum</p>
				</div>	
					
			</div>
		</div>
	</section>
	
	<section class="bg-third">
		<div class="container">
			<div class="row">
				
				<div class="col-md-2">
					<img alt="회사소개" src="http://lorempixel.com/140/140/" class="img-circle">
				</div>
				
				<div class="col-md-10">
					<p>lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum</p>
				</div>
				
			</div>
		</div>
	</section>
	
	<section class="bg-fourth">
		<div class="container">
			<div class="row">
				
				<div class="col-md-2">
					<img alt="비트코인 소개" src="http://lorempixel.com/140/140/" class="img-circle">
				</div>
				
				<div class="col-md-10">
					<p>lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum</p>
				</div>
				
			</div>
		</div>
	</section>		

	<section class="bg-fifth">
		<div class="container">
			<div class="row">
				
				<div class="col-md-12 text-center">
					
					<h3>최신 정보를 구독하시려면 이메일을 보내주세요 !</h3>
					
					<form role="form">
					
						<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일 주소를 입력해 주세요">
						</div>
	
						<button type="submit" class="btn btn-default"> 이메일 보내기 </button>
						
					</form>
					
				</div>
				
			</div>
		</div>
	</section>

	<section class="bg-sixth">
		<div class="container">
			<div class="row">
				
				<div class="col-md-12">
					<img alt="협찬사 사진" src="http://lorempixel.com/140/140/" class="img-circle">
				</div>
		
			</div>
		</div>
	</section>
			


<%@ include file="include/footer.jsp" %>		