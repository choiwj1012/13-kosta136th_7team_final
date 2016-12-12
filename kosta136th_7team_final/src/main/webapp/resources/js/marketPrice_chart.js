//chart를 그리는 javascript 코드
//방법1



$(document).ready(function () {
		
	// options.series[0].data  = data; 코드 때문에 수시로 초기화해줘야한다.
	// !! 코드 정리 필요
	var options = {

				title: {
					//차트 제목 설정
					text: '비트코인 시세정보 차트'
		          },
				
				rangeSelector: {
					
					//기간 버튼 설정
					buttons: [
						{
		                    type: 'hour',
		                    count: 6,
		                    text: '6h'
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
					name: 'btc',
		            tooltip: {
		            valueDecimals: 2
		            }
				}]			
		};
		
	
	
	var money_type = "PRICE_BTC";
	$("#combo-box").on('change', function(){

		money_type = $(this).find(":selected").val();		//선택된 값을 가져옴.
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
		
		
		var options = {

				title: {
					//차트 제목 설정
					text: '비트코인 시세정보 차트'
		          },
				
				rangeSelector: {
					
					//기간 버튼 설정
					buttons: [
						{
		                    type: 'hour',
		                    count: 6,
		                    text: '6h'
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
		            valueDecimals: 2,
		            type: 'area'
		            }
				}]			
			};
			
		
		
		
			$.ajax({
				url: "/rate/chartData/",				//목적지 URI	//Controller로 보낸다.
				//async : false,						//동기방식
				type: 'get',							//get 타입 (post타입 등이 있음)
			
				/* dataType: 'text',					//전송 dataType json */
				data: {"money_type" : money_type},		//money_type을 넘긴다.
				
				success:  function () {				//성공시 return된 객체를
					
					var url = "/rate/chartData?money_type=" + money_type;		//MarketPriceDataController로 부터 받은 데이터를 처리한다.
					$.getJSON(url,  function (data) {
					  
					  options.series[0].data  = data;
					  var chart = new Highcharts.stockChart(options);
					  
				  });
				}
			});
			
	});
	
	//MarketPriceDataController.java
	//@RequestMapping(value = "/chartData") ++ @RequestMapping("/rate/*")
	//초기값은 btc로 설정.
	var url = "/rate/chartData?money_type=PRICE_BTC";		//MarketPriceDataController로 부터 받은 데이터를 처리한다.
	$.getJSON(url,  function (data) {
	  
		options.series[0].data  = data;
		var chart = new Highcharts.stockChart(options);
	  
  });
});


//chart를 그리는 javascript 코드
//방법2
/*$(function () {

//    $.getJSON('https://www.highcharts.com/samples/data/jsonp.php?filename=aapl-c.json&callback=?', function (data) {
    $.getJSON("/chartData",  function (data) {
    	
        // Create the chart
        Highcharts.stockChart('container', {

        	
        	
            rangeSelector: {
                selected: 1
            },

            title: {
                text: '내가 그린 차트는 우주제일 차트'
            },

            series: [{
                name: 'usd',
                data: data,
                tooltip: {
                    valueDecimals: 2
                }
            }]
        });
    });
});
*/