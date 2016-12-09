<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>

<head>
	<link rel="stylesheet" href="../../resources/css/btcInfoLand.css" />
</head>


<body id="page-top">

	<div id="main_img">
		<div class="row">
			<div class="col-lg-3 visible"></div>
		</div>
		<%@ include file="../include/grandNav.jsp"%>
		<div class="container">
			<div class="page-header">
				<h1>
					BTC 정보광장<small>_딜러 전문소식</small>
				</h1>
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">BTC정보광장</a></li>
					<li class="active">딜러 전문소식</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div>
			<div class="panel panel-default">
				<div class="panel-body">
					<span class="page_title">이달의 추천 딜러 |</span> <span>비트리버 회원이면
						누구나 전문 딜러로 활동 할 수 있습니다. 다양한 정보를 많은 회원들과 공유해 보시길 바랍니다.</span>
				</div>
			</div>
		</div>
	</div>
	<div class="container" id="first_section">
		<div class="row">
			<div class="col-sm-12 dealer_infoarea">
				<div class="col-sm-6">
					<div class="dealer_photoshot">
						<img src="../../resources/img/dealer_test_img01.jpg">
					</div>
					<div class="dealer_room_title">초보님을 위한 비트코인 시작하기~</div>
					<div class="dealer_position_title">전문분야 :</div>
					<div class="position_iteam">
						<span>비트코인</span><span>/</span><span>비트코인</span>
					</div>
					<div class="btngrp">
						<button type="button" class="btn btn-danger">
							<span class="glyphicon glyphicon-bullhorn"> 신고하기</span>
						</button>
						<button type="button" class="btn btn-primary">
							<span class="glyphicon glyphicon glyphicon-heart"> 추천하기</span>
						</button>
					</div>
				</div>
				<div class="col-sm-6 border_left_none">
					<div class="dealer_point">딜러 내공지수</div>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="70"
							aria-valuemin="0" aria-valuemax="100" style="width: 70%">
							70 Point</div>
					</div>
					<div class="vote_use">현재 참여자<span>(12명)</span></div>
					<div>
						<span class="label label-primary">홍길동</span> 
						<span class="label label-primary">슈퍼보드</span>
						<span class="label label-primary">순시리</span>
						<span class="label label-primary">초코정</span> 
						<span class="label label-primary">올레올레</span>
						<span class="label label-primary">최순득</span>
					</div>
				</div>
			</div>
			<!-- end of col-sm-4 column -->
		</div>
	</div>
	<!-- end of row content -->
	<div>&nbsp;</div>
	<div class="container">
		<div>
			<div class="panel panel-default">
				<div class="panel-body">
					<span class="page_title">딜러 전문소식 |</span> <span>비트리버에서 활동하는 전문 딜러들의 전문 소식 특화된 정보를 가장빨리 만나볼 수 있습니다. </span>
					
				</div>
			</div>
		</div>
	</div>
	<!-- 딜러 전문소식 리스트 -->
	<div class="container">
		<div class="page-header ">
	  		<div class="board_readtitle">비트코인의 미래를 예측하는 것은 쉽지 않다.</div>
	  		<span class="btcinfoland_writer">작성자 : webtohouse</span>
			<span class="btcinfoland_writeDete">작성일 : 2016/12/07</span>
			<span class="btcinfoland_write_readCount">조회수 : 21,234</span>
			<script>

				$(document).ready(function() {
					$('[data-toggle="tooltip"]').tooltip();
				});
			</script>
			<div class="board_nav">
				<span class="glyphicon glyphicon-chevron-left" data-toggle="tooltip" title="이전글"></span>
				<span class="glyphicon glyphicon-chevron-right" data-toggle="tooltip" title="다음글"></span>
			</div>
		</div>
		<div class="container">
			<p class="board_content">지금의 비트코인은 화폐로서의 기능보다는 특이한 투자자산 정도로 인식되는 경향이 좀 더 큰 것으로 보인다.
				비트코인을 받는 매장은 소수이며, 비트코인을 단위로 하여 회계장부를 작성하는 곳도 없다. 또한 역사적으로 가치의 변동성도
				상당히 높아 정상적인 화폐의 기능을 하기 쉽지 않아 보인다. 이러한 문제점이 해결되지 않는 이상 비트코인은 화폐보다는
				투자자산으로 인식될 것이다.[41] 그런데 아이러니하게도 비트코인이 투자자산이 될 수 있는 이유는 그것이 화폐의 역할을 할
				수 있다고 인식되기 때문이다. 즉, 화폐로서의 역할을 충분히 해내지 못할 것으로 예상된다면 비트코인의 가치는 말 그대로
				'가상의 데이터'가 되어 버릴 위험이 존재한다. 비트코인은 실물자산이 아니라 신용자산이라는 것을 염두해두자. 당장
				비트코인을 실제 돈으로 환전할 수 없다고 한다면 얼마나 많은 사람들이 이용하겠는가? 물론 모든 화폐가 다 신용자산이긴
				하지만, 비트코인 같은 암호화폐는 제도권의 영향을 받지 않아 제도권의 신용 역시 받지 못하기 때문에[42] 가질 수 있는
				신용은 수요공급의 법칙 정도에만 의존할 수밖에 없다. 비트코인의 알고리즘상 인플레이션의 위험이 없다는 의견이 있지만,
				화폐수량방정식에 대입하면 디플레이션이 아니라 인플레이션이 일어나게 된다.[43] 또한 비트코인으로 교환할 수 있는 화폐나
				실물 자산이 제약될수록 인플레이션은 가속된다.[44] 그런데 2013년말까지의 현실에서는 인플레이션에 비해 디플레이션이
				훨씬 크다. 즉 화폐의 가치가 올랐다는 이야기. 그동안 비트코인의 가치가 올랐다는 것은 이론적 예측이 아니라 실제로 일어난
				사실이다. 이게 화폐 유통의 증가로 인해 실제 가치가 증가한 건지, 아니면 투기나 거품에 의해 증가한 건지는 훗날 봐야 알
				것이다.[45] 화폐수량방정식의 특성상 화폐발행량 뿐만 아니라 화폐유통속도가 전체 통화량을 결정하므로[46], 채굴에 의해
				비트코인이 계속 공급됨에도 불구하고 디플레이션이 발생했다는 것은 그만큼 비트코인이 화폐로서 유통되고 있지 않다는 뜻이다.
				채굴되는 화폐가 누군가들의 지갑속에 고이 잠자고 있다는 뜻. 비트코인을 결제결재 수단 화폐로서가 아니라 투기수단으로서
				파악하여 값이 오르기를 기대하며 풀지 않고 쌓아두는 것이다. 또는 쓸 데가 없어서 쓰지 않는 것일 가능성도 있다. 비트코인
				자체의 미래는 경제학 이론상 밝지 못하더라도, 비트코인에 사용된 기술들은 유망성이 있다. 특히 중앙집중된 서버 없이
				네트워크의 여러 노드들이 거래, 결제결재를 검증하는 블록체인 시스템은 화폐로서의 비트코인 그 자체와는 무관하게 현재의
				온라인 거래 공인인증 시스템의 대안으로서 가치가 있으며, 현재 관련 시도들이 존재하고[47] 결실도 나타나고 있다.
				[48] 2016년 1월 비트코인 코어 개발자 한 명이 비트코인은 망했다는 글을 블로그에 올렸다.</p>
		</div>
		<hr>
		<div class="container">
			<div class="btn_area">
				<button type="button" class="btn btn-default">글목록</button>
			</div>	
		</div>
	</div>
	
</body>

<%@ include file="../include/footer.jsp"%>