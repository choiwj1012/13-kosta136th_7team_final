<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 회원가입 modal -->
<div class="modal fade" id="signup" role="dialog">

	<div class="modal-dialog">
		
		<!-- modal content -->
		<div class="modal-content">
		
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2><span class="glyphicon glyphicon-lock"></span>회원가입</h2>
			</div>
			
			<div class="modal-body">
			
				<div class="naver text-center">
					<a href="#" id="signup_naver_img"><img src="../../resources/img/naver_icon_resize.png" alt="" /> 네이버로 가입하기</a>
				</div>
			
				<form action="" role="form">
					
					<div class="form-group">
						<label for="signup_email">이메일 주소</label>
						<input type="email" class="form-control" id="signup_email" placeholder="이메일 주소를 입력하세요"/>
						<button type="button" id = "check_email_btn" class="btn btn-primary">이메일 체크</button>
					</div>
					
					<div class="form-group">
						<label for="signup_password">비밀번호</label>
						<input type="password" class="form-control" id="signup_password" placeholder="비밀번호를 입력하세요"/>
					</div>
					
					<div class="form-group">
						<label for="signup_check_password">비밀번호체크</label>
						<input type="password" class="form-control" id="signup_check_password" placeholder="비밀번호를 재입력하세요"/>
					</div>
					
					<div class="form-group">
						<label for="signup_nickname">닉네임</label>
						<input type="text" class="form-control" id="signup_nickname" placeholder="닉네임을 입력하세요"/>
					</div>

					<div class="form-group">					
						<input type="radio" name="register_type_code" value="h" checked>회원<br>
 						<input type="radio" name="register_type_code" value="d">딜러<br>
					</div>
 
					<div class="form-group">
						<label for="signup_authentication">인증번호</label>
						<input type="text" class="form-control" id="signup_authentication" placeholder="인증번호를 입력하세요"/>
						<button type="button" id = "check_authentication_btn" class="btn btn-primary">인증</button>
					</div>
					
					<div class="row text-center">
						<div class="col-sm-12">
							<button type="submit" id ="signup_email_btn" class="btn btn-primary">
 							가입하기 <span class="glyphicon glyphicon-ok"></span>
 							</button>
						</div>
					</div>
												           						
				</form>
				
			</div>
			
		</div>
			           		
	</div>
	
</div>
<!-- ./modal (signup) -->      
           
<!-- 로그인 modal -->
<div class="modal fade" id="signin" role="dialog">

	<div class="modal-dialog">
		
	<!-- modal content -->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h2><span class="glyphicon glyphicon-lock"></span>로그인</h2>
		</div>
		
		<div class="modal-body">
		
			<div class="naver text-center">
				<a href="#" id = "signin_naver_img"><img src="../../resources/img/naver_icon_resize.png" alt="" /> 네이버로 로그인 하기</a>
			</div>

			<form action="" role="form">
				
				<div class="form-group">
					<label for="signin_email" id = "signinEmail">이메일 주소</label>
					<input type="email" class="form-control" id="signin_email" placeholder="이메일 주소를 입력하세요" />
				</div>
				
				<div class="form-group">
					<label for="signin_password" id = "signinPassword">비밀번호</label>
					<input type="password" class="form-control" id="signin_password" placeholder="비밀번호를 입력하세요" />
					<button type="submit" id = "issue_password_btn" class="btn btn-primary">
							새 비밀번호<span class="glyphicon glyphicon-ok"></span>
					</button>
				</div>
        						
				<div class="row text-center">
					<div class="col-sm-12">
						<button type="submit" id = "signin_email_btn" class="btn btn-primary">
							로그인하기 <span class="glyphicon glyphicon-ok"></span>
						</button>
					</div>
				</div>
						           						
			</form>
			
		</div>
		
	</div>
		           		
</div>

</div> <!-- ./modal (signin) -->

<!-- 안녕하세요, 여기부터는 자바스크립트입니다 -->

