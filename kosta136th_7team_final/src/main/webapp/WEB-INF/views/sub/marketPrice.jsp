<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/grandNav.jsp" %>

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
				<div id="chart"></div>
			</div>

			<!-- 비트코인 시세 테이블 -->
			<div id="market_price_list" class="col-md-4 visible tabs">	<!-- visible tabs -->
			
				<div id="title_bar">
					<h3 class="text-center">BitCoin MarketPrice</h3>
				</div>	
					
					<!-- 비트코인과 실화폐 환율 탭 네비 -->
					<ul class="nav nav-tabs">
						
						<li class="market_price_tab active"><a data-toggle="tab" href="#home">BitCoin</a></li>
												
						<!-- 비트코인 환율 -->
						<li class="market_price_tab"><a data-toggle="tab" href="#menu1">MarketPrice</a></li>
						
						<!-- 실화폐 환율 -->							
						<li id="drop-box">
							<!-- dropdown은 목록 선택시 뷰에 보여지는 목록이 변하지 않아 직관적이지 못함 따라서 select로 변경함 -->
		                    <select id="combo-box" class="input-large form-control">
			                    <option id="PRICE_BTC" value="PRICE_BTC" selected="selected"> BTC </option>
			                    <option id="PRICE_USD" value="PRICE_USD"> USD </option>
			                    <option id="PRICE_CNY" value="PRICE_CNY"> CNY </option>
			                    <option id="PRICE_EUR" value="PRICE_EUR"> EUR </option>
			                    <option id="PRICE_GBP" value="PRICE_GBP"> GBP </option>
			                    <option id="PRICE_RUR" value="PRICE_RUR"> RUR </option>
		                	</select>
						</li>
						
					</ul>
				

				<div class="tab-content">
					<!-- 첫 탭 화면에 표시되는 정보 (비트코인 환율) -->
					<div id="bitcoin_price" class="tab-pane fade in active">
					
						<table id="marketPriceList">
							<tr>
								<td>Label</td>
								<td>Name</td>
								<td>Price</td>
								<td>Volume_24h</td>
							</tr>
							<tr>
								<c:forEach items="${marketPriceList}" var="marketPrice">
									<tr id="test">
										<td>${marketPrice.label}</td>
										<td><a href=''>${marketPrice.name}</a></td>
										<td>${marketPrice.price_btc_result}</td>
										<td>${marketPrice.volume_24h_result}</td>
									<tr>
								</c:forEach>
							</tr>
						</table>

					</div>
				</div>

				<div class="tab-content">
					<!-- 첫 탭 화면에 표시되는 정보 (비트코인 환율) -->
					<div id="bitcoin_price" class="tab-pane fade in active">
					
						<table id="marketPriceList">
							<tr>
								<td>Label</td>
								<td>Name</td>
								<td>Price</td>
								<td>Volume_24h</td>
							</tr>
							<tr>
								<c:forEach items="${marketPriceList}" var="marketPrice">
								
									<tr id="test">

									<tr>
									
								</c:forEach>
							</tr>

						</table>
					</div>
					
					<!-- 두번째 탭 화면에서 보여주는 정보 (실화폐환율) -->
					<div id="market_price" class="tab-pane fade">
						<table>
							<tr>
								<td>ID</td>
								<td>Name</td>
								<td>Rate</td>
								<td>Ask</td>
								<td>Bid</td>
							</tr>
							<c:forEach items="${rateList}" var="rate">
								<tr id="rate">
									<td>${rate.id}</td>

									<td>${rate.name}</td>

									<td>${rate.rate}</td>

									<td>${rate.ask}</td>

									<td>${rate.bid}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
			
	<!-- 실시간 시세보기 -->
	<script>
	$(document).ready(function(){
		            
		            $.getJSON("/rate/bitrate", function(data){
		                
		                var str = "";
		                
		                $(data).each(
		                    function(){
			                    str += "<td>" + this.marketPrice.label + "</td>"
			                    str += "<td>" + this.marketPrice.name + "</td>"
			                    str += "<td>" + this.marketPrice.price_btc_result + "</td>";
			                    str += "<td>" + this.marketvolume_24h_result + "</td>";
		                });        
		                
		                $("#test").html(str);
		            });

		$('.dd-menu').click(function() {

			var val = $(this).text();
			$('#currencyBtn').html(val + "<span class='caret'></span>");
			
		});

	});
	</script>
	
</body>
