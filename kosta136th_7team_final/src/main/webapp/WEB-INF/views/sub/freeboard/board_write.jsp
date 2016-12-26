<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>
<%@ include file="../../include/grandNav.jsp"%>
<head>
<link rel="stylesheet" href="../../resources/css/board.css" />
<div class="container-fluid">
	<!-- 보드페이지 상단 이미지 -->
	<div class="row">
		<div class="location_bg"></div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="row page-header">
			<h1>자유게시판</h1>
			<ul class="breadcrumb">
				<li><a href="/">Home</a></li>
				<li class="active">자유게시판</li>
			</ul>
		</div>
	</div>
	<!-- 중앙 게시판 영역 -->
	<div class="col-lg-2"></div>
	<div class="col-lg-8" align="center">
		<form role="form" method="post" action="/sub/freeboard/board_write">
			<div class="box-body">
				<div class="form-group">
					<label for="exampleInputEmail1">제목</label>
					<input type="text" name='title' class="form-control" placeholder="제목을 입력해 주세요.">
					<label for="exampleInputPassword1">내용</label>
					<textarea class="form-control" name="content" rows="10" placeholder="내용을 입력해 주세요."></textarea>
				</div>
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<button type="submit" class="btn btn-primary">글작성</button>
			</div>
		</form>
	</div>
	<div class="col-lg-2"></div>
</div>
<%@ include file="../../include/footer.jsp"%>