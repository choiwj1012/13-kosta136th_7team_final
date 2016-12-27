<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="include/header.jsp" %>
<head>
	<link rel="stylesheet" href="../../resources/css/index.css" />
	<script src="../../resources/js/jquery.tubular.1.0.js"></script>
	<script src="https://code.highcharts.com/stock/highstock.js"></script>			<!-- 차트 API js -->
	<script src="../../../resources/js/index_chart.js"></script>				<!-- 차트 구현 js -->
	<script src="../../../resources/js/marketPrice_chart_customizing.js"></script>	<!-- 디자인 커스터마이징 js -->
	<!-- <script src="../../resources/js/index.js"></script> -->
</head>
<body id="page-top">
	
	<!-- header -->
	<header>
		
		<!-- header image -->
		<div id="header-image">
			<img src="../../resources/img/main_bitcoin_img.png" alt="메인화면 콘텐츠" id="main_coin_img"/>
		</div>
	
		<!-- header content -->
		<div id="header-content">
			<img src="../../resources/img/main_typo.png" alt="메인화면 이미지" id="main_typo_img"/>
		</div>
		
		<!-- graph link img -->
		<div id="graph-link">
			<a href="/marketPrice"><img src="../../resources/img/graph_button.png" alt="graph-link" id="graph-link_img"/></a> 
		</div>
		
		<!-- news link img -->
		<div id="news-link">
			<a href="/news"><img src="../../resources/img/news_button.png" alt="news-link" id="news-link_img"/></a>
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
		                
		                <a class="navbar-brand" href="/">
		                	<img id="main_logo_image" src="../../resources/img/140x56_BitRiver_black.png" alt="bitriver_logo" />
		                </a>
		                
		            </div>
		
		            <div class="collapse navbar-collapse navbar-right">
		                <ul class="nav navbar-nav">
		                
		       	 			<li><a href="/marketPrice">시세</a></li>
							<li><a href="/news">비트코인뉴스</a></li>
							<li><a href="sub/btcInfoLand/btcInfoLand">리버커뮤니티</a></li>

		                </ul>
		            </div>
		            
		          <%@ include file="include/loginout.jsp" %> 	
	           
	      	 	</div> <!-- ./mainNav Container -->
			</nav> <!-- ./mainNav -->	
			
		</div> <!-- ./wrapper -->
		
	</header>
		
	<section class="bg-chart">
		
		<div class="col-md-offset-1 col-md-10 text-center">
			
			<div class="col-sm-12">
				<div id="USD_Bitcoin_info">USD / Bitcoin</div>
				<div id="USD_Bitcoin"></div>
			</div>
			<div class="col-lg-6">
				<div class="col-sm-6">	
					<div id="USD_Litecoin_info">USD / Litecoin</div>				
					<div id="USD_Litecoin"></div>
				</div>
				<div class="col-sm-6">
					<div id="USD_Ethereum_info">USD / Ethereum</div>				
					<div id="USD_Ethereum"></div>
				</div>
			</div>
			
			
			<div class="col-lg-6">
				<div class="col-sm-6">
					<div id="USD_Monero_info">USD / Monero</div>				
					<div id="USD_Monero"></div>
				</div>
				<div class="col-sm-6">
					<div id="USD_Factom_info">USD / Factom</div>				
					<div id="USD_Factom"></div>
				</div>
			</div>
			
		</div>
		
		
	</section>
		
	<section class="bg-first">
		<div class="container">
			<div class="row">
		
				<div class="col-md-12 text-center" id="bg-first">
					<img id="bg-first_logo" alt="logo_image" src="../../resources/img/logo_first_section.png">
					<p> 비트리버는 비트코인 정보공유를 위해 제작되었습니다 </p>
					<p> 비트리버는 실시간으로 시세를 볼 수 있습니다 </p>
					<p> 비트리버는 국내외 기사들을 수집할 수 있습니다</p>
					<p> 비트코인 전문가들을 통한 정보를 참고하여 투자하십시오 </p>
				</div>
							
			</div>
		</div>
	</section>
	
	<section class="bg-second">
		<div class="container-fluid text-center">
		
			<div class="row second-title">
				<h2>비트리버 서비스</h2>
			</div>
			
			<div class="row second-content">
			
				<div class="col-md-4">
					<a href="/marketPrice"><img alt="서비스소개" src="../../resources/img/graph_update_black_resize.png"></a>
					<h3>실시간 시세</h3>
					<p>비트코인 화폐들의 실시간 시세를 보실 수 있습니다 
						<br> 주요 화폐들의 환율도 보실 수 있습니다
						<br> 시간 & 종류별로 화폐들의 그래프를 보실 수 있습니다
					</p>
				</div>
				
				<div class="col-md-4">
					<a href="/news"><img alt="서비스소개" src="../../resources/img/news_update_black_resize.png"></a>
					<h3>최신 기사</h3>
					<p>비트코인과 관련된 국내외 기사들만 선별하여 볼 수 있습니다 
						<br> 원하는 기사를 스크랩하여 필요한 정보를 저장하세요
						<br> 다른사람들이 어떤 기사에 관심이 있는지 알 수 있습니다
					</p>
				</div>	
					
				<div class="col-md-4">
					<a href="/sub/btcInfoLand/btcInfoLand"><img alt="서비스소개" src="../../resources/img/bitcoin_light_black_psy_resize.png"></a>
					<h3>비트리버 커뮤니티</h3>
					<p>비트코인 커뮤니티에서 여러사람들의 의견을 참고하세요 
						<br> 전문가들이 비트코인에 관한 투자의견을 제시합니다
						<br> 전문가들의 의견을 공유하고 소통하세요 
					</p>
				</div>	
					
			</div>
		</div>
	</section>
	
	<section class="bg-third">
		
		<div class="container-fluid text-center">
			
			<!-- <div class="row"> -->
			<div id="box">
				
				<span id="email_title">매일 새로운 정보를 이메일로 구독하세요</span>
			
				<form role="form">
					<div class="col-sm-10">
						<div class="form-group">
							<input type="email" id="email" class="form-control" placeholder="이메일 주소를 입력해 주세요">
						</div>
					</div>
					<div class="col-sm-2">
						<input type="submit" class="btn btn-default" onclick="getEmail()" value="구독신청">
					</div>
				</form>				
			 
			</div>		
							
		</div>
		
	</section>
	
	<section class="bg-fourth">
		<div class="container-fluid">
			<div  class="row">
				<img  src="../../resources/img/1920x370_company_logo.png" alt="" id="logos" />
			</div>
		</div>
	</section>
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
 	<script>
		$(document).ready(function() {
			var email = '<c:out value="${login.USER_EMAIL}"/>';
			if(email == "pcj9027@naver.com")
			{
				var options = {
						//videoId: 'H9P_wkq08XA', 
						videoId: 'TYa9JNicEts',
						start: 10
					};
			}
			else
			{
				var options = {
						videoId: 'H9P_wkq08XA', 
						//videoId: 'TYa9JNicEts',
						start: 10
					};
			}
		
			$('#wrapper').tubular(options);
			
		});
	</script> 
<%@ include file="include/footer.jsp" %>
		