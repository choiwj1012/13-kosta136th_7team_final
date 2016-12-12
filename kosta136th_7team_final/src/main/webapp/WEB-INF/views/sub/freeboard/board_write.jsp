<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/header.jsp" %>


<head>
	<link rel="stylesheet" href="../../resources/css/board.css" />
	<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>	<!-- html editor -->
  	<script>tinymce.init({ selector:'textarea' });</script>		<!-- html editor -->
</head>

<body id="page-top"></body>

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
		
	         <!-- 글 쓰기 페이지 레이아웃 -->
	         <form action="" class="form-horizontal">
	         
	         	<!-- 제목 -->
	            <div class="form-group">
	               <h3><label for="title" class="col-sm-2">제목</label></h3>
	               <div class="col-sm-10">
	                  <input type="text" class="form-control input-lg" id="title">
	               </div>
	            </div>
	
				<!-- 내용 -->
	            <div class="form-group">
	               <h3><label for="content" class="col-sm-2">내용</label></h3>
	               <div class="col-sm-10">
	                  <textarea class="form-control" rows="5" id="content"></textarea>
	               </div>
	            </div>
	
	            <div class="buttons" align="right" id="buttons">
	               <button type="button" class="btn btn-primary" id="write_btn">등록</button>
	               <input type="button" class="btn btn-danger" id="boardList_btn" value="목록">
	            </div>
	
	         </form>
      </div>
      
       <!-- 우측  광고 영역 -->
      <div class="col-lg-3 sidebar visible-lg" align="right" >
      	<img class="side_img" src="https://dummyimage.com/300x800/333333/00e8cd&text=300x800+AD" alt="Holder image">
      </div>
   </div>


<%@ include file="../../include/footer.jsp" %>		