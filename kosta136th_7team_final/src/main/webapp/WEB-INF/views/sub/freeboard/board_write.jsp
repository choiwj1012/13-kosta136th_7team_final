<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../../include/header.jsp"%>


<head>
<link rel="stylesheet" href="../../resources/css/board.css" />
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<!-- html editor -->
<!-- <script>
	tinymce.init({
		selector : 'textarea'
	});
</script> -->
<!-- html editor -->
</head>

<body id="page-top"></body>

<!-- 보드페이지 상단 이미지 -->
<%-- <div id="main_img">
	<div class="row">
		<div class="col-lg-3 visible"></div>
	</div>
	<%@ include file="../../include/grandNav.jsp"%>
</div> --%>


<section class="content">
	<div class="row content">

		<!-- 좌측 채팅창 영역 -->
		<div class="col-lg-3 visible-lg" align="left">
			<img class="side_img"
				src="https://dummyimage.com/300x800//f3f3f3/00e8cd&text=300x800/+chat"
				alt="Holder image">
		</div>


		<!-- 중앙 게시판 영역 -->
		<div class="col-lg-6" align="center">
			<!-- 광고이미지 -->
			<img class="center_img" src="../../resources/img/AD.gif"
				alt="Holder image">
			<!-- center side article -->

			<!-- 글 쓰기 페이지 레이아웃 -->
			<form role="form" method="post" action="http://localhost/sub/freeboard/board_write">
				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">Title</label> <input type="text"
							name='title' class="form-control" placeholder="Enter Title">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3"
							placeholder="Enter ..."></textarea>
					</div>

				</div>
				<!-- /.box-body -->

				<div class="box-footer">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
		</div>

		<!-- 우측  광고 영역 -->
		<div class="col-lg-3 sidebar visible-lg" align="right">
			<img class="side_img"
				src="https://dummyimage.com/300x800/333333/00e8cd&text=300x800+AD"
				alt="Holder image">
		</div>
	</div>
</section>

<%@ include file="../../include/footer.jsp"%>
