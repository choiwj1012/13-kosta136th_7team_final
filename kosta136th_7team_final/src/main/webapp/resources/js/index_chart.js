//chart를 그리는 javascript 코드
//방법1



$(document).ready(function () {
		
	// options.series[0].data  = data; 코드 때문에 수시로 초기화해줘야한다.
	// !! 코드 정리 필요
	var usd_options = {

				title: {
					//차트 제목 설정
					text: 'LiteCoin / USD'
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
					renderTo : 'chart_usd',
					// 그래프 타입(디자인) 설정
					// type : 'area'
				},
				
				series : [{
					name: 'USD',
		            tooltip: {
		            	valueDecimals: 2
		            }
				}]			
		};
	
	
	
		var cny_options = {
	
				title: {
					//차트 제목 설정
					text: 'LiteCoin / CNY'
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
					renderTo : 'chart_cny',
					// 그래프 타입(디자인) 설정
					// type : 'area'
				},
				
				series : [{
					name: 'CNY',
		            tooltip: {
		            	valueDecimals: 2
		            }
				}]			
		};
		
	
//			$.ajax({
//				url: "/rate/chartData/",				//목적지 URI	//Controller로 보낸다.
//				//async : false,						//동기방식
//				type: 'get',							//get 타입 (post타입 등이 있음)
//			
//				/* dataType: 'text',					//전송 dataType json */
//				data: {"money_type" : money_type},		//money_type을 넘긴다.
//				
//				success:  function () {				//성공시 return된 객체를
					
				$.getJSON("/rate/chartData?money_type=PRICE_USD",  function (data) {
				  
					usd_options.series[0].data  = data;
					var chart = new Highcharts.stockChart(usd_options);
				  
				});
				
				$.getJSON("/rate/chartData?money_type=PRICE_CNY",  function (data) {
					  
					cny_options.series[0].data  = data;
					var chart = new Highcharts.stockChart(cny_options);
				  
				});
//				}
//			});
			
	
	  
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