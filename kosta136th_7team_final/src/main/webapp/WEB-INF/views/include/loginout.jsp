<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 회원가입 modal -->
<div class="modal fade" id="signup" role="dialog">

	<div class="modal-dialog">
		
		<!-- modal content -->
		<div class="modal-content">
		
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" id = "my-alert">&times;</button>
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
						<input type="password" class="form-control" id="signup_password" placeholder="비밀번호를 입력하세요" onblur="passwordTypeCheck();"/>
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
						<button type="button" id = "send_authentication_btn" class="btn btn-primary">인증번호발급받기</button>
						<button type="button" id = "check_authentication_btn" class="btn btn-primary">인증번호확인</button>
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
					
				</div>
        						
				<div class="row text-center">
					<div class="col-sm-12">
						<button type="submit" id = "signin_email_btn" class="btn btn-primary">
							로그인하기 <span class="glyphicon glyphicon-ok"></span>
						</button>
						<button type="submit" id = "issue_password_btn" class="btn btn-primary">
							새 비밀번호<span class="glyphicon glyphicon-ok"></span>
						</button>
					</div>
				</div>
						           						
			</form>
			
		</div>
		
	</div>
		           		
</div>

</div> <!-- ./modal (signin) -->

<script>
			$(document).ready(function(){

				isSignupEmailUnique = false;
				isAuthenticate = false;
				isPassword = false;
				
				$(document).on('click', '#check_email_btn',function(e){
					
					e.preventDefault();
					
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
	
	  <script>

        function passwordTypeCheck()
        {
        	var password = $('#signup_password').val();
       		regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~`!@#$%^&*()_+-={}\[\]:;<,>.?/|\\])[A-Za-z\d~`!@#$%^&*()_+-={}\[\]:;<,>.?/|\\]{8,16}$/;
   		  	var isPasswordType = regex.test(password);
   		  	if (!isPasswordType)
   		  	{
   		  		alert("비밀번호(8~16자)는 반드시 한 개 이상의 영문, 숫자, 특수문자를 전부 포함하고 있어야 합니다");
   		  		
   		  	}
        }
      </script>
      
      <script>

        function passwordEqualCheck()
        {
        	var password = $('#signup_password').val();
        	var checkPassword = $('#signup_check_password').val();
        	if (password != checkPassword){
		  		alert('비밀번호가 일치하지 않습니다');
		  	}else
		  		{
		  			isPassword = true;
		  		}
        }
	</script>
	
		<!-- 회원 가입 email에 글자를 입력했다(키업 이벤트) -->
	<script>
	$(document).ready(function(){
		$(document).on('keyup', '#signup_email', function(){
			
			isEmailUnique = false;
			isAuthenticate = false;
			
		});
		
		$(document).on('click', '#my-alert', function(){
			 $('.modal-body').find('textarea,input').val('');
			 $('#signup_authentication').prop('readonly', false);
			
		});
	});
	</script>
      
      	<!-- 인증번호발급받기 버튼 클릭했을 때 작동하는 스크립트 -->
	<script>
			$(document).ready(function(){

				$(document).on('click', '#send_authentication_btn',function(e){
					
					e.preventDefault();
					$('#signup_authentication').prop('readonly', false);
					var email = $('#signup_email').val();
					if(email == '')
					{
					 alert('이메일을 입력해주세요');
					 $("#signup_email").focus();
						return;
					}
					if (!isSignupEmailUnique){
						alert('이메일체크를 해주세요');
						$("#signup_email").focus();
						return;
					}
			    	
					isAuthenticate = false;
					
					$.ajax({
								url : '/requestAuthentication',
								method : 'post',
								async : false,
								data : {
										'USER_EMAIL' : $('#signup_email').val()
									},
								success : function(data){
									if(data != "error")
									{
										alert("메일로 인증번호가 전송되었습니다.");
										authenticationCode = data;
									}
									else
									{
										alert("에러발생!!!");
									}
								}
					}); 
					
				});
			});
	</script>
	
	
	<!-- 인증 버튼 클릭했을 때 작동하는 스크립트 -->
	<script>
	$(document).ready(function(){
			
		$(document).on('click', '#check_authentication_btn', function(){
			var signup_authentication = $('#signup_authentication').val();
			if(signup_authentication == authenticationCode)
				{
					alert("인증성공");
					isAuthenticate = true;
					$('#signup_authentication').prop('readonly', true);
				}
			else
				{
					alert("인증번호를 다시 확인해 주세요.");
					
				}
			
		});
	});
	</script>
<!-- 이메일로 가입 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('#signup_email_btn').on('click', function(e){
			
			e.preventDefault();
			e.stopPropagation();
			var email = $('#signup_email').val();
			var password = $('#signup_password').val();
        	var checkPassword = $('#signup_check_password').val();
			var nickname = $('#signup_nickname').val();
			var authentication = $('#signup_authentication').val();

			if (email == '')
			{
				alert("이메일을 입력해 주세요");
				$("#signup_email").focus();
				return;
				
			}
			else if (isSignupEmailUnique == false)
			{
				alert("이메일체크를 해주세요.");
				return;
			}
			else if(password == '')
			{
				alert("비밀번호를 입력해 주세요");
				return;
			}
			else if(password != checkPassword)
			{
				alert("비밀번호를 확인 해주세요");
				return;
			}
			else if(nickname == '')
			{
				alert("닉네임을 입력해 주세요");
				$("#signup_nickname").focus();
				return;
			}
			else if(authentication == '')
			{
				alert("인증코드를 입력해 주세요");
				$("#signup_authentication").focus();
				return;
			}
			else if(isAuthenticate == false)
			{
				alert("인증번호확인을 해주세요");
				return;
			}
		  	
			var registerMap = {};
			registerMap["user"] = [$('#signup_email').val(), $('#signup_password').val(), 
				$('#signup_nickname').val(),
				$(':radio[name="register_type_code"]:checked').val()];
			$.ajax({
				type : 'POST',
				url : '/requestSignupEmail',
				async : false,
				headers : {
					"Content-Type": "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
			    data : JSON.stringify(registerMap),	
			    success : function(data) {
				    if(data == "true")
			    	{
				    	$('#signup').modal('hide');
				    	$('.modal-body').find('textarea,input').val('');
						$('#signup_authentication').prop('readonly', false);
			    	}
			    }
			});
		    
		});
	});
</script>

<!-- 이메일로 로그인 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('body').on('click', '#signin_email_btn', function(e){
			e.preventDefault();
			e.stopPropagation();
			
			var email = $('#signin_email').val();			
			var password = $('#signin_password').val();
			if (email == '')
			{
				alert("이메일을 확인해주세요");
				return;	
			}
			else if (password == '')
			{
				alert('비밀번호를 입력해주세요');
				return;	
			}
			$.ajax({
				type : 'POST',
				url : '/requestSigninEmail',
				async : false,
				dataType : 'text',
			    data : 
			    { 
			    	'USER_EMAIL' : email,
			    	'USER_PASSWORD' : password
			    },
			    success : function(data) {
				    if(data == "true")
			    	{
				    	alert("로그인성공");
				    	$('#signupBtn').remove();
					    $('#signinBtn').remove();
					    $('#myPage').remove();
					    $('#signoutBtn').remove();
					    $('.nav').append('<li><a href="/myPage" id = "myPage">마이페이지</a></li>');
					    $('.nav').append('<li><a href="#" id="signoutBtn">로그아웃</a></li>');
						$('#signin').modal('hide');
						location.reload();
			    	}
				    else
			    	{
				    	alert("로그인에 실패하였습니다");
						$('#signupBtn').remove();
					    $('#signinBtn').remove();
					    $('#myPage').remove();
					    $('#signoutBtn').remove();
						$('.nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
			        	$('.nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>');
			        	location.reload();
			    	}
			         					
			    }
			});

		});
	});
</script>


<!-- 로그아웃 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		
		$('body').on('click', '#signoutBtn', function(e){
			
			e.preventDefault();
			e.stopPropagation();
			
			var email = '<c:out value="${login.USER_EMAIL}"/>';					//세션에담긴것
			var registerType = '<c:out value="${login.REGISTER_TYPE_CODE}"/>';
			$.ajax({
				type : 'POST',
				async : false,
				url : '/requestSignout',
				data : {USER_EMAIL : email},
				dataType : 'text',
			    success : function(data) {
			    	
			    	if (data == "true"){
			    		$('#signupBtn').remove();
					    $('#signinBtn').remove();
					    $('#myPage').remove();
					    $('#signoutBtn').remove();
						$('.nav').append('<li><a href="#" id="signupBtn" data-toggle="modal" data-target="#signup">회원가입</a></li>');
			        	$('.nav').append('<li><a href="#" id="signinBtn" data-toggle="modal" data-target="#signin">로그인</a></li>');
			        	location.reload();
			        }
				    
			
			    }
			});
			
		});
	});
