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
					BTC 정보광장<small>_이달의 추천 딜러</small>
				</h1>
				<ul class="breadcrumb">
					<li><a href="#">Home</a></li>
					<li><a href="#">BTC정보광장</a></li>
					<li class="active">이달의 추천딜러</li>
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
			<!-- 검색 -->
			<div class="search_group">
				<div class="form-group col-xs-2">
					<select class="form-control" id="sel1">
						<option>선택</option>
						<option>딜러명</option>
						<option>제목</option>
						<option>제목+본문</option>
					</select>
				</div>
				<form>
					<div class="input-group col-xs-6">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="container" id="first_section">
		<div class="row">
			<div class="dealer_list_group">
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img01.jpg"></a>
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span> 
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img02.jpg"></a>
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span> 
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img03.jpg"></a>
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span> 
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img01.jpg"></a>
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span> 
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<img src="../../resources/img/dealer_test_img02.jpg">
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span> 
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<img src="../../resources/img/dealer_test_img03.jpg">
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span> 
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<img src="../../resources/img/dealer_test_img01.jpg">
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span> 
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<img src="../../resources/img/dealer_test_img02.jpg">
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span> 
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
				<div class="col-sm-4 column">
					<div class="dealer_wrapper">
						<div class="dealer_img">
							<img src="../../resources/img/dealer_test_img03.jpg">
						</div>
						<div class="dealer_content">
							<h3>
								<span class="label label-primary glyphicon glyphicon-heart">20,345</span>
							</h3>
							<div class="badge_con"></div>
							<h2>초보님을 위한 비트코인 시작하기~</h2>
							<div class="dealer_id">@webtohouse</div>
							<div class="hashTag_group">
								<span class="label label-primary">#실시간시세</span> 
								<span class="label label-primary">#Bitcoin</span>
								<span class="label label-primary">#비트코인초보</span>
							</div>
						</div>
					</div>
				</div>
				<!-- end of col-sm-4 column -->
			</div>
		</div>
		<!-- end of row -->
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
		<!-- end of pagination -->
		<!-- end of row -->
	</div>
	<!-- end of row content -->
</body>

<%@ include file="../../include/footer.jsp"%>