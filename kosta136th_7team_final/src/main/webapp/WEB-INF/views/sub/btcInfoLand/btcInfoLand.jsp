<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../include/header.jsp"%>

<head>
	<link rel="stylesheet" href="../../resources/css/btcInfoLand.css" />
	<style type="text/css">
		#imgtest > div > a > img{
			width : 100%;
			height : 100%;
		}
	</style>
	
	<c:if test="${not empty login}">
		<script>
			//로그인 되어 있으면
			var login = '${login.USER_EMAIL}';
		</script>
	</c:if>

	<c:if test="${empty login}">
		<script>
			//로그인 안 되 있으면
			var login = null;
		</script>
	</c:if>
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
				<option value = "n" <c:out value="${cri.searchType == null?'selected':''}"/> >선택</option>
				<option value = "w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/> >딜러명</option>
				<option value = "t" <c:out value="${cri.searchType eq 't'?'selected':''}"/> >제목</option>
			</select>
		</div>
			<div class="input-group col-xs-6">
				<input type="text" name="keyword" id="keywordInput" class="form-control" placeholder="Search" value='${cri.keyword}'>
				<div class="input-group-btn">
					<button class="btn btn-default" id="searchBtn" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>

				</div>
			</div>
	</div>

</div>

<!-- API TEST -->
<div role="main">

	<div id="container" class = "row">
		
		<c:forEach items="${list}" var="dealer" varStatus="idx">
		<div id="imgtest" class="col-sm-4">
			<div class="panel panel-default"> 
			<a href='btcInfoLand_board_list${pageMaker.makeSearch(pageMaker.cri.page)}&dealer_page_num=${dealer.dealer_page_num}'><img src="../../../../resources/img/dealer/${idx.index+10}.jpg" alt="프로필 사진 더미" /></a>
			<p>${dealer.user_nickName}</p>
			<p><a href='btcInfoLand_board_list${pageMaker.makeSearch(pageMaker.cri.page)}&dealer_page_num=${dealer.dealer_page_num}'>${dealer.category}</a></p>
			<p>${dealer.like_count}</p>								
			</div>
		</div>
		</c:forEach>
					
	</div>
	
	<div class="box-footer">

		<div class="text-center">
			<ul class="pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="btcInfoLand${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="btcInfoLand${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="btcInfoLand${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>

	</div>
	<!-- /.box-footer-->
	
	<div id="loader">
	  <div id="loaderCircle"></div>
	</div>

</div>

	<%@ include file="../../include/chatting.jsp" %>
	</body>
</html>

<script>
	$(document).ready(function(){
																	
		//딜러 페이지 존재 여부, 로그인 여부에 따라 버튼을 생성하는 메서드
		$.ajax({
			url: "/sub/btcInfoLand/dealerMyPage",
			type: 'get',
			data: {"login" : login},
			success:  function (data) {
				if(data != null){
					$('.input-group').append('<button id = "mypage" class="btn btn-default">내 딜러 페이지</button>');
				}
			},  
		    error:function(e){
		    	if(login != null) {
					$('.input-group').append('<button class="btn btn-default" id="newBtn">딜러 페이지 등록</button>');
				} 
		    }  
									
			});
	});
	</script>


<script>
	var result = '${result}';

	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	} else if(result =='false') {
		alert("딜러가 아니거나 딜러페이지가 존재합니다.")
	}
</script>

<script>
	$(document).ready(
			
			function() {

				$('#searchBtn').on("click",function(event) {

						self.location = "btcInfoLand"
								+ '${pageMaker.makeQuery(1)}'
								+ "&searchType="
								+ $("select option:selected").val()
								+ "&keyword=" + $('#keywordInput').val();

				});

				$('body').on("click", '#newBtn', function(event) {

					self.location = "dealerPageSave";

				});
				
				$('body').on("click", '#mypage', function(event) {

						$.ajax({
								url: "/sub/btcInfoLand/dealerMyPage",
								type: 'get',
								data: {"login" : login},
								success:  function (data) {
									if(data == null) {
										alert("생성하신 딜러페이지가 없습니다.");
										self.location = "dealerPageSave";
									} else if(data != null){
									self.location = "btcInfoLand_board_list?dealer_page_num=" + data;
									}
								}
									
							});

				});
	});
	

</script>