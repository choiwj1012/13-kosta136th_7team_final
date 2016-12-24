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

							<div class="progress-bar" role="progressbar" aria-valuenow="${dealer.score}" aria-valuemin="0" aria-valuemax="100" style="width: ${dealer.score}">

								<span class="dealer_score">${dealer.score}point</span>

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
					<span class="page_title">딜러전문소식 |</span> <span>이달의 전문딜러 ${dealer.user_nickName} 님의 새로운 소식을 받아 보세요~ 다양한 정보를 만나 볼 수 있습니다.</span>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-body">
					<c:forEach items="${dealerNewsList}" var="dealerNewsItem">
						<div class="board_card">
							<div class="board_card_num" style="display: none">${dealerNewsItem.dealer_news_num}</div>
							<div class="board_card_img">
								<img src="http://localhost/displayFile?fileName=num${dealerNewsItem.dealer_news_num}" onError="this.src = '../../resources/img/dealer_test_img01.jpg'" />
							</div>
							<div class="board_card_col">
								<div class="board_card_title">${dealerNewsItem.title}</div>
								<div class="board_card_writer">${dealerNewsItem.writer}</div>
								<div class="board_card_readcount">21,234</div>
								<div class="board_card_date">${dealerNewsItem.regi_date}</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<div class="btn_area">
			<button type="button" class="btn btn-default" id="write_btn">글쓰기</button>
		</div>
	</div>
	<div class="container text-center">
		<ul class="pagination pagination-sm">
			<li><a href="#" id="previous_page_btn">&laquo;</a></li>
			<c:forEach var="i" begin="${pageMaker.firstPage}" end="${pageMaker.lastPage}">
				<c:if test="${i != pageMaker.currentPage}">
					<li><a href="#" class="pageNum">
							<c:out value="${i}" />
						</a></li>
				</c:if>
				<c:if test="${i == pageMaker.currentPage}">
					<li class="active"><a href="#" class="pageNum">
							<c:out value="${i}" />
						</a></li>
				</c:if>
			</c:forEach>
			<li><a href="#" id="next_page_btn">&raquo;</a></li>
		</ul>
	</div>
	
	<div class="modal fade" id="modal_write" role="dialog">

	<div class="modal-dialog">
		
		<!-- modal content -->
		<div class="modal-content">
			
				<!-- 모달 윗부분 : X 버튼 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
			
				<div class="modal-body">
					<!-- id:#write_title, #write_content, #write_agree_btn, #write_cancel_btn-->
					<div class = "form-group">
						<label for = "write_title">제목</label>
						<input type = "text" class = "form-control" 
						name = "title" id = "write_title" placeholder = "제목을 입력하세요"/>
  						<label for = "summernote">내용</label>					
 						<div id="summernote"></div>
						<div class="buttons" align="right">
							<input type = "button" class="btn btn-primary" id = "write_agree_btn" value = "보내기"/>
							<input type = "button" class="btn btn-danger" id = "write_cancel_btn" value = "취소"/>
						</div>
					</div>
				</div>
			
			</div>
		</div>
	</div>
	
	<script>
	$('#summernote').summernote({
	  placeholder: '내용을 입력하세요',	
	
	  height: 300,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true                  // set focus to editable area after initializing summernote
	  ,
	  callbacks: {
	  onImageUpload: function(files, editor, welEditable) {
	      sendFile(files[0], editor, welEditable);
	   }
	  }
	});
	function sendFile(file, editor, welEditable) {
	    data = new FormData();
	    data.append("multipartFile", file);
		$.ajax({
		  data: data,
	      type: "POST",
		   url:"/writeImage",
		   cache: false,
	       contentType: false,
	       processData: false,
	       success: function(url) {
	    	   $('#summernote').summernote(
	    			   'insertImage', 
	    			   "http://localhost/displayFile?fileName=" + file.name, file.name
	    		);
	       }
		});
	}
	</script>

	<!-- 폼: -->	
	<form role="form" action="dealerPageUpdate" method="post">
		<input type='hidden' name='dealerNum' value="${dealer.dealer_page_num}"> 
		<input type='hidden' name='page' value="${cri.page}"> 
		<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
		<input type='hidden' name='searchType' value="${cri.searchType}">
		<input type='hidden' name='keyword' value="${cri.keyword}">	
	</form>
	
	<!-- 댓글 입력 최종 전송폼 : #form_write -->
	<form id="form_write" role="form" action="/writeNews">
		<input type="hidden" name="title" />
		<input type="hidden" name="content" />
	</form>
	<!-- 전페이지 버튼 클릭 시 전송폼 : #form_previous_page -->
	<form id="form_previous_page" action="/btcInfoLand_board_list2">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage - 1}" />
	</form>
	<!-- 후페이지 버튼 : #form_next_page -->
	<form id="form_next_page" action="/btcInfoLand_board_list2">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage + 1}" />
	</form>
	<!-- 페이지(숫자) 버튼 : #form_pagebar -->
	<form id="form_pagebar" action="/btcInfoLand_board_list2">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="" />
	</form>
	<!-- 조회 하기 : #form_read
			dealer_news_num은 클릭해야 정해짐 -->
	<form id="form_read" action="/btcInfoLand_board_read2">
		<input type="hidden" name="dealer_news_num" value="" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage}" />
	</form>
	<c:if test="${not empty login}">
		<script>
			//로그인 되어 있으면
			var login = {
							USER_EMAIL : '${login.USER_EMAIL}',
							REGISTER_TYPE_CODE : '${login.REGISTER_TYPE_CODE}' 
						};
		</script>
	</c:if>
	<c:if test="${empty login}">
		<script>
			//로그인 안 되 있으면
			var login = null;
		</script>
	</c:if>
