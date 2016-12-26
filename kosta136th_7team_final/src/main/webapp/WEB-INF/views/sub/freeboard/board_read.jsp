<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/grandNav.jsp"%>
<head>
<link rel="stylesheet" href="../../resources/css/board.css" />
</head>
<body id="page-top">
	<div class="container-fluid">
		<!-- 보드페이지 상단 이미지 -->
		<div class="row">
			<div class="location_bg"></div>
		</div>
	</div>
	<div class="container">
		<div class="row page-header">
			<h1>자유게시판</h1>
			<ul class="breadcrumb">
				<li><a href="/">Home</a></li>
				<li class="active">자유게시판</li>
			</ul>
		</div>
	</div>
	<div class="row content">
		<form role="form" method="post">
			<input type='hidden' name='bno' value="${freeBoard.freeBoard_Num}">
		</form>
		<div class="row content">
			<!-- 중앙 게시판 영역 -->
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="panel panel-default">
					<div class="panel-body">회원님들의 소중한 의견을 기다립니다. 자유롭게 글을 남겨 주세요.</div>
				</div>
			</div>
			<div class="col-lg-2"></div>
		</div>
		<div class="row content content_width">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<table class="table table-bordered">
					<tr>
						<th class="read_table_num">글번호</th>
						<td class="text-center">${freeBoard.freeBoard_Num}</td>
						<th>작성자</th>
						<td>${freeBoard.writer}</td>
						<th>작성일</th>
						<td>
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${freeBoard.regi_date}" />
						</td>
						<th>조회수</th>
						<td class="text-center">${freeBoard.view_count}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="7">${freeBoard.title}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="7">
							<span class="article_content"> ${freeBoard.content} </span>
						</td>
					</tr>
				</table>
				<%-- <form class="form-horizontal">
					<div class="form-group">
						<!-- 글 제목이 삽입됨 -->
						<label for="exampleInputEmail1">제목</label>
						<input type="text" name='title' class="form-control" value="${freeBoard.title}" readonly="readonly">
						<!-- 글 작성자가 삽입됨 -->
						<label for="exampleInputEmail1">작성자</label>
						<input type="text" name="writer" class="form-control" value="${freeBoard.writer}" readonly="readonly">
						<label for="exampleInputEmail1">작성일</label>
						<input type="text" name="writer" class="form-control" value="${freeBoard.regi_date}" readonly="readonly">
						<!-- 글 내용이 들어 갑니다. -->
						<label for="exampleInputPassword1">Content</label>
						<textarea class="form-control" name="content" rows="3" readonly="readonly">${freeBoard.content}</textarea>
					</div>
				</form> --%>
			</div>
			<div class="col-lg-2"></div>
		</div>
	</div>
	<div class="row content">
		<div class="col-lg-3"></div>
		<div class="col-lg-6 text-center" id="button_group">
			<button type="submit" class="btn btn-warning" onclick="location.href='/board_update'">수정</button>
			<button type="submit" class="btn btn-danger">삭제</button>
			<button type="button" class="btn btn-primary">목록</button>
		</div>
		<div class="col-lg-3"></div>
	</div>
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

			$(".btn-warning").on("click", function() {
				formObj.attr("action", "/board/modify");
				formObj.attr("method", "get");
				formObj.submit();
			});

			$(".btn-danger").on("click", function() {
				formObj.attr("action", "/board/remove");
				formObj.submit();
			});

			$(".btn-primary").on("click", function() {
				self.location = "/sub/freeboard/board_list";
			});

		});
	</script>
</body>
<%@ include file="../../include/footer.jsp"%>
