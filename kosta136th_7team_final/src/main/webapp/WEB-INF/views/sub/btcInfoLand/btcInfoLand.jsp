<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../include/header.jsp"%>

<head>
	<link rel="stylesheet" href="../../resources/css/btcInfoLand.css" />
	<script src="../../resources/js/imagesloaded.pkgd.min.js"></script>
	<script src="../../resources/js/wookmark.js"></script>
	<script src="../../resources/js/wookmarkCustomize.js"></script>
</head>

<%@ include file="../../include/grandNav.jsp"%>

<!-- title area -->
<div class="container">
	
	<div class="page-header">
		<h1>
			BTC 정보광장<small>_이달의 추천 딜러</small>
		</h1>
		<ul class="breadcrumb">
			<li>Home</li>
			<li>BTC정보광장</li>
			<li class="active">이달의 추천딜러</li>
		</ul>	
	</div>
		
	<div class="panel panel-default">
		<div class="panel-body">
			<span class="page_title">이달의 추천 딜러 |</span> <span>비트리버 회원이면
				누구나 전문 딜러로 활동 할 수 있습니다. 다양한 정보를 많은 회원들과 공유해 보시길 바랍니다.</span>
		</div>
	</div>
		
	<!-- 검색 -->
	<div class="search_group">
		<div class="form-group col-xs-2">
			<select name="searchType" class="form-control" id="sel1">
				<option value = "n">선택</option>
				<option value = "w">딜러명</option>
				<option value = "t">제목</option>
			</select>
		</div>
		<form>
			<div class="input-group col-xs-6">
				<input type="text" name="keyword" id="keywordInput" class="form-control" placeholder="Search">
				<div class="input-group-btn">
					<button class="btn btn-default" id="searchBtn" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				<button class="btn btn-default" id="newBtn" type="submit">
					딜러 페이지 등록
				</button>
				</div>
			</div>
		</form>
	</div>

</div>

<!-- API TEST -->
<div role="main">

	<ul id="container" class="tiles-wrap animated listToChange">
		<c:forEach items="${list}" var = "dealer">
			<li class = "scrolling" data-dno="${dealer.dealer_page_num}">${dealer.dealer_page_num}</li>
			<li>${dealer.user_nickName}</li>
			<li>${dealer.category}</li>
			<li>${dealer.like_count}</li>
		</c:forEach>
	</ul>
	
	<div id="loader">
	  <div id="loaderCircle"></div>
	</div>

</div>

	<%@ include file="../../include/chatting.jsp" %>
	</body>
</html>
