<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="../../include/header.jsp"%>


<head>
<link rel="stylesheet" href="../../../resources/css/board.css" />
</head>

<section class="content">


	<!-- 보드페이지 상단 이미지 -->



	<div class="row content">

		<!-- 좌측 채팅창 영역 -->
		<div class="col-lg-3 visible-lg" align="left">
			<img class="side_img" src="https://dummyimage.com/300x800"
				alt="Holder image">
		</div>


		<!-- 중앙 게시판 영역 -->
		<div class="box-body">
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
						<td>${freeboard.freeBoard_Num}</td>
						<td><a
							href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&bno=${freeboard.freeBoard_Num}'>
								${freeboard.title}</a></td>
						<td>${freeboard.writer}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
								value="${freeboard.regdate}" /></td>
						<td><span class="badge bg-red">${freeboard.viewcnt }</span></td>
					</tr>

				</c:forEach>

			</table>
		</div>


		<!-- pagination -->
		iv class="box-footer">

		<div class="text-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>


		<div class="text-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a href="${pageMaker.startPage - 1}">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="${idx}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a href="${pageMaker.endPage +1}">&raquo;</a></li>
				</c:if>

			</ul>
		</div>


	</div>

	<!-- 찾기 -->

	<!-- write btn -->


	<!-- 우측  광고 영역 -->
	<div class="col-lg-3 sidebar visible-lg" align="right">
		<img class="side_img"
			src="https://dummyimage.com/300x800/333333/00e8cd&text=300x800+AD"
			alt="Holder image">
	</div>
</section>

<form id="jobForm">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}

	$(".pagination li a").on("click", function(event) {

		event.preventDefault();

		var targetPage = $(this).attr("href");

		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/freeboard/board_listPage").attr("method", "get");
		jobForm.submit();
	});
</script>




<%@ include file="../../include/footer.jsp"%>
