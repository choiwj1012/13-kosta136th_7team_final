<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/grandNav.jsp" %>
<%-- <%@ page session="false" %> --%>
<head>
	<link rel="stylesheet" href="../../../resources/css/marketPrice.css" />
	<title>BitCoin MarketPrice</title>
</head>

<body>

	<div class="container-fluid">

			<!-- 실시간 시세보기 -->

			<!-- 	<script> -->
			<!-- 	$(document).ready(function(){ -->

			<!-- 		$('.dd-menu').click(function() { -->

			<!-- 			var val = $(this).text(); -->
			<!-- 			$('#currencyBtn').html(val + "<span class='caret'></span>"); -->

			<!-- 			if(val == 'BTC'){ -->
			<%-- 				var marketPriceList = "${marketPriceList}"; --%>
			<!-- 	 			var marketPrice = "marketPrice"; -->
			<%-- 				var rateList = "<c:forEach items="+marketPriceList+" var="+marketPrice+">"; --%>
			<!-- 				    rateList += "	<tr>"; -->
			<%-- 					rateList += "		<td>${marketPrice.label}</td>"; --%>
			<%-- 					rateList += "		<td><a href=''>${marketPrice.name}</a></td>"; --%>
			<%-- 					rateList += "		<td>${marketPrice.price_btc_result}</td>" ; --%>
			<%-- 					rateList += "		<td>${marketPrice.volume_24h_result}</td>";	 --%>
			<!-- 					rateList += "	<tr>"; -->
			<%-- 					rateList += "</c:forEach>"; --%>
			<!-- 			} else if(val == 'USD'){ -->
			<%-- 				var marketPriceList = "${marketPriceList}"; --%>
			<!-- 	 			var marketPrice = "marketPrice"; -->
			<%-- 				var rateList = "<c:forEach items="+marketPriceList+" var="+marketPrice+">"; --%>
			<!-- 				    rateList += "	<tr>"; -->
			<%-- 					rateList += "		<td>${marketPrice.label}</td>"; --%>
			<%-- 					rateList += "		<td><a href=''>${marketPrice.name}</a></td>"; --%>
			<%-- 					rateList += "		<td>${marketPrice.price_usd_result}</td>" ; --%>
			<%-- 					rateList += "		<td>${marketPrice.volume_24h_result}</td>";	 --%>
			<!-- 					rateList += "	<tr>"; -->
			<%-- 					rateList += "</c:forEach>"; --%>
			<!-- 			} -->

			<!-- 			$('#test').html(rateList); -->

			<!-- 		}); -->

			<!-- 	}); -->
			<!-- 	</script> -->


			<div>

				<!-- 비트코인 그래프 표시  -->
				<div class="col-md-8 visible">
					asdasd
				</div>


				<!-- 비트코인 시세 테이블 -->
				<div id="market_price_list" class="col-md-4 visible tabs">	<!-- visible tabs -->
					<h3 class="text-center">BitCoin MarketPrice</h3>
					<!-- 비트코인과 실화폐 환율 탭 네비 -->
					<ul class="nav nav-tabs">
						<li class="market_price_tab active"><a data-toggle="tab" href="#home">BitCoin</a></li>
						<!-- 비트코인 환율 -->
						<li class="market_price_tab"><a data-toggle="tab" href="#menu1">MarketPrice</a></li>
						<!-- 실화폐 환율 -->
						<li>
							<!-- 드랍다운 -->
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" id="currencyBtn"
									type="button" data-toggle="dropdown">
									BTC<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a class="dd-menu" id="btc" href="#">BTC</a></li>
									<li><a class="dd-menu" id="usd" href="#">USD</a></li>
									<li><a class="dd-menu" id="cny" href="#">CNY</a></li>
									<li><a class="dd-menu" id="eur" href="#">EUR</a></li>
									<li><a class="dd-menu" id="gbp" href="#">GBP</a></li>
									<li><a class="dd-menu" id="rur" href="#">RUR</a></li>
								</ul>
							</div>
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
						<!-- 두번째 탭 화면에서 보여주는 정보 (실화폐환율) -->
						<div id="bitcoin_price" class="tab-pane fade">
							<table>
								<tr>
									<td>ID</td>
									<td>Name</td>
									<td>Rate</td>
									<td>Ask</td>
									<td>Bid</td>
								</tr>
								<c:forEach items="${rateList}" var="rate">
									<tr>
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
</body>

<%-- <%@ include file="../include/footer.jsp" %> --%>		