/**
 * @license Highcharts JS v5.0.6 (2016-12-07)
 *
 * (c) 2009-2016 Torstein Honsi
 *
 * License: www.highcharts.com/license
 */

// 차트 customizing
// 성용에게 문의하세요

(function(factory) {
    if (typeof module === 'object' && module.exports) {
        module.exports = factory;
    } else {
        factory(Highcharts);
    }
}(function(Highcharts) {
    (function(Highcharts) {
        /**
         * (c) 2010-2016 Torstein Honsi
         *
         * License: www.highcharts.com/license
         * 
         * Dark blue theme for Highcharts JS
         * @author Torstein Honsi
         */

        'use strict';
        Highcharts.theme = {
        		   colors: ['#33CCCC', '#90ee7e', '#f45b5b', '#7798BF', '#aaeeee', '#ff0066', '#eeaaee',
        		      '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
        		   chart: {
        		      backgroundColor: {
        		         linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
        		         stops: [
        		            [0, '#1c2022'],	//배경 색상
        		            [1, '#24282a']	//배경 색상 그라데이션
        		         ]
        		      },
        		      style: {
        		         fontFamily: '\'Unica One\', sans-serif'
        		      },
        		      plotBorderColor: '#606063'
        		   },
        		   title: {
        		      style: {
        		         color: '#E0E0E3',
        		         textTransform: 'uppercase',
        		         fontSize: '20px'
        		      }
        		   },
        		   subtitle: {
        		      style: {
        		         color: '#E0E0E3',
        		         textTransform: 'uppercase'
        		      }
        		   },
        		   xAxis: {
        		      gridLineColor: '#707073',
        		      labels: {
        		         style: {
        		            color: '#E0E0E3'
        		         }
        		      },
        		      lineColor: '#707073',
        		      minorGridLineColor: '#505053',
        		      tickColor: '#707073',
        		      title: {
        		         style: {
        		            color: '#A0A0A3'

        		         }
        		      }
        		   },
        		   yAxis: {
        		      gridLineColor: '#2a2e30',	//Y축 단위 표시선
        		      labels: {
        		         style: {
        		            color: '#E0E0E3'
        		         }
        		      },
        		      lineColor: '#707073',
        		      minorGridLineColor: '#505053',
        		      tickColor: '#707073',
        		      tickWidth: 1,
        		      title: {
        		         style: {
        		            color: '#A0A0A3'
        		         }
        		      }
        		   },
        		   tooltip: {
        		      backgroundColor: 'rgba(0, 0, 0, 0.85)',
        		      style: {
        		         color: '#F0F0F0'
        		      }
        		   },
        		   plotOptions: {
        		      series: {
        		         dataLabels: {
        		            color: '#B0B0B3'
        		         },
        		         marker: {
        		            lineColor: '#333'
        		         }
        		      },
        		      boxplot: {
        		         fillColor: '#505053'
        		      },
        		      candlestick: {
        		         lineColor: 'white'
        		      },
        		      errorbar: {
        		         color: 'white'
        		      }
        		   },
        		   legend: {
        		      itemStyle: {
        		         color: '#E0E0E3'
        		      },
        		      itemHoverStyle: {
        		         color: '#FFF'
        		      },
        		      itemHiddenStyle: {
        		         color: '#606063'
        		      }
        		   },
        		   credits: {
        		      style: {
        		         color: '#666'
        		      }
        		   },
        		   labels: {
        		      style: {
        		         color: '#707073'
        		      }
        		   },

        		   drilldown: {
        		      activeAxisLabelStyle: {
        		         color: '#F0F0F3'
        		      },
        		      activeDataLabelStyle: {
        		         color: '#F0F0F3'
        		      }
        		   },

        		   navigation: {
        		      buttonOptions: {
        		         symbolStroke: '#DDDDDD',
        		         theme: {
        		            fill: '#262a2c'
        		         }
        		      }
        		   },

        		   // 기간 설정
        		   rangeSelector: {
        		      buttonTheme: {
        		         fill: '#202426',
        		         stroke: '#000000',
        		         style: {
        		            color: '#888'
        		         },
        		         states: {
        		            hover: {
        		               fill: '#666666',
        		               stroke: '#000000',
        		               style: {
        		                  color: 'white'
        		               }
        		            },
        		            select: {
        		               fill: '#464a4c',
        		               stroke: '#000000',
        		               style: {
        		            	   color: 'white'
        		               }
        		            },
        		            disabled: {
        		            	fill: '#262a2c',
         		               stroke: '#000000',
         		               style: {
         		                  color: '#363a3c'
         		               }
        		            }
        		         },
        		      },
        		      inputBoxBorderColor: '#262a2c',
        		      inputStyle: {
        		         backgroundColor: '#222',
        		         color: '#464a4c'
        		      },
        		      labelStyle: {
        		         color: 'silver'
        		      }
        		      
        		   },
        		   
        		   //하단 스크롤
        		   navigator: {
        		      handles: {
        		         backgroundColor: '#666',
        		         borderColor: '#AAA'
        		      },
        		      outlineColor: '#999',
        		      maskFill: 'rgba(255,255,255,0.1)',
        		      series: {
        		         color: '#7798BF',
        		         lineColor: '#66BBCC'
        		      },
        		      xAxis: {
        		         gridLineColor: '#505053'
        		      }
        		   },

        		   scrollbar: {
        		      barBackgroundColor: '#373737',
        		      barBorderColor: '#373737',
        		      buttonArrowColor: '#CCC',
        		      buttonBackgroundColor: '#272727',
        		      buttonBorderColor: '#272727',
        		      rifleColor: '#999',
        		      trackBackgroundColor: '#333333',
        		      trackBorderColor: '#333333'
        		   },

        		   // special colors for some of the
        		   legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
        		   background2: '#505053',
        		   dataLabelsColor: '#B0B0B3',
        		   textColor: '#C0C0C0',
        		   contrastTextColor: '#F0F0F3',
        		   maskColor: 'rgba(255,255,255,0.3)'
        		};

        // Apply the theme
        Highcharts.setOptions(Highcharts.theme);

    }(Highcharts));
}));
