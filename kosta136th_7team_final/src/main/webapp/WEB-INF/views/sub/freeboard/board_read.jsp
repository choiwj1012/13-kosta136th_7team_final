<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/header.jsp" %>


<head>
	<link rel="stylesheet" href="../../resources/css/board.css" />
</head>

<body id="page-top">

	<!-- 보드페이지 상단 이미지 -->
	<div id="main_img">
		<div class="row">
			<div class="col-lg-3 visible"></div>
		</div>
		<%@ include file="../../include/grandNav.jsp" %>		
	</div>
	
	
	
      <div class="row content">

		<!-- 좌측 채팅창 영역 -->
		<div class="col-lg-3 visible-lg" align="left">
			<img class="side_img" src="https://dummyimage.com/300x800//f3f3f3/00e8cd&text=300x800/+chat" alt="Holder image">
		</div>


		<!-- 중앙 게시판 영역 -->
		<div class="col-lg-6" align="center">
			<!-- 광고이미지 -->
			<img class="center_img" src="../../resources/img/AD.gif" alt="Holder image">
        	 <!-- center side article -->
			<form action="" class="form-horizontal" align="left">
			 
		        <div class="form-group">
		        	<!-- 글 제목이 삽입됨 -->
		        	<h1>안녕하세요 첫글입니다.!</h1>
		        </div>
		        
		        
		         <div class="form-group">
		        	<!-- 글 작성일이 삽입됨 -->
		        	<h5>O 2016-12-03 금 13:02</h5>
		        </div>
		
		        <div class="form-group">
		        	<!-- 글 작성자가 삽입됨 -->
		        	<h5>by. 박성용</h5>
		        </div>
		
		
		        <div class="form-group">
		          <label for="content" class="col-sm-2">내용:</label>
		          <!-- <input type="content" class="form-control" id="content"> -->
		          <div class="col-sm-10">
		            <!-- 글 내용이 들어 갑니다. -->
		          </div>
		        </div>
		
		        <div class="buttons" align="right" id="buttons">
		          <button type="submit" class="btn btn-warning" onclick="location.href='/board_update'">수정</button>	<!-- ++ -->
		          <button type="submit" class="btn btn-danger">삭제</button>
		          <button type="button" class="btn btn-primary" onclick="location.href='/board_list'">목록</button><!-- ++ -->
		        </div>
		
	      </form>
       </div>
       <!-- 우측  광고 영역 -->
      <div class="col-lg-3 sidebar visible-lg" align="right" >
      	<img class="side_img" src="https://dummyimage.com/300x800/333333/00e8cd&text=300x800+AD" alt="Holder image">
      </div>
   </div>
 
</body>

<%@ include file="../../include/footer.jsp" %>		