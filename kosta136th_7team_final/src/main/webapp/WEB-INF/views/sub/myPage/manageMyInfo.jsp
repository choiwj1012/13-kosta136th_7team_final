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
			  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'changeNickName')" id="defaultOpen">닉네임변경</a></li>
			  <li><a href="javascript:void(0)" class="tablinks" onclick="openCity(event, 'changePassword')">비밀번호변경</a></li>
			</ul>
		
		<br />
		
		<div id="changeNickName" class="tabcontent">
			  <h3>닉네임변경</h3>
			  
			  <form class="form-horizontal text-left">
   		
	   		<div class="form-group">
	     		<label class="control-label col-md-2" for="email">현재 Email</label>
	     		<div class="col-md-9">
	       			<p class="form-control-static">${login.USER_EMAIL}</p>
	     		</div>
	     		<div class="col-md-1"></div>
	   		</div>
	   		
	   		<div class="form-group">
	     		<label class="control-label col-md-2" for="email">현재 닉네임</label>
	     		<div class="col-md-9">
	       			<p class="form-control-static">${nickName }</p>
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
	       			<button type="submit" class="btn btn-primary" id = "nicknamebtn">닉네임 변경하기</button>
	     		</div>    		     		
	   		</div>
   		
 		</form>
 		
 		<br />
			  
			</div>
			
			<div id="changePassword" class="tabcontent">
			  <h3>패스워드변경</h3>
			  
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
	     		<label class="control-label col-md-2" for="new_password">새 비밀번호 재입력</label>
			    <div class="col-md-9">          
	       			<input type="password" class="form-control" id="new_password_check" placeholder="변경할 비밀번호를 입력하세요">
	     		</div>
	     		<div class="col-md-1"></div>
	   		</div>
 		
 			<div class="form-group text-center">             		    		
	     		<div class="col-md-12">
	       			<button type="submit" class="btn btn-primary" id = "change_password_btn">비밀번호 변경하기</button>
	     		</div>     		
	   		</div>
 		
 		</form>
			</div>
      </div>
      
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
$(document).ready(function(){
	$('#nicknamebtn').on('click', function(e){
		var changeNickName = $('#nickname').val();
		if(changeNickName == '')
		{
			alert("최소 한글자 이상 입력해주세요");
			return;
		}
		var email = '<c:out value="${login.USER_EMAIL}"/>';

		$.ajax({
			type : 'POST',
			url : '/changeNickName',
			async : false,
			dataType : 'text',
		    data : 
		    { 
		    	'USER_EMAIL' : email,
		    	'USER_NICKNAME' : changeNickName
		    },
		    success : function(data) {
		    	if(data=="true")
	    		{
	    			alert("닉네임변경성공");
	    		}
		         					
		    }
		});
		
	});
});
</script>

<script>
$(document).ready(function(){
	$('#change_password_btn').on('click', function(e){
		var password = $('#password').val();
		var newPassword = $('#new_password').val();
		var newPasswordCheck = $('#new_password_check').val();
		
   		regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~`!@#$%^&*()_+-={}\[\]:;<,>.?/|\\])[A-Za-z\d~`!@#$%^&*()_+-={}\[\]:;<,>.?/|\\]{8,16}$/;
	  	var isPasswordType = regex.test(newPassword);
	  	if (!isPasswordType)
	  	{
	  		alert("비밀번호(8~16자)는 반드시 한 개 이상의 영문, 숫자, 특수문자를 전부 포함하고 있어야 합니다");
	  		return;
	  	}
		
		
		if(newPassword != newPasswordCheck)
		{
			alert("새 비밀번호가 다릅니다.");
			return;
		}
		$.ajax({
			type : 'POST',
			url : '/changePassword',
			async : false,
			dataType : 'text',
		    data : 
		    { 
		    	'NOW_USER_PASSWORD' : password,
		    	'CHANGE_USER_PASSWORD' : newPassword
		    },
		    success : function(data) {
		    	if(data=="true")
	    		{
	    			alert("비밀번호변경성공");
	    		}
		         					
		    }
		});
		
	});
});
</script>



<%@ include file="../../include/footer.jsp" %>		