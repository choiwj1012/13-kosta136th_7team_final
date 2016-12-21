<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../../include/header.jsp" %>
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
			  <h3>korArticle</h3>
			</div>
			
			<div id="engArticle" class="tabcontent">
			  <h3>engArticle</h3>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
			var email = '<c:out value="${login.USER_EMAIL}"/>';
			alert("마이페이지 이메일 : " + email);
			$.ajax({
				type : 'GET',
				async : false,
				url : '/manageMyBoard',
				data : 
				{
					USER_EMAIL : email
					
				},
				dataType : 'text'
			});
	});
</script>

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



<%@ include file="../../include/footer.jsp" %>		