<!-- 이메일로 로그인 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('body').on('click', '#signin_email_btn', function(e){
			e.preventDefault();
			e.stopPropagation();
			
			var email = $('#signin_email').val();			
			var password = $('#signin_password').val();
			if ((email == '')||(password == '')){
				alert('입력하지 않은 값이 있습니다.');
				return;	
			}
			
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			var isEmailType = regex.test(email);	
			if (!isEmailType){
				alert('올바른 이메일 형식이 아닙니다');
				return;
			}

			regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~`!@#$%^&*()_+-={}\[\]:;<,>.?/|\\])[A-Za-z\d~`!@#$%^&*()_+-={}\[\]:;<,>.?/|\\]{8,16}$/;
			var isPasswordType = regex.test(password);
		  	if (!isPasswordType){
		  		alert("비밀번호(8~16자)는 반드시 한 개 이상의 영문, 숫자, 특수문자를 전부 포함하고 있어야 합니다");
		  		return;
		  	}
			
			$.ajax({
				type : 'POST',
				url : '/requestSigninEmail',
				async : false,
				headers : {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
			    data : JSON.stringify({ 
			    	'email' : $('#signin_email').val(),
			    	'password' : $('#signin_password').val()
			    }),
			    success : function(data) {
			         					
			    }
			});
			
			var isSignin = requestSigninSessionAttribute();
			if (isSignin == false){
				alert("로그인에 실패하였습니다");
				$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('#signoutBtn').remove();
				$('.nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
	        	$('.nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>'); 
	        }
			
		    if (isSignin == true){
		    	$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('#signoutBtn').remove();
			    $('.nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
			    $('.nav').append('<li><a href="#" id="signoutBtn">로그아웃</a></li>');
				$('#signin').modal('hide');
	        }

		});
	});
</script>

<!-- 서버에서 로그인 된 상태면 true-->
<!-- 서버에서 로그아웃 된 상태면 false를 반환하는 메서드 -->
<!-- 로그인, 로그아웃 메뉴를 바꾸는 부분도 이곳으로 옮기려 하였으나 오류 때문에 일단. -->
<script>
			function requestSigninSessionAttribute(){
				
				var isSignin = false;
				
				$.ajax({
					type : 'POST',
					url : '/requestSigninSessionAttribute',
					async : false,
					dataType: 'json',
				    success : function(result) {
						
						if (result["email"] != null && result ["nickname"] != null){
							signinSession.email = result["email"];
							signinSession.nickname = result["nickname"];
							isSignin = true;
						}else{
							signinSession.email = null;
							singinSession.nickname = null;
							isSignin = false;
						}
				    }
				});
				
				return isSignin;		       	
			}
</script>

<!-- 이메일로 가입 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('#signup_email_btn').on('click', function(e){
			
			e.preventDefault();

			var email = $('#signup_email').val();
			var password = $('#signup_password').val();
			var nickname = $('#signup_nickname').val();
			var authentication = $('#signup_authentication').val();
		  	var checkPassword = $('#signup_check_password').val();

			if ((email == '')||(password == '')||(nickname == '')||(authentication == '')||(checkPassword == '')){
				alert('입력하지 않은 값이 있습니다.');
				return;	
			}
			
			var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			var isEmailType = regex.test(email);
	
			if (!isEmailType){
				alert('올바른 이메일 형식이 아닙니다');
				return;
			}

			regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~`!@#$%^&*()_+-={}\[\]:;<,>.?/|\\])[A-Za-z\d~`!@#$%^&*()_+-={}\[\]:;<,>.?/|\\]{8,16}$/;
		  	var isPasswordType = regex.test(password);
		  			  	
		  	if (password != checkPassword){
		  		alert('비밀번호가 일치하지 않습니다');
		  		return;
		  	}	
		  	
		  	if (!isPasswordType){
		  		alert("비밀번호(8~16자)는 반드시 한 개 이상의 영문, 숫자, 특수문자를 전부 포함하고 있어야 합니다");
		  		return;
		  	}
			
			if (!isSignupEmailUnique){
		  		alert('이메일 중복검사를 해 주세요');
		  		return;
		  	}
		  	
		  	if (!isAuthenticate){
		  		alert('인증번호를 발급받으세요');
		  		return;
		  	}
		  	
			var registerMap = {};
			registerMap["user"] = [$('#signup_email').val(), $('#signup_password').val(), 
				$('#signup_nickname').val(),
				$(':radio[name="register_type_code"]:checked').val()];
			registerMap["authentication"] = [$('#signup_authentication').val()];
			$.ajax({
				type : 'POST',
				url : '/requestSignupEmail',
				async : false,
				headers : {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'json',
			    data : JSON.stringify(registerMap),	
			    success : function(data) {
				    alert(data);
			    }
			});
			
			var isSignin = requestSigninSessionAttribute();

			if (isSignin == false){
				$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('#signoutBtn').remove();
				$('.nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
	        	$('.nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>'); 
	        }
			
		    if (isSignin == true){
		    	$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('#signoutBtn').remove();
			    $('.nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
			    $('.nav').append('<li><a href="#" id="signoutBtn">로그아웃</a></li>');
				$('#signup').modal('hide');
	        }
		    
		});
	});
</script>

<!-- 네이버로 가입 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('#signup_naver_img').on('click', function(e){
			
			e.preventDefault();
			
			$.ajax({
				type : 'POST',
				url : '/requestSignupNaver',
			    success : function(data) {
			    	window.open(data);
			    }
			});
			
			var isSignin = requestSigninSessionAttribute();

			if (isSignin == false){
				$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('#signoutBtn').remove();
				$('.nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
	        	$('.nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>'); 
	        }
			
		    if (isSignin == true){
		    	$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('#signoutBtn').remove();
			    $('.nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
			    $('.nav').append('<li><a href="#" id="signoutBtn">로그아웃</a></li>');
	        }
			
		});
	});
</script>

<!-- 네이버로 로그인 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('#signin_naver_img').on('click', function(e){
			
			e.preventDefault();
			
			var childrenWindow = {};
			var isSignin;
			
			$.ajax({
				type : 'POST',
				url : '/requestSigninNaver',
				async : false,
			    success : function(data) {
			    	childrenWindow = window.open(data);
			    	while(childrenWindow != null){
			    	//자식창이 naver로 이동이 끝날 때까지 아랫줄을 시행하지 않고 기다린다.
			    	}
			    	isSignin = requestSigninSessionAttribute();
			    }
			});
			
			var isSignin = requestSigninSessionAttribute();

			if (isSignin == false){
				$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('#signoutBtn').remove();
				$('.nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
	        	$('.nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>'); 
	        }
			
		    if (isSignin == true){
		    	$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('#signoutBtn').remove();
			    $('.nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
			    $('.nav').append('<li><a href="#" id="signoutBtn">로그아웃</a></li>');
	        }
			
		});
	});
</script>

<!-- 로그아웃 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){

		$('body').on('click', '#signoutBtn', function(e){

			e.preventDefault();
			e.stopPropagation();
			
			$.ajax({
				type : 'POST',
				async : false,
				url : '/requestSignout',
			    success : function(data) {

			    }
			});
			
			var isSignin = requestSigninSessionAttribute();
			
			if (isSignin == false){
				$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
				$('.nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
	        	$('.nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>');
	        	this.parentNode.removeChild(this);
	        }
			
		    if (isSignin == true){
		    	$('#signupBtn').remove();
			    $('#signinBtn').remove();
			    $('#myPage').remove();
			    $('.nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
	        }
			
		});
	});
</script>

<!-- 이메일 중복 검사 버튼 클릭했을 때 작동하는 스크립트 -->
<script>
			$(document).ready(function(){

				$(document).on('click', '#check_email_btn',function(e){
					
					e.preventDefault();
			    	isSignupEmailUnique = false;
					isAuthenticate = false;
					
					var email = $('#signup_email').val();
					var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
					var isEmailType = regex.test(email);
					if (!isEmailType){
						alert('올바른 이메일 형식이 아닙니다');
						return;
					}
					
					$.ajax({
								url : '/requestCheckEmailDuplication',
								method : 'post',
								async : false,
								data : {
										'email' : $('#signup_email').val(),
									},
								success : function(data){
									email_state = data;
									if (email_state === "0"){
										alert('이미 가입된 이메일입니다');
									}else if(email_state === "1"){
										alert('사용할 수 있는 이메일입니다');
										isSignupEmailUnique = true;
									}else{
										alert('오류가 발생했습니다');
									} 
								}
					});
					
				});
			});
	</script>
	
	<!-- 회원 가입 email에 글자를 입력했다(키업 이벤트) -->
	<script>
	$(document).ready(function(){
		$(document).on('keyup', '#signup_email', function(){
			
			isSignupEmailUnique = false;
			isAuthenticate = false;
			
		});
	});
	</script>
	
	<!-- 인증 버튼 클릭했을 때 작동하는 스크립트 -->
<script>
			$(document).ready(function(){

				$(document).on('click', '#check_authentication_btn',function(e){
					
					e.preventDefault();
					
					if (!isSignupEmailUnique){
						alert('이메일이 가입되어 있는지 확인하세요');
						return;
					}
			    	
					isAuthenticate = false;
					
					$.ajax({
								url : '/requestAuthentication',
								method : 'post',
								async : false,
								data : {
										'email' : $('#signup_email').val()
									},
								success : function(data){
									authenticate_state = data;
									alert(data);
									isAuthenticate = true;
								}
					}); 
					
				});
			});
	</script>
	
	<!-- 새 비밀번호 발급 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('#issue_password_btn').on('click', function(e){
			
			e.preventDefault();
			
			$.ajax({
				type : 'POST',
				url : '/requestIssuePassword',
				async : false,
				data : {
						'email' : $('#signin_email').val(),
					},
			    success : function(data) {
			    	alert(data);
			    }
			});
			
			
		});
	});
</script>

<!-- 닉네임 중복 검사 버튼 클릭했을 때 작동하는 스크립트 -->
<!-- 일단은 넣어두고, 컨트롤러에도 만들어 놓지만  -->
<!-- 닉네임 중복 검사는 기획 단계에서 없어졌다 -->
<!-- <script>
			$(document).ready(function(){

				$(document).on('click', '#check_nickname_btn',function(){
			
					$.ajax({
								url : '/requestCheckNicknameDuplication',
								method : 'post',
								async : false,
								data : {
										nickname : $('#signup_nickname').val()
									},
								success : function(data){
									nickname_state = data;
									if (nickname_state === "0"){
										alert('이미 사용중인 닉네임입니다');
									}else if(nickname_state === "1"){
										alert('사용할 수 있는 닉네임입니다');
									}else{
										alert('오류가 발생했습니다');
									} 
								}
					});
					
				});
			});
	</script> -->