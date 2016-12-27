<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>

<link rel="stylesheet" href="../../../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../../../resources/css/common.css">
		
<script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="../../../resources/js/common.js"></script>
		
<script src="../../../resources/js/googleAnalytics.js"></script>
<link rel="stylesheet" href="../../resources/css/btcInfoLand.css" />
<link rel="stylesheet" href="../../resources/css/river_community.css" />

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

<script>
	var dealerName = $('#dealerName', window.parent.document).html();
</script>

</head>

<body>
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
								<div class="board_card_date"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dealerNewsItem.regi_date}" /></div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<div class="btn_area">
			<c:if test = "${login.USER_NICKNAME == dealerName}">
				<button type="button" class="btn btn-default" id="write_btn">글쓰기</button>
			</c:if>
		</div>
	</div>
	<div class="container text-center">
		<ul class="pagination pagination-sm">
			
			<c:if test="${not empty pageMaker.firstPage}">
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
    		</c:if>
						
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
		   url:"/writeImage/0",
		   cache: false,
	       contentType: false,
	       processData: false,
	       asynch: false,
	       success: function(url) {
	    	   $('#summernote').summernote(
	    			   'insertImage', 
	    			   "http://localhost/displayFile?fileName=" + file.name, file.name
	    		);
	       }
		});
	}
	</script>
	<!-- 댓글 입력 최종 전송폼 : #form_write -->
	<form id="form_write">
		<input type="hidden" name="title" />
		<input type="hidden" name="content" />
	</form>
	<!-- 전페이지 버튼 클릭 시 전송폼 : #form_previous_page -->
	<form id="form_previous_page">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage - 1}" />
	</form>
	<!-- 후페이지 버튼 : #form_next_page -->
	<form id="form_next_page">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage + 1}" />
	</form>
	<!-- 페이지(숫자) 버튼 : #form_pagebar -->
	<form id="form_pagebar">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="" />
	</form>
	<!-- 조회 하기 : #form_read
			dealer_news_num은 클릭해야 정해짐 -->
	<form id="form_read">
		<input type="hidden" name="dealer_news_num" value="" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage}" />
	</form>
	<c:if test="${not empty login}">
		<script>
			//로그인 되어 있으면
			var login = {
							USER_EMAIL : '${login.USER_EMAIL}',
							REGISTER_TYPE_CODE : '${login.REGISTER_TYPE_CODE}',
							USER_NICKNAME : '${login.USER_NICKNAME}'
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

<!-- 초기 -->
<script>
	$(document).ready(function() {

	});
</script>
<!-- 전페이지 -->
<script>
	$(document).ready(function() {
		$('body').on('click', '#previous_page_btn', function() {
			$('#form_previous_page').attr('action', '/btcInfoLand_news_list/'
					 + $('#dealerName', window.parent.document).html());
			
			$('#form_previous_page').submit();

		});
	});
</script>
<!-- 뒷페이지 -->
<script>
	$(document).ready(function() {
		$('body').on('click', '#next_page_btn', function() {
			
			$('#form_next_page').attr('action', '/btcInfoLand_news_list//'
					 + $('#dealerName', window.parent.document).html());
			
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
						'.board_card',
						function() {
							$('#form_read').attr('action', '/btcInfoLand_board_read/'
									 + $('#dealerName', window.parent.document).html());
							
							//글번호 선택자 정확함
							var dealer_news_num = $(this).children(
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
			
			/* */
			if ( login.USER_NICKNAME != $('#dealerName', window.parent.document).html()) {
				alert('본인의 딜러 페이지에 글을 써야합니다');
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
			//첫번째 그림의 주소
			var imgName = imgSrc.split("=")[1];
			
			    	
			$.ajax({
			    url : '/makeThumbnail',
			    data : {nameSubmitFile : imgName,
			    	dealer_news_num : 0
			    },
			    type : 'POST',
			    async: false,
			    success : function(){
			    			
			    }
			});
			
			var title = $('#write_title').val();
			var content = $('#summernote').summernote('code');
			$('#form_write').children('input[name = "title"]').val(title);
			$('#form_write').children('input[name = "content"]').val(content);
			$('#form_write').attr('action', '/writeNews/'
					 + $('#dealerName', window.parent.document).html());

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
	$(document).ready(function() {
		$('body').on('click','.pageNum',function() {
			$('#form_pagebar').attr('action', '/btcInfoLand_news_list/'
					 + $('#dealerName', window.parent.document).html());
			//목록 페이지 버튼. 정확함
			var page_num = $(this).text().trim();
			
			$('#form_pagebar').children(
				'input[name = "currentPage"]').val(page_num);
			$('#form_pagebar').submit();
		});
	});
</script>
