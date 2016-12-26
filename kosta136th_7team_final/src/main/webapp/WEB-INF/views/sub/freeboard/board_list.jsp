<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
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
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div class="panel panel-default">
				<div class="panel-body">회원님들의 소중한 의견을 기다립니다. 자유롭게 글을 남겨 주세요.</div>
			</div>
		</div>
		<div class="col-lg-2"></div>
	</div>
	<div class="row content">
		<!-- 중앙 게시판 영역 -->
		<div class="col-lg-2"></div>
		<div class="col-lg-8">
			<div id="first_board">
				<br>
				<table class="table table-bordered table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<c:forEach items="${list}" var="freeBoard">
						<tr>
							<td class="text-center">${freeBoard.freeBoard_Num}</td>
							<td>
								<a href='/sub/freeboard/board_read?freeBoard_Num=${freeBoard.freeBoard_Num}'>${freeBoard.title}</a>
							</td>
							<td>${freeBoard.writer}</td>
							<td class="text-center">
								<fmt:formatDate pattern="yyyy-MM-dd" value="${freeBoard.regi_date}" />
							</td>
							<td class="text-center">
								<span>${freeBoard.view_count}</span>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="row">
					<div class="col-xs-12 text-center">
						<input class="btn btn-default" type="button" id="write_btn" value="글쓰기" onclick="location.href='/sub/freeboard/board_write'"></input>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-2"></div>
	</div>
</body>
<script>
	var result = '${msg}';

	if (result == 'success') {
		alert("해당글이 정상적으로 등록 되었습니다. 좋은 의견 감사합니다.");
	}
</script>
<%@ include file="../../include/footer.jsp"%>
