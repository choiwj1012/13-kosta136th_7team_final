<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../include/header.jsp"%>


<head>
<link rel="stylesheet" href="../../resources/css/board.css" />
</head>

<body id="page-top">

	<!-- 보드페이지 상단 이미지 -->
	<div id="main_img">
		<div class="row">
			<div class="col-lg-3 visible"></div>
		</div>
		<%@ include file="../../include/grandNav.jsp"%>
	</div>



	<div class="row content">

		<!-- 좌측 채팅창 영역 -->
		<div class="col-lg-3 visible-lg" align="left">
			<img class="side_img"
				src="https://dummyimage.com/300x800//f3f3f3/00e8cd&text=300x800/+chat"
				alt="Holder image">
		</div>

		<form role="form" method="post">

			<input type='hidden' name='bno' value="${freeBoard.freeBoard_Num}">
			<input type='hidden' name='page' value="${cri.page}"> <input
				type='hidden' name='perPageNum' value="${cri.perPageNum}">
		</form>


		<!-- 중앙 게시판 영역 -->
		<div class="col-lg-6" align="center">
			<!-- 광고이미지 -->
			<!-- center side article -->
			<div class="box-body">
				<div class="form-group">
					<label for="exampleInputEmail1">Title</label> <input type="text"
						name='title' class="form-control" value="${freeBoard.title}"
						readonly="readonly">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Content</label>
					<textarea class="form-control" name="content" rows="3"
						readonly="readonly">${freeBoard.content}</textarea>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Writer</label> <input type="text"
						name="writer" class="form-control" value="${freeBoard.writer}"
						readonly="readonly">
				</div>
			</div>
		</div>

	</div>

		
		<div class="box-footer">
			<button type="submit" class="btn btn-primary">GO LIST</button>
		</div>

		<!-- ++ -->

	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			/* $(".btn-warning").on("click", function(){
				formObj.attr("action", "/board/modify");
				formObj.attr("method", "get");		
				formObj.submit();
			});
			
			$(".btn-danger").on("click", function(){
				formObj.attr("action", "/board/remove");
				formObj.submit();
			}); */

			$(".btn-primary").on("click", function(){
				formObj.attr("method", "get");
				formObj.attr("action", "/freeboard/board_listPage");
				formObj.submit();
			});

		});
	</script>

	<!-- </form>
	</div> -->
	<!-- 우측  광고 영역 -->
	<div class="col-lg-3 sidebar visible-lg" align="right">
		<img class="side_img"
			src="https://dummyimage.com/300x800/333333/00e8cd&text=300x800+AD"
			alt="Holder image">
	</div>
	<!-- </div> -->

</body>

<%@ include file="../../include/footer.jsp"%>
