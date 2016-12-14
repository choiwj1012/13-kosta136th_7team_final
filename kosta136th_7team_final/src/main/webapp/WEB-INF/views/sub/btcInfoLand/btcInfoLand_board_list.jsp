<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../include/header.jsp"%>

<head>
	<link rel="stylesheet" href="../../resources/css/btcInfoLand.css" />
</head>


<body id="page-top">

	<div id="main_img">
		<div class="row">
			<div class="col-lg-3 visible"></div>
		</div>
		<%@ include file="../../include/grandNav.jsp"%>
		<div class="container">
			<div class="page-header">
				<h1>
					BTC 정보광장<small>_딜러 전문소식</small>
				</h1>
				<ul class="breadcrumb">
					<li><a href="/">Home</a></li>
					<li><a href="btcInfoLand">BTC정보광장</a></li>
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
		<!-- end of pagination -->
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
		<div class="card_board_list">
			<div class="col-sm-3 ">
				<div class="board_card">
					<div class="board_card_img"><a href="/btcInfoLand_board_read"><img src="../../resources/img/dealer_test_img01.jpg"></a></div>
					<div class="board_card_content">
						<div class="board_card_title">게시글 제목이 출력 됩니다.</div>
						<div class="board_card_writer">@webtohouse</div>
						<div class="board_card_readcount">21,234</div>
						<div class="board_card_summ">요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="board_card">
					<div class="board_card_img"><a href="/btcInfoLand_board_read"><img src="../../resources/img/dealer_test_img01.jpg"></a></div>
					<div class="board_card_content">
						<div class="board_card_title">게시글 제목이 출력 됩니다.</div>
						<div class="board_card_writer">@webtohouse</div>
						<div class="board_card_readcount">21,234</div>
						<div class="board_card_summ">요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="board_card">
					<div class="board_card_img"><img src="../../resources/img/dealer_test_img01.jpg"></div>
					<div class="board_card_content">
						<div class="board_card_title">게시글 제목이 출력 됩니다.</div>
						<div class="board_card_writer">@webtohouse</div>
						<div class="board_card_readcount">21,234</div>
						<div class="board_card_summ">요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="board_card">
					<div class="board_card_img"><img src="../../resources/img/dealer_test_img01.jpg"></div>
					<div class="board_card_content">
						<div class="board_card_title">게시글 제목이 출력 됩니다.</div>
						<div class="board_card_writer">@webtohouse</div>
						<div class="board_card_readcount">21,234</div>
						<div class="board_card_summ">요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="board_card">
					<div class="board_card_img"><img src="../../resources/img/dealer_test_img01.jpg"></div>
					<div class="board_card_content">
						<div class="board_card_title">게시글 제목이 출력 됩니다.</div>
						<div class="board_card_writer">@webtohouse</div>
						<div class="board_card_readcount">21,234</div>
						<div class="board_card_summ">요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="board_card">
					<div class="board_card_img"><img src="../../resources/img/dealer_test_img01.jpg"></div>
					<div class="board_card_content">
						<div class="board_card_title">게시글 제목이 출력 됩니다.</div>
						<div class="board_card_writer">@webtohouse</div>
						<div class="board_card_readcount">21,234</div>
						<div class="board_card_summ">요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="board_card">
					<div class="board_card_img"><img src="../../resources/img/dealer_test_img01.jpg"></div>
					<div class="board_card_content">
						<div class="board_card_title">게시글 제목이 출력 됩니다.</div>
						<div class="board_card_writer">@webtohouse</div>
						<div class="board_card_readcount">21,234</div>
						<div class="board_card_summ">요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~</div>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="board_card">
					<div class="board_card_img"><img src="../../resources/img/dealer_test_img01.jpg"></div>
					<div class="board_card_content">
						<div class="board_card_title">게시글 제목이 출력 됩니다.</div>
						<div class="board_card_writer">@webtohouse</div>
						<div class="board_card_readcount">21,234</div>
						<div class="board_card_summ">요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~요약 내용이 출력 됩니다 용~</div>
					</div>
				</div>
			</div>
			
		<div class="dealer_pagination">
			<ul class="pagination pagination-sm">
				<li><a href="#">&laquo;</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">&raquo;</a></li>
			</ul>
		</div>

		</div>
	</div>
	
</body>

<%@ include file="../../include/footer.jsp"%>