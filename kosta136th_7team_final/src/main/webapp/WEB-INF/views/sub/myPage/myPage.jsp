<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../../include/header.jsp" %>
<header>
	<link rel="stylesheet" href="../../../resources/css/myPage.css" />
</header>
<%@ include file="../../include/grandNav.jsp" %>

<section>
 
  <div class="container">
    
    <div class="row">
      
      <div class="col-sm-3">
      
      	<div class="page-header">
      		<h1>My Page</h1>
    	</div>
      
      	<ul>
      		<li><a href="/manageMyBoard">나의 스크랩 기사목록</a></li>
    		<li><a href="/manageMyInfo">회원정보 관리</a></li>
      	</ul>
      	  
      </div>

      <div class="col-sm-9">
      
        <div class="row">
        	
        	<h2>${login.USER_EMAIL}님의 마이페이지</h2>
        
       
        </div><!-- ./row -->

      </div>
    </div>
  </div>
</section>


<%@ include file="../../include/footer.jsp" %>		