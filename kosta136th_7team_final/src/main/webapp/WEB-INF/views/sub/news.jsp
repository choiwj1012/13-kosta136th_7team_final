<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="../include/header.jsp" %>
<header>
	<link rel="stylesheet" href="../../resources/css/news.css" />
</header>
<%@ include file="../include/grandNav.jsp" %>





<div class="container">

	<div class="row">
		
		<!-- main section -->
		<div class="col-md-9">
			
			<form action="newsList.do"></form>
			<!-- 배너 및 광고 -->
			<div class="row text-center" id="bannerImg">
				<img src="../../resources/img/banner.png" alt="banner" />
			</div>
			
			
			<!-- 국내기사 // 해외기사 탭 -->
			<ul class="nav nav-tabs">
				<li><a href="/news/tab1" class="tablinks" onclick="openCity(event, 'korArticle')" id="defaultOpen">국내기사</a></li>
  				<li><a href="/news/tab2" class="tablinks" onclick="openCity(event, 'engArticle')">해외기사</a></li>
			</ul>
			<div id="engArticle" class="tabcontent">
				<c:forEach items="${abrNewsList}" var ="b">
					<div class="row" id="newsTable">
						<div class="col-sm-3">
							<img src=${b.imgSrc} width="150" height="200" alt="" />
						</div>
						<div class="col-sm-7">
							<h3><a href = ${b.link} target="_blank">${b.title}</a></h3>
							<p>${b.date }</p>
							<p>${b.author}</p>
							<p>${b.description }</p>
						</div>
						<div class="col-sm-2">
							<button type="button" id="subscribeBtn" class="btn btn-primary">구독하기</button>
						</div>				
					</div>
				</c:forEach>
			</div>					

			<div id="korArticle" class="tabcontent">
				<c:forEach items="${newsList}" var ="b">
					<div class="row" id="newsTable">
						<div class="col-sm-3">
							<img src="https://dummyimage.com/130x130" alt="" />
						</div>
						<div class="col-sm-7">
							<h3><a href = ${b.link} target="_blank">${b.title}</a></h3>
							<p>${b.pubDate }</p>
							<p>${b.description }</p>
						</div>
						<div class="col-sm-2">
							<button type="button" id="subscribeBtn" class="btn btn-primary">구독하기</button>
						</div>			
					</div>
				</c:forEach>
			</div>
			<div class="row text-center">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="${tab}?page=${pageMaker.startPage - 1}">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${tab}?page=${idx }">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="${tab}?page=${pageMaker.endpage+1 }">&raquo;</a></li>
							</c:if>
						</ul>
			</div>
		</div> <!-- ./main section -->
		
		
		<!-- side section -->
		<div class="col-md-3" id="side">
			
			<!-- 구독신청 -->
			<div class="text-center" id="submitEmail">
				<h4>지금 최신정보를 받아보세요 !</h4>				
				<form role="form">
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일 주소를 입력해 주세요">
					</div>
					<button type="submit" class="btn btn-primary"> 구독신청하기 </button>
				</form>
			</div> <!-- ./submitEmail -->
			
			<br />		
			
			<!-- keyword 검색 체크박스 -->				
			<div class="row text-center" id="searchNews"> <!-- 해외기사 -->
				
				<h4>관련 기사 검색</h4>
				
				<div class="col-sm-offset-1 col-sm-10 col-sm-offset-1">
					<form role="form" action="">
				
						<div class="form-group">
							<input type="text" class="form-control" placeholder="검색할 키워드를 적어주세요" />
						</div>
					
						<button type="submit" class="btn btn-primary">검색하기</button>
					
					</form>
				</div>
				
			</div> <!-- ./ keyword(foreign) -->
			
			
			<!-- 인기기사 테이블 -->
			<div class="row text-center">
				<h4> 주요 인기 기사 목록</h4>
			</div>
					
			<div class="row" id="favoriteNewsTable">
				
				<div class="col-sm-5">
					<img src="https://dummyimage.com/100x100" alt="" />
				</div>
				
				<div class="col-sm-7">
					<p>기사내용 기사내용 기사내용</p>
				</div>
				
			</div> <!-- ./favoriteNewsTable -->
			
			
			<!-- 인기기사 테이블 -->			
			<div class="row" id="favoriteNewsTable">
				
				<div class="col-sm-5">
					<img src="https://dummyimage.com/100x100" alt="" />
				</div>
				
				<div class="col-sm-7">
					<p>기사내용 기사내용 기사내용</p>
				</div>
				
			</div> <!-- ./favoriteNewsTable -->
			
			
			<!-- 인기기사 테이블 -->			
			<div class="row" id="favoriteNewsTable">
				
				<div class="col-sm-5">
					<img src="https://dummyimage.com/100x100" alt="" />
				</div>
				
				<div class="col-sm-7">
					<p>기사내용 기사내용 기사내용</p>
				</div>
				
			</div> <!-- ./favoriteNewsTable -->
			
			
			<!-- 인기기사 테이블 -->			
			<div class="row" id="favoriteNewsTable">
				
				<div class="col-sm-5">
					<img src="https://dummyimage.com/100x100" alt="" />
				</div>
				
				<div class="col-sm-7">
					<p>기사내용 기사내용 기사내용</p>
				</div>
				
			</div> <!-- ./favoriteNewsTable -->
			
			
			<!-- 인기기사 테이블 -->			
			<div class="row" id="favoriteNewsTable">
				
				<div class="col-sm-5">
					<img src="https://dummyimage.com/100x100" alt="" />
				</div>
				
				<div class="col-sm-7">
					<p>기사내용 기사내용 기사내용</p>
				</div>
				
			</div> <!-- ./favoriteNewsTable -->
			
			
			<!-- google adsense -->
			<div class="row text-center">

				<img src="https://dummyimage.com/200x600" alt="google adsense" />
			</div>
		
		</div> <!-- ./side section -->
			
	</div> 
</div>
<script type="text/javascript">

function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the link that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
<form id="jobForm">
<input type='hidden' name="page" value=${pageMaker.cri.perPageNum}>
<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
</form>


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
	
	$(".pagination li a").on("click", function(event){
		
		event.preventDefault(); 
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action","/board/listPage").attr("method", "get");
		jobForm.submit();
	});
	
</script>

<!-- <script>
	document.getElementById("defaultOpen").click();
</script> -->


<%@ include file="../include/footer.jsp" %>		