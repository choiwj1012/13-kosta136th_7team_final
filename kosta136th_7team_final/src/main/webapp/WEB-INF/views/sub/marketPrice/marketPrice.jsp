<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../../include/header.jsp" %>
<%@ include file="../../include/grandNav.jsp" %>

<head>
	<link rel="stylesheet" href="../../../resources/css/marketPrice.css" />	
	<script src="https://code.highcharts.com/stock/highstock.js"></script>
	<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>		<!-- marketPrice 페이지 css -->
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
				
				<div id="chart_info_title">시간별 현재시세</div>	
				<div id="chart_info">
					
				</div>
				<div id="chart"></div>
			</div>

			<!-- 비트코인 시세 테이블 -->			
			<div id="market_price_list" class="col-md-4 visible tabs">	<!-- visible tabs -->
				
				<div id="title_bar">
					<h3 class="text-center">시세 정보 리스트</h3>
				</div>	
					
				<!-- 비트코인과 실화폐 환율 탭 네비 -->
				<ul class="nav nav-tabs">
					
					<li class="market_price_tab active"><a data-toggle="tab" href="#bitcoin_price">비트코인</a></li>
											
					<!-- 비트코인 환율 -->
					<li class="market_price_tab"><a data-toggle="tab" href="#market_price">실화폐</a></li>
					
	
					<li id="drop-box_sortingType">
						<!-- dropdown은 목록 선택시 뷰에 보여지는 목록이 변하지 않아 직관적이지 못함 따라서 select로 변경함 -->
	                    <select id="combo-box_sortingType" class="input-large form-control">
		                    <option class="ratebtn" id="volume_24h_sorting" value="Volume_24h" selected="selected"> 24시간거래량순 </option>
		                    <option class="ratebtn" id="label_sorting" value="Label"> 라벨순 </option>
		                    <option class="ratebtn" id="name_sorting" value="Name"> 이름순 </option>
		                    <option class="ratebtn" id="price_sorting" value="Price"> 높은시세순</option>
	                	</select>
					</li>
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
					
				</ul>
				
				<div class="tab-content">
					<!-- 첫 탭 화면에 표시되는 정보 (비트코인 환율) -->
					<div id="bitcoin_price" class="tab-pane fade in active">

						<table id="marketPriceList" class="table table-hover" cellspacing="0">
							<!-- <table id="example" class="display" cellspacing="0" width="100%"> -->
							<thead>
								<tr class="label_bar">
									<th id="label_th">라벨</th>
									<th id="name_th">이름</th>
									<th id="price_th">시세</th>
									<th id="price_volume_24h">24시간거래량</th>
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
							<tr class="label_bar">
								<th>환율ID</th>
								<th>환율기준</th>
								<th>시세</th>
								<th>매도</th>
								<th>매수</th>
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
	
<%@ include file="../../include/chatting.jsp" %>
	
</body>
