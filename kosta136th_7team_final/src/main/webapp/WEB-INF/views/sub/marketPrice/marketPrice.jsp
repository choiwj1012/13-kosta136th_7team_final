<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../../include/header.jsp" %>
<%@ include file="../../include/grandNav.jsp" %>

<head>
	<link rel="stylesheet" href="../../../resources/css/marketPrice.css" />	
	<script src="https://code.highcharts.com/stock/highstock.js"></script>
	<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>		<!-- marketPrice 페이지 css -->
	<script src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
	<script src="../../../resources/js/marketPrice_chart.js"></script>				<!-- 차트 구현 js -->
	<script src="../../../resources/js/marketPrice_chart_customizing.js"></script>	<!-- 디자인 커스터마이징 js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>	<!-- !! -->
	<title>BitCoin MarketPrice</title>

</head>

<body>
		
	<div class="container-fluid">

		<div>

			<!-- 비트코인 그래프 표시  -->
			<div id="market_price_graph" class="col-md-8 visible">
				<div id="chart_information"></div>
				<div id="chart"></div>
			</div>

			<!-- 비트코인 시세 테이블 -->			
			<div id="market_price_list" class="col-md-4 visible tabs">	<!-- visible tabs -->
				
				<div id="title_bar">
					<h3 class="text-center">BitCoin MarketPrice</h3>
				</div>	
					
				<!-- 비트코인과 실화폐 환율 탭 네비 -->
				<ul class="nav nav-tabs">
					
					<li class="market_price_tab active"><a data-toggle="tab" href="#bitcoin_price">BitCoin</a></li>
											
					<!-- 비트코인 환율 -->
					<li class="market_price_tab"><a data-toggle="tab" href="#market_price">MarketPrice</a></li>
					
					<!-- 실화폐 환율 -->							
					<li id="drop-box_moneyType">
						<!-- dropdown은 목록 선택시 뷰에 보여지는 목록이 변하지 않아 직관적이지 못함 따라서 select로 변경함 -->
	                    <select id="combo-box_moneyType" class="input-large form-control">
		                    <option class="ratebtn" id="PRICE_USD" value="PRICE_USD" selected="selected"> USD </option>
		                    <option class="ratebtn" id="PRICE_CNY" value="PRICE_CNY"> CNY </option>
		                    <option class="ratebtn" id="PRICE_EUR" value="PRICE_EUR"> EUR </option>
		                    <option class="ratebtn" id="PRICE_GBP" value="PRICE_GBP"> GBP </option>
		                    <option class="ratebtn" id="PRICE_RUR" value="PRICE_RUR"> RUR </option>
		                    <option class="ratebtn" id="PRICE_BTC" value="PRICE_BTC"> BTC </option>
	                	</select>
					</li>
	
					<li id="drop-box_sortingType">
						<!-- dropdown은 목록 선택시 뷰에 보여지는 목록이 변하지 않아 직관적이지 못함 따라서 select로 변경함 -->
	                    <select id="combo-box_sortingType" class="input-large form-control">
		                    <option class="ratebtn" id="label_sorting" value="Label" selected="selected"> 라벨순 </option>
		                    <option class="ratebtn" id="name_sorting" value="Name"> 이름순 </option>
		                    <option class="ratebtn" id="price_sorting" value="Price"> 높은시세순</option>
		                    <option class="ratebtn" id="volume_24h_sorting" value="Volume_24h"> 24시간거래량순 </option>
	                	</select>
					</li>
					
				</ul>
				
				<div class="tab-content">
					<!-- 첫 탭 화면에 표시되는 정보 (비트코인 환율) -->
					<div id="bitcoin_price" class="tab-pane fade in active">

						<table id="marketPriceList" class="table table-hover" cellspacing="0">
							<!-- <table id="example" class="display" cellspacing="0" width="100%"> -->
							<thead>
								<tr id="test">

									<th id="label_th">Label</th>
									<th id="name_th">Name</th>
									<th id="price_th">Price</th>
									<th id="price_volume_24h">Volume_24h</th>

								</tr>
							</thead>
							
							<tbody id="bitrate">

							</tbody>

						</table>
					</div>

					<!-- 두번째 탭 화면에서 보여주는 정보 (실화폐환율) -->
					<div id="market_price">
					<table id="exchange" class="table table-hover">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Rate</th>
								<th>Ask</th>
								<th>Bid</th>
							</tr>
						</thead>
						<tbody id="rate">
	
						</tbody>
					</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 채팅창 온오프 버튼 -->
	<div id="chatBtn">
	 	<img src="../../resources/img/message.png" alt="chat_icon" id="chat_icon"/>
	</div>
	
	<!-- 채팅 기능 추가구현 -->
	<div id="chatroom">	
		<iframe id="chat" src="http://52.78.224.181:3000/public/index.html" frameborder="0"></iframe>
	</div>
	
	<script>
		
		$(document).ready(function(){
				
			$('#chat_icon').on('click', function(){
			
				var chatroomLocation = $('#chatroom').css('right');
				
				if(chatroomLocation == '-400px'){
					
					$('#chatroom').animate({'right' : '0px'});
					
				} else {
					
					$('#chatroom').animate({'right' : '-400px'});
					
					
				}
				
			});
		
		});
		
	</script>
	
</body>
