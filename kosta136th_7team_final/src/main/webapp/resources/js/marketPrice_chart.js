$(document).ready(function () {
	
	var money_type = $("#combo-box_moneyType").find(":selected").val();
	var sorting_type = $("#combo-box_sortingType").find(":selected").val();
	
	// 처음 시작시 PRICE_BTC값이 나타나는 쿼리
	var url = "/rate/bitrate?money_type=" + money_type + "&sorting_type=" + sorting_type;
	
	$.getJSON(url, function (data) {
	
		var str = "";
			$.each(data, function(){

        	    str += "<tr class='table_row' id='table_price_row'>";
                str += "<td>" + this.label + "</td>";
                str += "<td>" + this.name + "</td>";
                str += "<td>" + this.price + "</td>";
                str += "<td>" + this.volume_24h + "</td>";
            	str += "</tr>";
			}); 
		
		//리스트 출력
		$("#bitrate").html(str);
		
		//차트 상단 정보 출력
		var usd_btc_price= $("#table_price_row").eq(0).children(':eq(2)').text();
		chartInfo(usd_btc_price , "USD", "BTC");
		
		// btc 로우를 selected 상태로 만듬
		$(".table_row").eq(0).addClass("selected");		
		
	});
	
	//실화폐 환율탭 클릭 시
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
				
			});

			 $("#rate").html(str);
		  
	  	});
		
	});
	
	//default 정렬 기준은 24시간 거래량 기준.
	//비트코인환율
	$("#combo-box_moneyType").on('change', function(){
		
		var selectedRowIndex = $(".table_row.selected").index();
		var coin_label_type = $(".table_row.selected").children(':eq(0)').text();			// "LTC"형식 : chart_info에 사용
		var coin_type = $(".table_row.selected").children(":eq(1)").text();	// "Litecoin"형식 : chart출력에 사용
		money_type = $(this).find(":selected").val();					//"PRICE_BTC" 형식
		sorting_type = $("#combo-box_sortingType").find(":selected").val();
		
		// money_name_option는 화폐 종류 그래프에 출력할 값을 저장하는 변수(USD, CNY, BTC...)
		var money_name_option;
		if(money_type == "PRICE_USD") {
			money_name_option = "USD";
		} else if (money_type == "PRICE_CNY") {
			money_name_option = "CNY";
		} else if (money_type == "PRICE_EUR") {
			money_name_option = "EUR";
		} else if (money_type == "PRICE_GBP") {
			money_name_option = "GBP";
		} else if (money_type == "PRICE_RUR") {
			money_name_option = "RUR";
		} else if (money_type == "PRICE_BTC") {
			money_name_option = "BTC";
		} 
		
		$.ajax({
			
			url: "/rate/bitrate/",				//목적지 URI	//Controller로 보낸다.
			//async : false,					//동기방식
			type: 'get',						//get 타입 (post타입 등이 있음)
			data: {"money_type" : money_type, "sorting_type" : sorting_type},		//money_type을 넘긴다.
			
			success:  function () {				//성공시 return된 객체를
				
				var url = "/rate/bitrate?money_type=" + money_type + "&sorting_type=" + sorting_type;		//MarketPriceDataController로 부터 받은 데이터를 처리한다.
				
				$.getJSON(url,  function (data) {
					
					var str = "";
				                                                                                                      
	                $.each(data, function(){
	               	    
	               	    str += "<tr class='table_row' id='table_price_row'>";
	                    str += "<td>" + this.label + "</td>";
	                    str += "<td>" + this.name + "</td>";
		                str += "<td>" + this.price + "</td>";
		                str += "<td>" + this.volume_24h + "</td>";
	                    str += "</tr>"
	                    
	                });       
	                $("#bitrate").html(str);
	                
	                // money_type 변경이전 selected 되어있던 row
	                // money_type 변경이후 동일 row를 selected.
	                $(".table_row").eq(selectedRowIndex).addClass("selected");
	                // selected된 row의 price를 불러옴
	                var price_info = $(".table_row.selected").children(':eq(2)').text();
	                chartInfo(price_info , money_name_option, coin_label_type);
			  });
				
			}
			
		});
		
		var options = {

			rangeSelector: {
				
				//기간 버튼 설정
				buttons: [
					{
	                    type: 'hour',
	                    count: 12,
	                    text: '12h'
	                }, {
	                    type: 'day',
	                    count: 1,
	                    text: '1D'
	                }, {
	                    type: 'day',
	                    count: 3,
	                    text: '3D'
	                }, {
	                    type: 'day',
	                    count: 7,
	                    text: '1w'
	                }, {
	                    type: 'all',
	                    count: 1,
	                    text: 'All'
	                }],
				//기간 버튼 Default 값 설정 //0: 가장 첫 기간버튼, 1: 두 번째 기간버튼, 2: 세...
				selected: 4,
	          },
			
			chart: {
				// 뿌려줄 View단의 id 설정
				renderTo : 'chart',
				// 그래프 타입(디자인) 설정
				// type : 'area'
			},
			
			series : [{
				name: money_name_option,
	            tooltip: {
	            valueDecimals: 3,
	            type: 'area'
	            }
			}]			
		};
		
		$.ajax({
			
			url : "/rate/oneChart/",
			type : 'get',
			data : {"coin_type" : coin_type, "money_type" : money_type},
			
			success : function() {
				
				var url = "/rate/oneChart?coin_type=" + coin_type + "&money_type=" + money_type;

				$.getJSON(url, function(data) {
					
					options.series[0].data = data;
					var chart = new Highcharts.stockChart(options);
					
				});
				
			}
			
		});
						
	});
	
	
	/* 정렬 타입 선택 콤보박스 메소드 */
	// 디폴트 상태 : 24시간 거래량 순
	$("#combo-box_sortingType").on('change', function(){
		
		money_type = $("#combo-box_moneyType").find(":selected").val();
		sorting_type = $(this).find(":selected").val();
		
		$.ajax({
			
			url: "/rate/bitrate/",				//목적지 URI	//Controller로 보낸다.
			type: 'get',							//get 타입 (post타입 등이 있음)
			data: {"money_type" : money_type, "sorting_type" : sorting_type},		//money_type을 넘긴다.		
			success:  function () {				//성공시 return된 객체를
				
				var url = "/rate/bitrate?money_type=" + money_type + "&sorting_type=" + sorting_type;		//MarketPriceDataController로 부터 받은 데이터를 처리한다.
			
				$.getJSON(url,  function (data) {
					
					var str = "";
				                                                                                                      
	                $.each(data, function(){
	               	    
	               	    str += "<tr class='table_row' id='table_price_row'>";
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
	
	
	/******* CHART 시작 ********/
	// default 상세일 때
	var options = {

		rangeSelector: {
			
			//기간 버튼 설정
			buttons: [
				{
                    type: 'hour',
                    count: 12,
                    text: '12h'
                }, {
                    type: 'day',
                    count: 1,
                    text: '1D'
                }, {
                    type: 'day',
                    count: 3,
                    text: '3D'
                }, {
                    type: 'day',
                    count: 7,
                    text: '1w'
                }, {
                    type: 'all',
                    count: 1,
                    text: 'All'
                }],
		
			selected: 4,
			
          },
		
		chart: {
			// 뿌려줄 View단의 id 설정
			renderTo : 'chart',
			// 그래프 타입(디자인) 설정
			// type : 'area'
		},
		
		series : [{
			name: 'USD',
            tooltip: {
            valueDecimals: 3
            }
		}]
		
	};
	
	//MarketPriceDataController.java
	//@RequestMapping(value = "/chartData") ++ @RequestMapping("/rate/*")
	//초기값은 btc로 설정.
	var chartUrl = "/rate/oneChart?coin_type=Bitcoin&money_type=" + money_type;		//MarketPriceDataController로 부터 받은 데이터를 처리한다.
	$.getJSON(chartUrl,  function (data) {
		
		options.series[0].data  = data;
		var chart = new Highcharts.stockChart(options);
	  
	});
		
	
	// 코인리스트 row를 클릭했을 때
	$(document).on("click", "#table_price_row", function(){
		
		var coin_label_type = $(this).children(':eq(0)').text();
		var coin_type = $(this).children(':eq(1)').text();
		var price_info = $(this).children(':eq(2)').text();
		var money_type = $("#combo-box_moneyType").find(":selected").val();
		var str;
		
		var money_name_option;
		if(money_type == "PRICE_BTC") {
			money_name_option = "BTC";
		} else if (money_type == "PRICE_USD") {
			money_name_option = "USD";
		} else if (money_type == "PRICE_CNY") {
			money_name_option = "CNY";
		} else if (money_type == "PRICE_EUR") {
			money_name_option = "EUR";
		} else if (money_type == "PRICE_GBP") {
			money_name_option = "GBP";
		} else if (money_type == "PRICE_RUR") {
			money_name_option = "RUR";
		}
		
		//차트 상단 정보바 코드
		chartInfo(price_info, money_name_option, coin_label_type );

		
		//차트 코드
		var options = {

				rangeSelector: {
					
					//기간 버튼 설정
					buttons: [
						{
		                    type: 'hour',
		                    count: 12,
		                    text: '12h'
		                }, {
		                    type: 'day',
		                    count: 1,
		                    text: '1D'
		                }, {
		                    type: 'day',
		                     count: 3,
		                    text: '3D'
		                }, {
		                    type: 'day',
		                    count: 7,
		                    text: '1w'
		                }, {
		                    type: 'all',
		                    count: 1,
		                    text: 'All'
		                }],
					//기간 버튼 Default 값 설정 //0: 가장 첫 기간버튼, 1: 두 번째 기간버튼, 2: 세...
					selected: 4,
		          },
				
				chart: {
					// 뿌려줄 View단의 id 설정
					renderTo : 'chart',
					// 그래프 타입(디자인) 설정
					// type : 'area'
				},
				
				series : [{
					name: money_name_option,
		            tooltip: {
		            valueDecimals: 3,
		            type: 'area'
		            }
				}]			
			};
		
		
		$.ajax({
			
			url : "/rate/oneChart/",
			type : 'get',
			data : {"coin_type" : coin_type, "money_type" : money_type},
			
			success : function() {
			
				var url = "/rate/oneChart?coin_type=" + coin_type + "&money_type=" + money_type;

				$.getJSON(url, function(data) {
					
					options.series[0].data = data;
					var chart = new Highcharts.stockChart(options);
					
				});
				
			}
			
		});
		
		$(this).addClass("selected").siblings().removeClass("selected");
		
	});
	
	
	
	
	
});


// chart_info 에 뿌려줄 코인정보는 coin_label_type으로 뿌려준다.
function chartInfo(price_info, money_type, coin_label_type) {
	
	var price_info_round = Number(price_info).toFixed(3);
	
//	var str = "<li id='price_info'>" + price_info_round + "</li>"
//	str += "<li id='money_type_info'>" + money_type + "</li>"
//	str += "<li id='coin_type_info'>" + coin_label_type + "</li>";
	var str = "<div id='price_info'>" + price_info_round + "</div>"
	str += "<div id='money_type_info'>" + money_type + "</div>"
	str += "<div id='coin_type_info'>" + coin_label_type + "</div>";
	
	$("#chart_info").html(str);
}
