<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>
<header>
	<link rel="stylesheet" href="../../resources/css/myPage.css" />
</header>
<%@ include file="../include/grandNav.jsp" %>


<div class="container">

  <div class="page-header">
    <h1>My Page</h1>
  </div>

  <div class="row">
    
    <div class="col-sm-3">
    	<ul>
    		<li><a href="/myPage">스크랩 기사목록</a></li>
    		<li><a href="/manageMyBoard">게시판 글관리</a></li>
    		<li><a href="/manageMyInfo">회원정보 관리</a></li>
    		<li><a href="/manageMyBitcoin">내 비트코인 확인</a></li>
    	</ul>  
    </div>

    <div class="col-sm-9">
      <div class="row">
	
		<h2>내 정보를 확인해 주세요 <small> 비밀번호는 자주 변경해 주시는 것이 좋습니다</small></h2>
		
 		<form class="form-horizontal">
   		
   		<div class="form-group">
     		<label class="control-label col-sm-2" for="email">Email:</label>
     		<div class="col-sm-10">
       			<p class="form-control-static">someone@example.com</p>
     		</div>
   		</div>
   		
   		<div class="form-group">
     		<label class="control-label col-sm-2" for="nickname">Nickname:</label>
     		<div class="col-sm-10">
       			<input type="text" class="form-control" id="nickname" placeholder="현재 닉네임 이름 적혀 있음">
     		</div>
   		</div>
   		
   		<div class="form-group">
     		<label class="control-label col-sm-2" for="password">현재 비밀번호 :</label>
		    <div class="col-sm-10">          
       			<input type="password" class="form-control" id="password" placeholder="현재 비밀번호를 입력하세요">
     		</div>
   		</div>
   		
   		<div class="form-group">
     		<label class="control-label col-sm-2" for="new_password">변경할 비밀번호 :</label>
		    <div class="col-sm-10">          
       			<input type="password" class="form-control" id="new_password" placeholder="변경할 비밀번호를 입력하세요">
     		</div>
   		</div>
   		
   		<div class="form-group">        
     		
     		<div class="col-sm-offset-2 col-sm-2">
       			<button type="submit" class="btn btn-primary">닉네임 변경</button>
     		</div>
     		
     		<div class="col-sm-2 pull-left">
       			<button type="submit" class="btn btn-primary">비밀번호 변경</button>
     		</div>
     		
     		<div class="col-sm-2 pull-left">
       			<button type="submit" class="btn btn-danger">회원 탈퇴</button>
     		</div>
     		
   		</div>
   		
 		</form>
      </div>
    </div>
         
  </div>
  
</div>

<%@ include file="../include/footer.jsp" %>		