</body>
<script>
	$(document).ready(function() {
		/* var dealerNum = $
		{
			dealer.dealer_page_num
		} */
		$('#report').on("click", function(event) {
			var likeCheck = 'noCheck';
			var disLikeCheck = 'checked';

			$.ajax({
				url : "/sub/btcInfoLand/dealerPageButtoncheck",
				type : 'get',
				data : {
					"likeCheck" : likeCheck,
					"disLikeCheck" : disLikeCheck,
					"dealerNum" : dealerNum
				},
				success : function(data) {
					self.location = "btcInfoLand_board_list?page = " + $
					{
						cri.page
					}
					+"&dealer_page_num=" + $
					{
						dealer.dealer_page_num
					}
					;
				}

			});

		});

		$('#recommend').on("click", function(event) {

			var likeCheck = 'checked';
			var disLikeCheck = 'noCheck';

			$.ajax({
				url : "/sub/btcInfoLand/dealerPageButtoncheck",
				type : 'get',
				data : {
					"likeCheck" : likeCheck,
					"disLikeCheck" : disLikeCheck,
					"dealerNum" : dealerNum
				},
				success : function(data) {
					self.location = "btcInfoLand_board_list?page = " + $
					{
						cri.page
					}
					+"&dealer_page_num=" + $
					{
						dealer.dealer_page_num
					}
					;

				}

			});
		});
		var formObj = $("form[role='form']");
		$('#remove').on("click", function(event) {
			formObj.attr("action", "/sub/btcInfoLand/dealerPageRemove");
			formObj.submit();
		});

		$('#modify').on("click", function(event) {
			formObj.attr("action", "/sub/btcInfoLand/dealerPageUpdate");
			formObj.attr("method", "get");
			formObj.submit();
		});

	});
