<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../../include/header.jsp"%>


<head>
<link rel="stylesheet" href="../../../resources/css/board.css" />
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
			<img class="side_img" src="https://dummyimage.com/300x800"
				alt="Holder image">
		</div>


		<!-- 중앙 게시판 영역 -->
		<div class="col-lg-6" align="center">
			<!-- 광고이미지 -->
			<img class="center_img" src="../../../resources/img/AD.gif"
				alt="Holder image">
			<!-- center side article -->
			<div id="first_board">
				<br>
				<table class="table table-bordered">
					<tr>
						<th style="width: 10px">FREEBOARD_NUM</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>REGDATE</th>
						<th style="width: 40px">VIEWCNT</th>
					</tr>

					<c:forEach items="${board_list}" var="freeboard">

						<tr>
							<td>${freeBoard.freeBoard_Num}</td>
							<td><a href='/freeboard/board_read?freeBoard_Num=${freeBoard.freeBoard_Num}'>${freeBoard.title}</a></td>
							<td>${freeBoard.writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
									value="${freeboard.regdate}" /></td>
							<td><span class="badge bg-red">${freeBoard.viewcnt }</span></td>
						</tr>

					</c:forEach>

				</table>


				<div class="row">
					<div class="col-xs-12" align="right">

						<input class="btn btn-primary" type="button" id="write_btn"
							value="글쓰기" onclick="location.href='/sub/freeboard/write'"></input>
					</div>
				</div>


				<!-- pagination -->
				
				<!-- 찾기 -->

				<!-- write btn -->
				

					

				</div>
			</div>
		</div>

		<!-- 우측  광고 영역 -->
		<div class="col-lg-3 sidebar visible-lg" align="right">
			<img class="side_img"
				src="https://dummyimage.com/300x800/333333/00e8cd&text=300x800+AD"
				alt="Holder image">
		</div>
	
</body>

<script>
    
    var result = '${msg}';
    
    if(result == 'success'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>

<%@ include file="../../include/footer.jsp"%>