</script>

<script>
	$(document).ready(function(){
		$('#issue_password_btn').on('click', function(e){
			
			e.preventDefault();
			
			if (confirm("새 비밀번호 발송시 기존의 비밀번호는 삭제되고 임시 비밀번호가 발생됩니다. \n 로그인후 꼭 마이페이지에서 비밀번호를 변경해주세요.") == true)
			{
				//확인
				
				if($('#signin_email').val() != '')
				{
					$.ajax({
						type : 'POST',
						url : '/requestIssuePassword',
						async : false,
						data : {
								'USER_EMAIL' : $('#signin_email').val(),
							},
					    success : function(data) {
					    	alert(data);
					    }
					});
				}
				else
				{
					alert("이메일을 입력해주세요.");
				}
				
			}
			else
			{   //취소
				alert("새비밀번호취소");
			    return;
			}
			
			
			
		});
	});
</script>


<!-- 네이버로 가입 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('#signup_naver_img').on('click', function(e){
			
			alert("구현중");
			
	});
	});
</script>

<!-- 네이버로 로그인 버튼을 클릭했을 때 작동하는 스크립트입니다. -->
<script>
	$(document).ready(function(){
		$('#signin_naver_img').on('click', function(e){
			
			alert("구현중");
			
	});
	});
</script>