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
	<!-- 딜러 전문소식 리스트 -->
	<div class="container">
		<div class="article_title ">
			<div class="board_readtitle">
				<h3>
					<input type = "text" id = "dealer_news_title" 
					value = "${pageMaker.title}" 
					 style="border-style: none; width:100%" readOnly/>
				</h3>
			</div>
			<span class="btcinfoland_writer">작성자 : ${pageMaker.writer}</span> <span class="btcinfoland_writeDate"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${pageMaker.regi_date}" />
			</span> <span class="btcinfoland_write_readCount">조회수 : 21,234</span>
			<script>
				$(document).ready(function() {
					$('[data-toggle="tooltip"]').tooltip();
				});
			</script>
		</div>
		
		
			<div class="container">
				<p class="board_content">					
					<div id="summernote">
					${pageMaker.content}
					</div>
				</p>
			</div>
		
		<hr>
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="btn_area">
						<button type="button" class="btn btn-default" data-toggle="tooltip" title="이전글">
							<span id="previous_news_btn" class="glyphicon glyphicon-chevron-left">
							</span>
						</button>
						<button type="button" class="btn btn-default" id="go_list_btn">글목록</button>
						
						<c:if test = "${login.USER_NICKNAME == dealerName}">
						<button type="button" class="btn btn-default" id="modify_btn">글수정</button>
						<button type="button" class="btn btn-default" id="delete_btn">글삭제</button>
						</c:if>
						
						<button type="button" class="btn btn-default" data-toggle="tooltip" title="다음글">
							<span id="next_news_btn" class="glyphicon glyphicon-chevron-right">
							</span>
						</button>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<hr>
		<!-- 댓글 목록 -->
		<div class="container">
			<div class="row">
				<button type="button" class="btn btn-default" id="reply_list_btn"  data-toggle="tooltip" title="댓글 목록을 확인 합니다."><span class="glyphicon glyphicon-list"></span> 댓글보기</button>
				<button type="button" class="btn btn-default" id="write_reply_btn" data-toggle="tooltip" title="댓글 목록을 확인 합니다."><span class="glyphicon glyphicon-pencil"></span> 댓글달기</button>
			</div>
			<div class="row">
			<!-- 댓글목록 출력 -->
				<div id="reply_list">
					
				</div>
			</div>
		</div>
	</div>
	<!-- 전항 버튼 -->
	<form id="form_previous_news">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage}" />
	</form>
	<!-- 후항 버튼 -->
	<form id="form_next_news">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage}" />
	</form>
	<!-- 댓글 등록 모달. 모달창 이름: #modal_write_reply -->
	<div class="modal fade" id="modal_write_reply" role="dialog">
		<div class="modal-dialog">
			<!-- modal content -->
			<div class="modal-content">
				<!-- 모달 윗부분 : X 버튼 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<!-- #write_reply_content, #reply_agree_btn, #reply_cancel_btn -->
					<div class="form-group">
						<label for="write_reply_content">내용</label>
						<input type="text" class="form-control" name="content" id="write_reply_content" placeholder="내용을 입력하세요" />
						<br>
						<input type="button" class="btn btn-primary"
						id="reply_agree_btn" value="보내기" />
						<input type="button" class="btn btn-danger"
						id="reply_cancel_btn" value="취소" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 목록 버튼 클릭 시 스크립트 실행을 위한 폼 : #form_go_list-->
	<form id="form_go_list">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage}" />
	</form>
	<!-- 삭제 버튼 클릭 시 스크립트 실행을 위한 폼 : form_delete-->
	<form id="form_delete">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="currentPage" value="${pageMaker.currentPage}" />
	</form>
	<!-- 댓글 입력 최종 전송폼 : #form_write_reply -->
	<form id="form_write_reply" role="form" action="/writeReply">
		<input type="hidden" name="content" />
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="reply_num" />
	</form>
	<!-- 댓글 수정 전송 폼 -->
	<form id="form_modify"">
		<input type="hidden" name="dealer_news_num" value="${pageMaker.dealer_news_num}" />
		<input type="hidden" name="title" />
		<input type="hidden" name="content" />
	</form>
	<!-- 목록으로 돌아가기 버튼: #go_list_btn 클릭 -->
	<script>
		$(document).ready(function() {
			$('#go_list_btn').on('click', function() {
				$('#form_go_list').attr('action','/btcInfoLand_board_read_to_list/' + $('#dealerName', window.parent.document).html());
				$('#form_go_list').submit();
 			});
		});
	</script>
	
	<!-- 글수정 버튼: #modifyBtn 클릭 -->
	<script>
		$(document).ready(function() {
			$('#modify_btn').on('click', function() {

				/* 로그인 테스트 시작 */
				if (login == null) {
					alert('로그인을 먼저 해 주세요');
					return;
				}
				/* 끝 */

				/* 본인 검사 */
				if (login.USER_EMAIL != '${pageMaker.writer}') {
					alert('본인이 쓴 글이 아니면 수정할 수 없습니다');
					return;
				}
				/* 끝 */

				if ($('#dealer_news_title').prop('readOnly') == true){
					
					$('#summernote').summernote({	
		  				height: 300,                 // set editor height
		  				minHeight: null,             // set minimum height of editor
		  				maxHeight: null,             // set maximum height of editor
		  				focus: true                  // set focus to editable area after initializing summernote
		  				,callbacks: {
		  				  onImageUpload: function(files, editor, welEditable) {
		  				      sendFile(files[0], editor, welEditable);
		  				   },
		  				 onMediaDelete : function($target, editor, $editable) {
		  			          alert($target[0].src); // img 
							  
		  			          $target.remove();
		  			       }
		  				 }
					});
			    	   
					$('#dealer_news_title').attr("style","border-style: solid; width: 100%");
					$('#dealer_news_title').attr("readOnly", false);

				}else{
						$('#form_modify input[name="title"]').val($('#dealer_news_title').val());
						
						var div = document.createElement('div');
			    		div.innerHTML = $('#summernote').summernote('code');
			    		var firstImage = div.getElementsByTagName('img')[0]
			    		var imgSrc = firstImage ? firstImage.src : "";
						//첫번째 그림의 주소
			    		var imgName = imgSrc.split("=")[1];
			    	
			    		$.ajax({
			    			url : '/makeThumbnail',
			    			data : {nameSubmitFile : imgName,
			    				dealer_news_num : ${pageMaker.dealer_news_num}
			    			},
			    			type : 'POST',
			    			async: false,
			    			success : function(){
			    			
			    			}
			    		});
			    	
						$('#form_modify input[name="content"]').val($('#summernote').summernote('code'));
						
						$('#form_modify').attr('action', "/modifyNews/" + $('#dealerName', window.parent.document).html());
						$('#form_modify').submit();
					}
					
				});

		});
	</script>
	
	<!-- 마이페이지 이동 버튼: .reply_writer 클릭 -->
	<script>
		$(document).ready(function() {
			$('body').on('click', '.reply_writer', function(e) {
				e.preventDefault();

				/* 본인 테스트 */
				if (login.USER_EMAIL != $(this).text()) {
					return;
				}
				/* 끝 */

				window.parent.location.href = '/myPage';

			});
		});
	</script>
	
	<!-- 글삭제 버튼: #deleteBtn 클릭 -->
	<script>
		$(document).ready(function() {
			$('#delete_btn').on('click', function() {
				/* 로그인 테스트 시작 */
				if (login == null) {
					alert('로그인을 먼저 해 주세요');
					return;
				}
				/* 끝 */

				/* 본인 테스트 */
				if (login.USER_EMAIL != '${pageMaker.writer}') {
					alert('본인이 쓴 글이 아니면 삭제할 수 없습니다');
					return;
				}
				/* 끝 */
				$('#form_delete').attr('action','/deleteNews/' + $('#dealerName', window.parent.document).html());
				$('#form_delete').submit();
			});
		});
	</script>
	
	<!-- 댓글삭제 버튼: #delete_reply 클릭 -->
	<script>
		$(document).ready(function() {
			$('body').on('click', '#delete_reply', function() {

				/* 로그인 테스트 시작 */
				if (login == null) {
					alert('로그인을 먼저 해 주세요');
					return;
				}
				/* 끝 */

				/* 본인 검사 */
				if (login.USER_EMAIL != $(this).siblings('.reply_writer').text()) {
					alert('본인이 아니면 삭제할 수 없습니다');
					return;
				}
				/* 끝 */

				reply_num = $(this).parent().attr('id');

				$.ajax({
					type : 'post',
					url : '/deleteReply',
					data : {
						'reply_num' : reply_num
					}
				}).done(function() {
					/* done은 ajax의 성공, 실패 여부와 상관 없이 결과가 끝난후 실행한다. */
					getDealerNewsReplyList();
				});

			});
		});
	</script>
	
	<!-- 답글 모달창을 호출하는 답글 옆에 써진 '답글' : #write_reply 클릭시 글번호 변경 -->
	<script>
		$(document).ready(function() {
			$('body').on('click', '#write_reply', function(e) {

				/* 로그인 테스트 시작 */
				if (login == null) {
					alert('로그인을 먼저 해 주세요');
					return;
				}
				/* 로그인 테스트 끝 */

				/* 어느 댓글번호에 대한 답글인가 */
				reply_num = $(this).parent().attr('id');
				/* 모달창 나타난다 */
				$('#modal_write_reply').modal("show");
			});
		});
	</script>
	
	<!-- 답글 모달창을 호출하는 '답글쓰기' 버튼 : #write_reply_btn 클릭시 글번호 변경 -->
	<script>
		$(document).ready(function() {
			$('body').on('click', '#write_reply_btn', function(e) {

				/* 로그인 테스트 시작 */
				if (login == null) {
					alert('로그인을 먼저 해 주세요');
					return;
				}
				/* 로그인 테스트 끝 */

				/*새로 답글 쓰기 버튼을 눌러 쓰는 답글은 누구(reply_num)에 대한 답글도 아니다*/
				reply_num = 0;
				$('#modal_write_reply').modal("show");
			});
		});
	</script>
	
	<!-- 초기 설정 : 시작-->
	<script>
		//어느 댓글에 대하여 답글을 다는가 
		var reply_num = null;
	</script>
	
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
	
	<!-- 초기 설정 : 끝 -->
	<!-- 답글 모달에서 제출 버튼 클릭 -->
	<script>
		$(document).ready(function() {
			$('#reply_agree_btn').on('click', function(e) {
				$('input[name="reply_num"]').val(reply_num);
				$('input[name="content"]').val($('#write_reply_content').val());
				/* 서버에 댓글 등록을 요청하고 */
				$.ajax({
					url : $('#form_write_reply').attr("action"),
					type : 'POST',
					data : $('#form_write_reply').serializeArray(),
					success : function(data) {
						$.ajax({
							url : '/getDealerNewsReplyList',
							type : 'POST',
							data : $('#form_write_reply').serializeArray(),
							success : function() {}
						});
					}
				}).done(function() {
					/* done은 ajax의 성공, 실패 여부와 상관 없이 결과가 끝난후 실행한다. */
					getDealerNewsReplyList();
					$('#modal_write_reply').modal("hide");
				});
			});
		});
	</script>
	<!-- 답글 모달에서 답글 취소 버튼 클릭 : #reply_cancel_btn -->
	<script>
	$(document).ready(function() {
		$('#reply_cancel_btn').on('click', function(e) {
			$('#modal_write_reply').modal("hide");
		});
	});
	</script>
	<!-- 댓글보기 버튼 클릭 시 스크립트 실행을 위한 폼.-->
	<script>
		$(document).ready(function() {
			$('#reply_list_btn').on('click', function() {
				getDealerNewsReplyList();
			});
		});
	</script>
	<!-- 댓글 목록 서버에서 요청하는 함수 -->
	<script>
		function getDealerNewsReplyList() {
			$.ajax({
				type : 'post',
				url : '/getDealerNewsReplyList',
				/* 실제 쓰이는 것은 dealer_news_num */
				data : {
					'dealer_news_num' : '${pageMaker.dealer_news_num}',
					'perPageNum' : '${pageMaker.perPageNum}',
					'perPagebarPage' : '${pageMaker.perPagebarPage}',
					'firstPage' : '${pageMaker.firstPage}',
					'lastPage' : '${pageMaker.lastPage}'
				},
				success : function(data) {
					listReply(data);
				}
			});
		}
	</script>
	<!-- 댓글 '#reply_list' 아래로 주렁주렁 달기 함수 -->
	<script>
		function listReply(data) {
			$('#reply_list').empty();
			//댓글을 쓰는 문단
			//replyList
			for (var i = 0; i < data.length; i++) {

				/*  <<설계도>> */
				/*
					<div "#replyList">
						<tr>
							Lorem Impsum Dol Amet
							<a></a>
						</tr>						
				 */
				$('#reply_list')
						.append('<div id = "' + data[i].reply_num + '" class="reply_list_row">');
						
				if (data[i].indent == 0) {
					$('#' + data[i].reply_num).append('<span class="glyphicon glyphicon-bullhorn"></span>' + '&nbsp;&nbsp;');
				} else {
					for (var j = 0; j < data[i].indent; j++) {
						$('#' + data[i].reply_num).append('&nbsp;&nbsp;&nbsp;&nbsp;');
					}
					$('#' + data[i].reply_num).append('<span class="glyphicon glyphicon-comment"></span>' + '&nbsp;');
				}

				$('#' + data[i].reply_num).append(
						'<span>작성자 :</span> <a href = "#" class = "reply_writer">'
								+ data[i].writer + '</a>님');
				$('#' + data[i].reply_num).append('&nbsp;&nbsp;');
				$('#' + data[i].reply_num).append(
						"<span class='reply_date'>작성일 :</span> " + (new Date(data[i].regi_date).getDate())
								+ "일"
								+ (new Date(data[i].regi_date).getHours())
								+ "시"
								+ (new Date(data[i].regi_date).getMinutes())
								+ "분");
				$('#' + data[i].reply_num).append('&nbsp;&nbsp;');
				
				$('#' + data[i].reply_num)
						.append(
								'<button type="button" class="btn btn-default  btn-sm" id="write_reply">답글</button>');
				$('#' + data[i].reply_num).append('&nbsp;&nbsp;');
				
				if (data[i].writer == login.USER_EMAIL){	
					$('#' + data[i].reply_num).append(
								'<button type="button" class="btn btn-default  btn-sm" id="delete_reply">삭제</button>'
								);
				}
				
				$('#' + data[i].reply_num).append('<p class="reply_content">');
				
				for (var j = 0; j < data[i].indent; j++) {
					$('#' + data[i].reply_num).append('&nbsp;&nbsp;&nbsp;&nbsp;');
				}
				
				$('#' + data[i].reply_num).append('<span class="reply_content_title">내용 :</span> ' + data[i].content + '</p>');
			}
			$('#reply_list').append('</div>');

		}
	</script>
	<!-- 전글 이동 버튼 -->
	<script>
		$(document).ready(function() {
			$('body').on('click', '#previous_news_btn', function() {
				$('#form_previous_news').attr('action', '/getPreviousNews/'
						 + $('#dealerName', window.parent.document).html());
				$('#form_previous_news').submit();
			});
		});
	</script>
	<!-- 다음글 이동 버튼 -->
	<script>
		$(document).ready(function() {
			$('body').on('click', '#next_news_btn', function() {
				$('#form_next_news').attr('action', '/getNextNews/'
						 + $('#dealerName', window.parent.document).html());
				$('#form_next_news').submit();
			});
		});
	</script>
	<!-- 썸머노트 -->
	<script>
	function sendFile(file, editor, welEditable) {
	    data = new FormData();
	    data.append("multipartFile", file);
		$.ajax({
		  data: data,
	      type: "POST",
		   url:"/writeImage/" + ${pageMaker.dealer_news_num},
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
</body>
