<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../../include/header.jsp" %>
<header>
	<link rel="stylesheet" href="../../../../resources/css/news.css" />
</header>
<style>
	#manage_wrapper{
		min-height:1000px;
	}	
</style>
<%@ include file="../../include/grandNav.jsp" %>

<div class="container" id="manage_wrapper">

  <div class="page-header">
    <h1>My Page</h1>
  </div>

  <div class="row">
    
    <div class="col-sm-3">
    	<ul>
    		<li><a href="/manageMyBoard">스크랩 기사목록</a></li>
    		<li><a href="/manageMyInfo">회원정보 관리</a></li>
    	</ul>  
    </div>
		<div class="col-sm-9">
			<ul class="nav nav-tabs">
			  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'korArticle')" id="defaultOpen">국내기사</a></li>
			  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'engArticle')">해외기사</a></li>
			</ul>
			<div id="korArticle" class="tabcontent">
			
			<c:forEach items="${demScrapList}" var ="b" begin="0" varStatus="idx">
			
				<div class="row">
				
					<div class="row" id="newsTable">
						<div class="col-md-3" id="imgSrc">
							<img src= ${b.DOMESTIC_SCRAP_IMGSRC } alt="기사더미이미지" />
						</div>
						
						<div class="col-md-8" id="etcAttr">
							<h3><a href = "${b.DOMESTIC_SCRAP_URL}" target="_blank">${b.DOMESTIC_SCRAP_TITLE}</a></h3>
							<p>${b.DOMESTIC_SCRAP_PUBDATE }</p>
							<p>${b.DOMESTIC_SCRAP_DESCRIPTION }</p>
						</div>
						
						<div class="col-md-1"></div>
													
					</div>
				
					<div class="row">
					
						<div class="col-md-9"></div>
						
						<div class="col-md-2">
							<button type="button" id="subscribeBtn2" class="btn btn-primary">스크랩하기</button>
						</div>
						
						<div class="col-md-1"></div>
					</div>
					
					<hr/>
					
				</div>
						
			</c:forEach>
						
		</div>
		
		<script>
          
	        $(document).ready(function(){
	            
	            $(document).on('click', '#subscribeBtn2', function(){
	                
				var imgSrc = $(this).parent().parent().parent().children("#newsTable").children('#imgSrc').children('img').attr('src');
                   var link = $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(0)').children('a').attr('href');
                   var title =    $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(0)').children('a').text(); 
                   var pubDate = $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(1)').text();
                   var description = $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(2)').text(); 
                   
                   korSubscribe(link, title, pubDate, description);
	            
	            });
	            
	        });
               
        </script>
			
			
			
			
			<!-- 해외 기사  -->
		<div id="engArticle" class="tabcontent">

			<c:forEach items="${abrScrapList}" var ="b">
			
				<div class="row">
				
					<div class="row" id="newsTable">
				
						<div class="col-sm-3" id="imgSrc">
							<img src=${b.ABROAD_SCRAP_IMG_URL} width="150" height="200" alt="" />
						</div>
						
						<div class="col-sm-8" id="etcAttr">
							<h3><a href = ${b.ABROAD_SCRAP_URL} target="_blank">${b.ABROAD_SCRAP_TITLE}</a></h3>
							<p>${b.ABROAD_SCRAP_PUBDATE}</p>
							<p>${b.ABROAD_SCRAP_WRITER}</p>
							<p>${b.ABROAD_SCRAP_DESCRIPTION }</p>
						</div>
						
						<div class="col-sm-1"></div>
														
					</div>
					
					<div class="row">
					
						<div class="col-md-9"></div>
						<div class="col-sm-2">
							<button type="button" id="subscribeBtn" class="btn btn-primary">스크랩하기</button>
						</div>
						<div class="col-md-1"></div>
						
					</div>
					
					<hr/>
				
				</div>		
				
			</c:forEach>
			
		</div>					

		<script>
		
             $(document).ready(function(){
            	 
                 $(document).on('click', '#subscribeBtn', function(){
                     
                	 var imgSrc = $(this).parent().parent().parent().children("#newsTable").children('#imgSrc').children('img').attr('src');
                     var link = $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(0)').children('a').attr('href');
                     var title =    $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(0)').children('a').text(); 
                     var date = $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(1)').text(); 
                     var author = $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(2)').text(); 
                     var description = $(this).parent().parent().parent().children("#newsTable").children('#etcAttr').children(':eq(3)').text(); 
                    
                     
                     engSubscribe(imgSrc, link, title, date, author, description);
                 
                 });
                 
             });
             
	    </script>
		</div>
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
	
	document.getElementById("defaultOpen").click();
</script>
<script>

	function korSubscribe(link, title, pubDate, description)
	{
		var email = '<c:out value="${login.USER_EMAIL}"/>';
		if(email == '')
		{
			alert("로그인을 해주세요");
		}
		else
		{
			 $.ajax({
				type : 'post',
				url : '/addDemesticScrap',
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method_Overrride" : "POST",
				},
				dataType : 'text',
				data : JSON.stringify({
					email : email,
					link : link,
					title : title,
					pubDate : pubDate,
					description : description
				}),
				success : function(data) {
			    	if(data == "true")
		    		{
		    			alert("스크랩 성공");
		    		}
			    	else
		    		{
		    			alert("스크랩 삭제")
		    		}
			    }
				
			});
		}
		
	}

	function engSubscribe(imgSrc, link, title, date, author, description)
	{
		var email = '<c:out value="${login.USER_EMAIL}"/>';
	
		if(email == '')
		{
			alert("로그인을 해주세요");
		}
		else
		{
			$.ajax({
				type : 'post',
				url : '/addAbroadScrap',
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method_Overrride" : "POST",
				},
				dataType : 'text',
				data : JSON.stringify({
					email : email,
					imgSrc : imgSrc,
					link : link,
					title : title,
					date : date,
					author : author,
					description : description
				}),
				success : function(data) {
			    	if(data == "true")
		    		{
		    			alert("스크랩 성공");
		    		}
			    	
			    	else
		    		{
		    			alert("스크랩 삭제");
		    		}
			    }
				
				
			});
		}
		
	}
</script>


<%@ include file="../../include/footer.jsp" %>		