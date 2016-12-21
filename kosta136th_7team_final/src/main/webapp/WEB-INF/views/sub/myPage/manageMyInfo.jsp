<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../../include/header.jsp" %>
<header>
	<link rel="stylesheet" href="../../../resources/css/myPage.css" />
	<style>
		#manage_wrapper{
			min-height:1000px;
		}
	</style>
</header>
<%@ include file="../../include/grandNav.jsp" %>


<div class="container" id="manage_wrapper">

  <div class="page-header">
	<h1>My Page</h1>  
  </div>
	  	
  <div class="row">
    
    <h2 class="text-center">내 정보를 확인해 주세요 <small> 비밀번호는 자주 변경해 주시는 것이 좋습니다</small></h2>
    
    <br />
    
    <div class="col-sm-3">
    	<ul>
    		<li><a href="/manageMyBoard">스크랩 기사목록</a></li>
    		<li><a href="/manageMyInfo">회원정보 관리</a></li>
    	</ul>  
    </div>

    <div class="col-sm-9">
    
      <div class="row">
		
		<!-- 회원정보수정 // 딜러정보수정 -->
		<ul class="nav nav-tabs">
			<li class="active"><a href="#">닉네임 변경</a></li>
			<li class=""><a href="">비밀번호 변경</a></li>
		</ul>
		
		<br />
			
 		<form class="form-horizontal text-left">
   		
	   		<div class="form-group">
	     		<label class="control-label col-md-2" for="email">현재 Email</label>
	     		<div class="col-md-9">
	       			<p class="form-control-static">someone@example.com</p>
	     		</div>
	     		<div class="col-md-1"></div>
	   		</div>
	   		
	   		<div class="form-group">
	     		<label class="control-label col-md-2" for="email">현재 닉네임</label>
	     		<div class="col-md-9">
	       			<p class="form-control-static">someone@example.com</p>
	     		</div>
	     		<div class="col-md-1"></div>
	   		</div>
	   		
	   		<div class="form-group">
	     		<label class="control-label col-md-2" for="nickname">변경할 닉네임</label>
	     		<div class="col-md-9">
	       			<input type="text" class="form-control" id="nickname" placeholder="변경할 닉네임을 입력하세요">
	     		</div>
	     		<div class="col-md-1"></div>
	   		</div>
	   		   		
	   		<div class="form-group text-center">             		
	     		<div class="col-md-12">
	       			<button type="submit" class="btn btn-primary">닉네임 변경하기</button>
	     		</div>    		     		
	   		</div>
   		
 		</form>
 		
 		<br />
 		
 		<!-- 비밀번호 변경 탭 -->
 		<form class="form-horizontal text-left">
 		
 			<div class="form-group">
	     		<label class="control-label col-md-2" for="password">현재 비밀번호 입력</label>
			    <div class="col-md-9">         
	       			<input type="password" class="form-control" id="password" placeholder="현재 비밀번호를 입력하세요">
	     		</div>
	     		<div class="col-md-1"></div>
	   		</div>
	   		
	   		<div class="form-group">
	     		<label class="control-label col-md-2" for="new_password">새 비밀번호 입력</label>
			    <div class="col-md-9">          
	       			<input type="password" class="form-control" id="new_password" placeholder="변경할 비밀번호를 입력하세요">
	     		</div>
	     		<div class="col-md-1"></div>
	   		</div>
	   		
	   		<div class="form-group">
	     		<label class="control-label col-md-2" for="new_password">비밀번호 재입력</label>
			    <div class="col-md-9">          
	       			<input type="password" class="form-control" id="new_password" placeholder="변경할 비밀번호를 입력하세요">
	     		</div>
	     		<div class="col-md-1"></div>
	   		</div>
 		
 			<div class="form-group text-center">             		    		
	     		<div class="col-md-12">
	       			<button type="submit" class="btn btn-primary">비밀번호 변경하기</button>
	     		</div>     		
	   		</div>
 		
 		</form>
 			
      </div>
      
    </div>
         
  </div>
  
</div>

<%@ include file="../../include/footer.jsp" %>		