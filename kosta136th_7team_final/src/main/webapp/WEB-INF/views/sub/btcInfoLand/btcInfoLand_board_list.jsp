<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../include/header.jsp"%>

<head>

<link rel="stylesheet" href="../../resources/css/btcInfoLand.css" />

<link rel="stylesheet" href="../../resources/css/river_community.css" />

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

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

					리버 커뮤니티<small>_딜러 전문소식</small>

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

		<div class="row">

			<div class="panel panel-default">

				<div class="panel-body">

					<span class="page_title">이달의 추천 딜러 |</span> <span>비트리버 회원이면 누구나 전문 딜러로 활동 할 수 있습니다. 다양한 정보를 많은 회원들과 공유해 보시길 바랍니다.</span>

				</div>

			</div>

		</div>
	</div>
	
	<div class="container">

		<div class="row">

			<div class="panel panel-default">

				<div class="panel-body">

					<div class="col-sm-6">

						<div class="dealer_photoshot">

							<img src="../../resources/img/dealer_test_img01.jpg">

						</div>
						
							<div class="dealer_room_title">딜러 카테고리: ${dealer.category}</div>
							<div class="dealer_position_title">딜러 포지션: ${dealer.user_nickName}</div>
						
					</div>

					<div class="col-sm-6 border_left_none">

						<div class="dealer_point">딜러 ${dealer.user_nickName} 님의 내공지수?</div>

						<div class="progress">


							<div class="progress-bar" role="progressbar" aria-valuenow="${dealer.score}" aria-valuemin="0" aria-valuemax="100" style="width: 1%">


								<span class="dealer_score">${dealer.score}Point</span>

							</div>

						</div>
							
							<div class="btn-group">
								
								<button type="button" class="btn btn-default" id="report">
									<span class="glyphicon glyphicon-bullhorn"> 신고하기</span>
								</button>

								<button type="button" class="btn btn-default" id="recommend">
									<span class="glyphicon glyphicon glyphicon-heart"> 추천하기</span>
								</button>
							
								<div class="vote_use">
									
									<c:if test = "${login.REGISTER_TYPE_CODE eq 'd' && login.USER_EMAIL == dealer.user_email}">
								
									<button type="button" class="btn btn-default" id="modify">
										<span class="glyphicon glyphicon glyphicon-ok"> 수정</span>
									</button>
								
									<button type="button" class="btn btn-default" id="remove">
										<span class="glyphicon glyphicon glyphicon-remove"> 삭제</span>
									</button>
								
									</c:if>
								
								</div>
							
							</div>
						
					<!-- .border_left_none  -->
					</div>
				</div>
			</div>
		<!-- end of col-sm-4 column -->
		</div>
	</div>
	<!-- 딜러 전문소식 리스트 -->
	<div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-body">
					<span class="page_title">딜러전문소식 |</span> <span>이달의 전문딜러 <b id = "dealerName">${dealer.user_nickName}</b> 님의 새로운 소식을 받아 보세요~ 다양한 정보를 만나 볼 수 있습니다.</span>
				</div>
			</div>
		</div>
	</div>

	<!-- 폼: -->	
	<form role="form" action="dealerPageUpdate" method="post">
		<input type='hidden' name='dealerNum' value="${dealer.dealer_page_num}"> 
		<input type='hidden' name='page' value="${cri.page}"> 
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">	
	</form>
	
	<iframe id = "frame" frameborder="0"></iframe>
	
</body>
<!-- 초기 iframe -->
<script>
	$(document).ready(function(){
		$('#frame').attr("src", "/btcInfoLand_news_list/" + $('#dealerName').html());
	})
</script>
<!-- 현우님 자바스크립트 -->
<script>
$(document).ready(function() {			
	<c:if test = "${not empty login}">
	//로그인 되어 있으면
	var login = '${login.USER_EMAIL}';
	</c:if>

	<c:if test = "${empty login}">
	//로그인 안 되 있으면
	var login = null;
	</c:if>
	var dealerNum = ${dealer.dealer_page_num}
			
		$('#report').on("click",function(event) {
			
			if(login == null) {
				alert("로그인 후 이용해주세요");
			} 
			
			var likeCheck = 'noCheck';
			var disLikeCheck = 'checked';
						
				$.ajax({
					url: "/sub/btcInfoLand/dealerPageButtoncheck",
					type: 'get',
					data: {"likeCheck" : likeCheck, "disLikeCheck" : disLikeCheck, "dealerNum" : dealerNum, "login" : login},
					success:  function (data) {
						if(data == "fale") {
							alert("한번의 신고만 가능합니다.");
						}
						self.location = "btcInfoLand_board_list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&dealer_page_num=${dealer.dealer_page_num}";
						
					}
						
				});
	
			});

			$('#recommend').on("click", function(event) {
				
				if(login == null) {
					alert("로그인 후 이용해주세요");
				} 
				
				var likeCheck = 'checked';
				var disLikeCheck = 'noCheck';
				
				$.ajax({
					url: "/sub/btcInfoLand/dealerPageButtoncheck",
					type: 'get',
					data: {"likeCheck" : likeCheck, "disLikeCheck" : disLikeCheck, "dealerNum" : dealerNum, "login" : login},
					success:  function (data) {
						if(data == "fale") {
							alert("한번의 추천만 가능합니다.");
						}
						self.location = "btcInfoLand_board_list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&dealer_page_num=${dealer.dealer_page_num}"; 

					}
				
				});
			});

			var formObj = $("form[role='form']");

			$("#modify").on("click", function() {
				formObj.attr("action", "dealerPageUpdate");
				formObj.attr("method", "get");
				formObj.submit();
			});
			
			$("#remove").on("click", function() {
				formObj.attr("action", "/sub/btcInfoLand/dealerPageRemove");
				formObj.submit();
			});

		});
</script>

<%@ include file="../../include/footer.jsp"%>
