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
					
					
					<!-- <ul><li><a href="asd" class="onclick">asd</a></li></ul> -->
					
					<!-- <table>
					<tr onclick="window.location='이동할링크'" style="cursor:pointer;" onMouseOver=this.style.backgroundColor="#F0F1F3" onMouseOut=this.style.backgroundColor="#FFFFFF">
						<td>fifififi</td>
					</tr>
					</table> -->
						
						<table id="marketPriceList" class="table table-hover">
							<thead>
								<tr>
									<th>Label</th>
									<th>Name</th>
									<th>Price</th>
									<th>Volume_24h</th>
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
			
	<!-- 실시간 시세보기 -->
	<script>

		$(document).ready(function(){
			
			var url = "/rate/bitrate?money_type=PRICE_BTC";		//MarketPriceDataController로 부터 받은 데이터를 처리한다.
			$.getJSON(url,  function (data) {
				var str = "";
                 $.each(data.reverse(), function(){
                    	str += "<tr>"
                    	str += "<li>"
                	    str += "<a href='#'>";
	                    str += "<td>" + this.label + "</td>";
	                    str += "<td>" + this.name + "</td>";
	                    str += "<td>" + this.price + "</td>";
	                    str += "<td>" + this.volume_24h + "</td>";
                        str += "</a>";
                        str += "</li>"
                    	str += "</tr>";
                }); 


                $("#bitrate").html(str);
		  	});
			
			$(".market_price_tab").click(function(){
				
				var url = "/rate/rateList";		//MarketPriceDataController로 부터 받은 데이터를 처리한다.
				
				$.getJSON(url, function (data) {
					
					var str = "";


				$.each(data, function(){
					
					str += "<tr>";
					
					str +=	"<td>" + this.id + "</td>";
				
					str +=	"<td>" + this.name + "</td>";
				
					str +=	"<td>" + this.rate + "</td>";
				
					str +=	"<td>" + this.ask + "</td>";
				
					str +=	"<td>" + this.bid + "</td>";
					
					str += "</tr>";
					
				})


					
				 $("#rate").html(str);
				  
			  });
				
			});
			
			var money_type = "PRICE_BTC";			
			$("#combo-box").on('change', function(){
				
				money_type = $(this).find(":selected").val();
				
				$.ajax({
					url: "/rate/bitrate/",				//목적지 URI	//Controller로 보낸다.
					//async : false,						//동기방식
					type: 'get',							//get 타입 (post타입 등이 있음)
					data: {"money_type" : money_type},		//money_type을 넘긴다.
					
					success:  function () {				//성공시 return된 객체를
						
						var url = "/rate/bitrate?money_type=" + money_type;		//MarketPriceDataController로 부터 받은 데이터를 처리한다.
						$.getJSON(url,  function (data) {
							var str = "";
						
			                $.each(data.reverse(), function(){
			                    	str += "<tr>"
				                    str += "<td>" + this.label + "</td>";
				                    str += "<td>" + this.name + "</td>";
				                    str += "<td>" + this.price + "</td>";
				                    str += "<td>" + this.volume_24h + "</td>";
			                    	str += "</tr>"
			                });       

			                $("#bitrate").html(str);
						  
					  });
						
					}
					
				});
								
			});	
		});
	</script>
	
</body>