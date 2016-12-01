<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="include/header.jsp" %>
<head>
	<link rel="stylesheet" href="../../resources/css/index.css" />
	<script src="../../resources/js/jquery.tubular.1.0.js"></script>
	<script src="../../resources/js/index.js"></script>
</head>
<body id="page-top">
	
	<!-- header -->
	<header>
		
		<!-- header image -->
		<div id="header-image">
			<img src="../../resources/img/main_bitcoin_img.png" alt="메인화면 콘텐츠" />
		</div>
	
		<!-- header content -->
		<div id="header-content">
			<img src="../../resources/img/main_typo.png" alt="메인화면 이미지" />
		</div>
		
		<!-- graph link img -->
		<div id="graph-link">
			<a href="/graph"><img src="../../resources/img/graph_button.png" alt="graph-link" /></a> 
		</div>
		
		<!-- news link img -->
		<div id="news-link">
			<a href="/news"><img src="../../resources/img/news_button.png" alt="news-link" /></a>
		</div>
			
		<!-- background -->
		<div id="wrapper">
			
			<!-- grand navigation -->
			<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
	        	<div class="container">
	        
		            <div class="navbar-header">
		            
		                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
		                    <span class="sr-only">Toggle navigation</span> Menu 
		                </button>
		                
		                <a class="navbar-brand" href="index.html">
		                	<img id="main_logo_image" src="../../resources/img/logo_header.png" alt="bitriver_logo" />
		                </a>
		                
		            </div>
		
		            <div class="collapse navbar-collapse navbar-right">
		                <ul class="nav navbar-nav">
		       	 			<li><a href="/graph">실시간 시세</a></li>
							<li><a href="/news">최신 뉴스</a></li>
							<li><a href="/recommand">거래소 추천</a></li>
							<li><a href="/board">게시판</a></li>
							<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>
							<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>
		                </ul>
		            </div>
		            
		          <%@ include file="include/loginout.jsp" %> 	
	           
	      	 	</div> <!-- ./mainNav Container -->
			</nav> <!-- ./mainNav -->	
			
		</div> <!-- ./wrapper -->
		
	</header>
		
	<section class="bg-first">
		<div class="container">
			<div class="row">
		
				<div class="col-md-12 text-center" id="bg-first">
					<img id="bg-first_logo" alt="logo_image" src="../../resources/img/logo_first_section.png">
					<p>Lorem ipsum dolor sit amet, consectetur </p>
					<p>adipiscing elit. Aenean euismod bibendum </p>
					<p>laoreet. Proin gravida dolor sit amet lacus </p>
					<p>accumsan et viverra justo commodo.</p>
				</div>
							
			</div>
		</div>
	</section>
	
	<section class="bg-second">
		<div class="container text-center">
		
			<div class="row second-title">
				<h2>비트리버 서비스</h2>
			</div>
			
			<div class="row second-content">
			
				<div class="col-md-4">
					<img alt="서비스소개" src="../../resources/img/graph_update_black_resize.png">
					<h3>실시간 시세</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br>Aenean euismod bibendum laoreet.<br> Proin gravida dolor sit amet lacus <br>accumsan et viverra justo</p>
				</div>
				
				<div class="col-md-4">
					<img alt="서비스소개" src="../../resources/img/news_update_black_resize.png">
					<h3>비트코인 기사</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br>Aenean euismod bibendum laoreet.<br> Proin gravida dolor sit amet lacus <br>accumsan et viverra justo</p>
				</div>	
					
				<div class="col-md-4">
					<img alt="서비스소개" src="../../resources/img/bitcoin_light_black_psy_resize.png">
					<h3>정보게시판</h3>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. <br>Aenean euismod bibendum laoreet.<br> Proin gravida dolor sit amet lacus <br>accumsan et viverra justo</p>
				</div>	
					
			</div>
		</div>
	</section>
	
	<section class="bg-third">
		<div class="container text-center">
			<div class="row">
				
				<div class="col-md-12">
					
					<h3>비트코인 정보를 이메일로 받아보세요</h3>
					
					<form role="form">
					
						<div class="form-group">
							<input type="email" class="form-control" placeholder="이메일 주소를 입력해 주세요">
						</div>
	
						<button type="submit" class="btn btn-default"> 구독신청 </button>
						
					</form>
					
				</div>
				
			</div>
		</div>
	</section>
	
	<section class="bg-fourth">
		<div class="container">
			<div class="row">
				
			</div>
		</div>
	</section>		

<%@ include file="include/footer.jsp" %>		