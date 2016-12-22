//chart를 그리는 javascript 코드
//방법1
$(document).ready(function () {

	// 동기방식으로 전환
	$.ajaxSetup({
		async : false
	});

		
	// options.series[0].data  = data; 코드 때문에 수시로 초기화해줘야한다.
	
	//for(var money_index = 0 ; money_index < 2 ; money_index++) {
		
		for(var coin_index = 0 ; coin_index < 5 ; coin_index++) {
			
			//var money_type = ['USD', 'CNY'];
			var money_type = 'USD';
			var coin_type = ['Bitcoin', 'Litecoin', 'Ethereum', 'Monero', 'Factom'];
			
			var options = {
		
						/*title: {
							//차트 제목 설정
							text: 'LiteCoin / USD'
				          },*/
						
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
							renderTo : money_type + '_' + coin_type[coin_index]
							// 그래프 타입(디자인) 설정
							// type : 'area'
						},
						
						navigator: {
				            enabled: false
				        },
				        
				        scrollbar: {
				            enabled: false
				        },
						
						series : [{
							name : money_type,
				            tooltip: {
				            	valueDecimals: 3
				            },
						
						}]
						
				};
						
				$.getJSON("/rate/oneChart?coin_type=" + coin_type[coin_index] + "&money_type=PRICE_" + money_type, function (data) {
					
					options.series[0].data  = data;
					var chart = new Highcharts.stockChart(options);
					
				});	
	
		}
		
	//}
//				
//				$.getJSON("/rate/chartData?money_type=PRICE_CNY",  function (data) {
//					  
//					cny_options.series[0].data  = data;
//					var chart = new Highcharts.stockChart(cny_options);
//				  
//				});
//				}
//			});
});

