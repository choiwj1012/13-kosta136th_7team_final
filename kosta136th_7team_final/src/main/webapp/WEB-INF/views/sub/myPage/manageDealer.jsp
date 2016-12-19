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
    		<li><a href="/myPage">스크랩 기사목록</a></li>
    		<li><a href="/manageMyBoard">나의 댓글 관리</a></li>
    		<li><a href="/manageMyInfo">회원정보 관리</a></li>
    		<li><a href="/manageDealer">딜러정보 관리</a></li>
    		<li><a href="/withDraw">회원탈퇴</a></li>
    	</ul>  
    </div>

    <div class="col-sm-9">
      <div class="row">
      
      
      </div>
	
	</div>
         
  </div>
  
</div>

<%@ include file="../../include/footer.jsp" %>