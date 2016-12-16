<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../../include/header.jsp" %>
<header>
	<link rel="stylesheet" href="../../../../resources/css/news.css" />
</header>

<%@ include file="../../include/grandNav.jsp" %>


<div class="container">
	
	<!-- 광고 배너 위치 -->
	<div class="row text-center" id="bannerImg">
		<img src="../../resources/img/banner.png" alt="광고" />
	</div>
			
	<!-- 인기기사 테이블 -->
	<c:if test = "${tab eq 'news/tab1'}">
	
		<div class="panel panel-blue text-center" id="favoriteWrapper">
			
			<div class="panel-heading" id="favoriteHeader">
				<h4>인기 국내기사 목록</h4>
			</div>
			
			<div class="panel-body pan" id="favoriteNewsWrapper">
			
				<c:forEach items="${demPopularNews}" var ="b" begin="0" end="2" varStatus="idx">
							
					<div class="col-sm-4" id="favoriteNewsTable">
					
						<div class="row" id="favorite_img">
							<img src="../../../../resources/img/news/${idx.index+10}.png" alt="인기기사 이미지" />
						</div>
						
						<div class="row">
							<a href = "${b.DOMESTIC_SCRAP_URL }" target="_blank">
								<p>${b.DOMESTIC_SCRAP_TITLE}</p>
							</a>
						</div>
						
					</div>
					
				</c:forEach>
			
			</div>
			
		</div>
		
	</c:if>
	
	<c:if test = "${tab eq 'tab1'}">
		
		<div class="row text-center">
			
			<h4>인기 국내기사 목록</h4>
		
			<c:forEach items="${demPopularNews}" var ="b" begin="0" end="2" varStatus="idx">	
				
				<div class="col-sm-4" id="favoriteNewsTable">
					
					<div class="col-sm-5">
						<img src="../../../../resources/img/news/${idx.index+10}.png" alt="" width = "100" height = "100"/>
					</div>
					
					<div class="col-sm-7">
						<a href = "${b.DOMESTIC_SCRAP_URL }" target="_blank"><p>${b.DOMESTIC_SCRAP_TITLE}</p></a>
					</div>
					
				</div>
				
			</c:forEach>
		
		</div>
		
	</c:if>
	
	<c:if test = "${tab eq 'tab2'}">
		
		<div class="row text-center">
			<h4>인기 해외기사 목록</h4>
		</div>
		
		<c:forEach items="${demPopularNews}" begin="0" end="2" var ="b">	
		
			<div class="col-sm-4" id="favoriteNewsTable">
			
				<div class="col-sm-5">
					<img src="${b.ABROAD_SCRAP_IMG_URL}" alt="" height = "100" width = "100" />
				</div>
				
				<div class="col-sm-7">
					<a href = "${b.ABROAD_SCRAP_URL }" target="_blank"><p>${b.ABROAD_SCRAP_TITLE}</p></a>
				</div>
				
			</div>
			
		</c:forEach>
		
	</c:if>
	<!-- ./favoriteNewsTable -->
		
	<div class="clearfix"></div>	
		
	<!-- keyword 검색 체크박스 -->
	<div class="row">					
		<div class="row text-center" id="searchNews">
			<h4>관련 기사 검색</h4>
			<div class="col-sm-offset-1 col-sm-10 col-sm-offset-1">
				<form role="form" action="">
					<div class="form-group">
						<input type="text" name ="searchKeyword" class="form-control" placeholder="검색할 키워드를 적어주세요" />
						<input type='hidden' name="page" value=1>
					</div>
					<button type="submit" class="btn btn-primary">검색하기</button>
				</form>
			</div>
		</div> <!-- ./ keyword(foreign) -->	
	</div>	
			
	<div class="row">
		
		<!-- main section -->
		<div class="col-md-9">
			
			<!-- 국내기사 // 해외기사 탭 -->
			<ul class="nav nav-tabs">
				<li><a href="/news/tab1?page=1" class="tablinks" onclick="openCity(event, 'korArticle')">국내기사</a></li>
  				<li><a href="/news/tab2?page=1" class="tablinks" onclick="openCity(event, 'engArticle')">해외기사</a></li>
			</ul>
					
			<!-- 국내기사  -->
			<div id="korArticle" class="tabcontent">
				
				<c:forEach items="${newsList}" var ="b" begin="0" end="9" varStatus="idx">
					
					<div class="row" id="newsTable">
				
						<div class="col-md-3" id="imgSrc">
							<img src= "../../../../resources/img/news/${idx.index}.png" alt="기사더미이미지" />
						</div>
						
						<div class="col-md-8" id="etcAttr">
							<h4><a href = "${b.link}" target="_blank">${b.title}</a></h4>
							<p>${b.pubDate }</p>
							<p>${b.description }</p>
						</div>
						
						<div class="col-md-1"></div>
													
					</div>
					
					<div class="row">
						<div class="col-md-8"></div>
						<div class="col-md-3">
							<button type="button" id="subscribeBtn2" class="btn btn-primary">스크랩하기</button>
						</div>
						<div class="col-md-1"></div>
					</div>
					
					<hr />
					
				</c:forEach>
							
			</div>
			
			<script>
           
                $(document).ready(function(){
                    
                    $(document).on('click', '#subscribeBtn2', function(){
                        
                       var imgSrc = $(this).parent().parent().children('#imgSrc').children('img').attr('src');
                       var link = $(this).parent().parent().children('#etcAttr').children(':eq(0)').children('a').attr('href');
                       var title =    $(this).parent().parent().children('#etcAttr').children(':eq(0)').children('a').text(); 
                       var pubDate = $(this).parent().parent().children('#etcAttr').children(':eq(1)').text();
                       var description = $(this).parent().parent().children('#etcAttr').children(':eq(2)').text(); 

                       korSubscribe(link, title, pubDate, description);
                    
                    });
                    
                });
                
           	</script>
           			
			<!-- 해외 기사  -->
			<div id="engArticle" class="tabcontent">

				<c:forEach items="${abrNewsList}" var ="b">
				
					<div class="row" id="newsTable">
					
						<div class="col-sm-3" id="imgSrc">
							<img src=${b.imgSrc} width="150" height="200" alt="" />
						</div>
						
						<div class="col-sm-8" id="etcAttr">
							<h4><a href = ${b.link} target="_blank">${b.title}</a></h4>
							<p>${b.date}</p>
							<p>${b.author}</p>
							<p>${b.description }</p>
						</div>
						
						<div class="col-sm-1"></div>
														
					</div>
					
					<div class="row">
					
						<div class="col-md-8"></div>
						<div class="col-sm-3">
							<button type="button" id="subscribeBtn" class="btn btn-primary">스크랩하기</button>
						</div>
						<div class="col-md-1"></div>
						
					</div>
					
					<hr />
					
				</c:forEach>
				
			</div>					

			<script>
			
	             $(document).ready(function(){
	            	 
	                 $(document).on('click', '#subscribeBtn', function(){
	                     
	                 	var imgSrc = $(this).parent().parent().children('#imgSrc').children('img').attr('src');
	                    var link = $(this).parent().parent().children('#etcAttr').children(':eq(0)').children('a').attr('href');
	                    var title =	$(this).parent().parent().children('#etcAttr').children(':eq(0)').children('a').text(); 
	                    var date = $(this).parent().parent().children('#etcAttr').children(':eq(1)').text(); 
	                    var author = $(this).parent().parent().children('#etcAttr').children(':eq(2)').text(); 
	                    var description = $(this).parent().parent().children('#etcAttr').children(':eq(3)').text(); 
	            	                    
	                    engSubscribe(imgSrc, link, title, date, author, description);
	                 
	                 });
	                 
	             });
	             
		    </script>
        	
			<!-- 페이징처리 -->		
			<div class="row text-center">
				<ul class="pagination">
					<c:if test = "${searchTF > 0}">
						<c:if test="${pageMaker.prev}">
							<li><a href="${tab}?searchKeyword=${searchKeyword}&page=${pageMaker.startPage - 1}">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="${tab}?searchKeyword=${searchKeyword}&page=${idx }&perPageNum=10">${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="${tab}?searchKeyword=${searchKeyword}&page=${pageMaker.endPage+1 }">&raquo;</a></li>
						</c:if>
					</c:if>
					<c:if test = "${searchTF == 0 }">
						<c:if test="${pageMaker.prev}">
							<li><a href="${tab}?page=${pageMaker.startPage - 1}">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
								<a href="${tab}?page=${idx }&perPageNum=10">${idx}</a>
							</li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="${tab}?page=${pageMaker.endPage+1 }">&raquo;</a></li>
						</c:if>
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
						<input type="email" id="email" placeholder="이메일 주소를 입력해 주세요">
					</div>
					<input type="submit" id="getEmailBtn" class="btn btn-primary" onclick="getEmail()" value = "구독신청하기"/>
				</form>
				
			</div> <!-- ./submitEmail -->
			
			<br />		
					
			
			 
			<!-- google adsense -->
			<div class="row text-center">
				<a href = "http://twice.jype.com/" target="_blank" ><img src="../../../../resources/img/news/sana.gif" width = "200" height = "200" alt="google adsense"/></a>
			</div>
			<div class="row text-center">
				<a href = "http://gall.dcinside.com/board/lists/?id=twice&page=" target="_blank" ><img src="../../../../resources/img/news/sana2.gif" width = "200" height = "200" alt="google adsense"/></a>
			</div>
		
		</div> <!-- ./side section -->
			
	</div> 
</div>

<script>
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
</script>
<script>


function engSubscribe(imgSrc, link, title, date, author, description)
{
	
	alert("외국기사스크랩버튼 클릭됨" + "\n"
			+ "imgsrc : " + imgSrc+ "\n" 
			+ "link : " + link+ "\n"
			+ "title : " + title + "\n"
			+ "date : " + date + "\n"
			+ "author : " + author + "\n"
			+ "description : " + description);
	
	$.ajax({
		type : 'post',
		url : '/addAbroadScrap',
		headers :{
			"Content-Type" : "application/json",
			"X-HTTP-Method_Overrride" : "POST",
		},
		dataType : 'text',
		data : JSON.stringify({
			imgSrc : imgSrc,
			link : link,
			title : title,
			date : date,
			author : author,
			description : description
		}),
		
	});
}

function korSubscribe(link, title, pubDate, description)
{
	alert("한국기사스크랩버튼 클릭됨" + "\n"
			+ "link : " + link + "\n"
			+ "title : " + title + "\n"
			+ "date : " + pubDate + "\n"
			+ "date : " + description);
	 $.ajax({
		type : 'post',
		url : '/addDemesticScrap',
		headers :{
			"Content-Type" : "application/json",
			"X-HTTP-Method_Overrride" : "POST",
		},
		dataType : 'text',
		data : JSON.stringify({
			link : link,
			title : title,
			pubDate : pubDate,
			description : description
		})
		
	});
}

function getEmail()
{
	var email = $("#email").val();
	var pattern = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if( pattern.test(email) ) 
	{
		alert("메일 주소가 올바르게 입력되었습니다." + email);
		$.ajax({
			type : 'post',
			url : '/getEmail',
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method_Overrride" : "POST",
			},
			dataType : 'text',
			data : JSON.stringify(email),
		});
	} 
	else 
	{
		alert("메일 주소가 유효하지 않습니다." + email);
	}
	
}
</script>
<%@ include file="../../include/footer.jsp" %>		