</script>
<!-- 여기는 자바스크립트! -->
<!-- 현우님 자바스크립트 -->
<script>
$(document).ready(function() {			
	
	var dealerNum = ${dealer.dealer_page_num}
			
		$('#report').on("click",function(event) {
			var likeCheck = 'noCheck';
			var disLikeCheck = 'checked';
						
				$.ajax({
					url: "/sub/btcInfoLand/dealerPageButtoncheck",
					type: 'get',
					data: {"likeCheck" : likeCheck, "disLikeCheck" : disLikeCheck, "dealerNum" : dealerNum},
					success:  function (data) {
						self.location = "btcInfoLand_board_list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&dealer_page_num=${dealer.dealer_page_num}";
						
					}
						
				});
	
			});

			$('#recommend').on("click", function(event) {
				
				var likeCheck = 'checked';
				var disLikeCheck = 'noCheck';
				
				$.ajax({
					url: "/sub/btcInfoLand/dealerPageButtoncheck",
					type: 'get',
					data: {"likeCheck" : likeCheck, "disLikeCheck" : disLikeCheck, "dealerNum" : dealerNum},
					success:  function (data) {
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
<!-- 전페이지 -->
<script>
	$(document).ready(function() {
		$('body').on('click', '#previous_page_btn', function() {

			$('#form_previous_page').submit();

		});
	});
</script>
<!-- 뒷페이지 -->
<script>
	$(document).ready(function() {
		$('body').on('click', '#next_page_btn', function() {

			$('#form_next_page').submit();

		});
	});
</script>
<!-- Thumbnail을 클릭해 조회한다. -->
<script>
	$(document).ready(
			function() {
				$('body').on(
						'click',
						'.board_card_img',
						function() {
							//글번호 선택자 정확함
							var dealer_news_num = $(this).siblings(
									'.board_card_num').text();
							$('#form_read').children(
									'input[name = "dealer_news_num"]').val(
									dealer_news_num);
							$('#form_read').submit();
						});
			});
</script>
<!-- 모달을 호출하기 위해 클릭하는 글쓰기 버튼 '글쓰기' 클릭: #write_btn -->
<script>
	$(document).ready(function() {
		$('body').on('click', '#write_btn', function(e) {
			/* 로그인 테스트 시작 */
			if (login == null) {
				alert('로그인을 먼저 해 주세요');
				return;
			}
			/* 끝 */

			/* 로그인 테스트 시작 */
			if ((login.REGISTER_TYPE_CODE != "d") && (login.REGISTER_TYPE_CODE != "D")) {
				alert('딜러만이 글을 쓸 수 있습니다.');
				return;
			}
			/* 끝 */

			$('#modal_write').modal("show");
		});
	});
</script>
<!-- 글쓰기 모달에서 전송 버튼 클릭 : #write_agree_btn -->
<script>
	$(document).ready(function() {
		$('#write_agree_btn').on('click', function(e) {
			
			var div = document.createElement('div');
			div.innerHTML = $('#summernote').summernote('code');
			var firstImage = div.getElementsByTagName('img')[0]
			var imgSrc = firstImage ? firstImage.src : "";
			var imgName = imgSrc.split("=")[1];
			alert('첫번째 그림의 주소는 ' + imgName);
			    	
			$.ajax({
			    url : '/makeThumbnail',
			    data : {nameSubmitFile : imgName,
			    	dealer_news_num : 0
			    },
			    type : 'POST',
			    asynch: false,
			    success : function(){
			    			
			    }
			});
			
			var title = $('#write_title').val();
			var content = $('#summernote').summernote('code');
			$('#form_write').children('input[name = "title"]').val(title);
			$('#form_write').children('input[name = "content"]').val(content);
			$('#form_write').submit();
		});
	});
</script>
<!-- 글쓰기 모달에서 취소 버튼 클릭 : #write_agree_btn -->
<script>
	$(document).ready(function() {
		$('#write_cancel_btn').on('click', function(e) {
			$('#modal_write').modal("hide");
		});
	});
</script>
<!-- 페이지 숫자를 클릭했을 때 -->
<script>
	$(document).ready(
			function() {
				$('body').on(
						'click',
						'.pageNum',
						function() {
							//목록 페이지 버튼. 정확함
							var page_num = $(this).text().trim();
							$('#form_pagebar').children(
									'input[name = "currentPage"]')
									.val(page_num);
							$('#form_pagebar').submit();
						});
			});
</script>
<%@ include file="../../include/footer.jsp"%>
