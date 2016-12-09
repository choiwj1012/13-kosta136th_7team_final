<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>


<head>
	<link rel="stylesheet" href="../../resources/css/board.css" />
</head>

<body id="page-top">

	<!-- 보드페이지 상단 이미지 -->
	<div id="main_img">
		<div class="row">
			<div class="col-lg-3 visible"></div>
		</div>
		<%@ include file="../include/grandNav.jsp" %>		
	</div>
	
	
	
      <div class="row content">

		<!-- 좌측 채팅창 영역 -->
		<div class="col-lg-3 visible-lg" align="left">
			<img class="side_img" src="https://dummyimage.com/300x800" alt="Holder image">
		</div>


		<!-- 중앙 게시판 영역 -->
		<div class="col-lg-6" align="center">
			<!-- 광고이미지 -->
			<img class="center_img" src="../../resources/img/AD.gif" alt="Holder image">
        	 <!-- center side article -->
	         <div id="first_board">
	            <br>
	            <table class="table table-hover">
	               <thead>
	                  <tr>
	                     <th>번호</th>
	                     <th id = "title_title">제목</th>
	                     <th>작성자</th>
	                     <th>조회수</th>
	                  </tr>
	               </thead>
	               <tbody>
	              	  <tr>
	                     <th>1</th>
	                     <th id = "title_title"><a href="/board_read">안녕안녕</a></th>
	                     <th>박성용</th>
	                     <th>255</th>
	                  </tr>
	                  <tr>
	                     <th>2</th>
	                     <th id = "title_title">안녕안녕하세요</th>
	                     <th>박성용</th>
	                     <th>255</th>
	                  </tr>
	                  <tr>
	                     <th>3</th>
	                     <th id = "title_title">비트리버임당</th>
	                     <th>조현우</th>
	                     <th>3</th>
	                  </tr>
	                  <tr>
	                     <th>4</th>
	                     <th id = "title_title">비트리버임당</th>
	                     <th>조현우</th>
	                     <th>3</th>
	                  </tr>
	                  <tr>
	                     <th>5</th>
	                     <th id = "title_title">비트리버임당</th>
	                     <th>조현우</th>
	                     <th>3</th>
	                  </tr>
	              	 <!-- tr 값이 삽입됩니다. -->
	               </tbody>
	            </table>
	
	            <div class="row">
	               <div class="col-xs-12" align="right">
	
	                  <input class="btn btn-primary" type="button" id="write_btn" value="글쓰기" onclick="location.href='/board_write'"></input>		
	               </div>
	            </div>
	
	
	            <!-- pagination -->
	            <div class="row text-center">
	               <!-- <button class="btn btn-primary btn-left pull-left" type="submit"><a href="#first_article" class="submit_btn">목록</a></button> -->
	
	               <ul class="pagination">
	                  <li class="previous"><a href="#">Previous</a></li>
	                  <li class="active"><a href="#">1</a></li>
	                  <li><a href="#">2</a></li>
	                  <li><a href="#">3</a></li>
	                  <li><a href="#">4</a></li>
	                  <li><a href="#">5</a></li>
	                  <li><a href="#">6</a></li>
	                  <li><a href="#">7</a></li>
	                  <li><a href="#">8</a></li>
	                  <li><a href="#">9</a></li>
	                  <li><a href="#">10</a></li>
	                  <li class="next"><a href="#">Next</a></li>
	               </ul>
	            </div>
	            <!-- 찾기 -->
	
	            <!-- write btn -->
	            <div class="row text-center">
	               <div class="col-lg-4">
	                  <form class="form-inline">
	
	                     <ul class="nav navbar-nav navbar-right">
	                        <li class="dropdown">
	                           <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                      		  글쓴이<span class="caret"></span>
	                    		</a>
	                           <ul class="dropdown-menu">
	                              <li><a href="#">글제목</a></li>
	                              <li><a href="#">글내용</a></li>
	                              <li><a href="#">글쓴이+글제목</a></li>
	                           </ul>
	                        </li>
	                     </ul>
	                  </form>
	               </div>
	               
	               <div class="col-lg-4">
	                  <input type="text" id="searchBar" class="form-control text-left" size="50" placeholder="찾으시는 글 또는 작성자를 입력해주세요." required>
	               </div>
	               <div class="col-lg-4 searchButton">
	                  <a href="#" class="btn btn-default btn-lg pull-left">
	                     <span class="glyphicon glyphicon-search"></span> 찾기
	                  </a>
	                  
	               </div>
	               
	            </div>
	         </div>
      </div>
      
      <!-- 우측  광고 영역 -->
      <div class="col-lg-3 sidebar visible-lg" align="right" >
      	<img class="side_img" src="https://dummyimage.com/300x800/333333/00e8cd&text=300x800+AD" alt="Holder image">
      </div>
   </div>
</body>

<%@ include file="../include/footer.jsp" %>		