<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

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
					<a href="#"><img src="../../resources/img/naver_icon_resize.png" alt="" /> 네이버로 가입하기</a>
				</div>
			
				<form action="" role="form">
					
					<div class="form-group">
						<label for="signup_email">이메일 주소</label>
						<input type="email" class="form-control" id="signup_email" placeholder="이메일 주소를 입력하세요" required />
						<button type="button" class="btn btn-primary">이메일 체크</button>
					</div>
					
					<div class="form-group">
						<label for="signup_password">비밀번호</label>
						<input type="password" class="form-control" id="signup_password" placeholder="비밀번호를 입력하세요" required />
					</div>
					
					<div class="form-group">
						<label for="signup_check_password">비밀번호체크</label>
						<input type="password" class="form-control" id="signup_check_password" placeholder="비밀번호를 재입력하세요" required/>
					</div>
					
					<div class="form-group">
						<label for="signup_nickName">닉네임</label>
						<input type="text" class="form-control" id="signup_nickName" placeholder="닉네임을 입력하세요" required/>
						<button type="button" class="btn btn-primary">닉네임 체크</button>
					</div>
					
					<div class="row text-center">
						<div class="col-sm-12">
							<button type="submit" class="btn btn-primary">
 							가입하기 <span class="glyphicon glyphicon-ok"></span>
 							</button>
						</div>
					</div>
							           						
				</form>
				
			</div>
			
		</div>
			           		
	</div>
	
</div> <!-- ./modal (signup) -->
         
           
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
				<a href="#"><img src="../../resources/img/naver_icon_resize.png" alt="" /> 네이버로 로그인 하기</a>
			</div>
		
			<form action="" role="form">
				
				<div class="form-group">
					<label for="signin_email">이메일 주소</label>
					<input type="email" class="form-control" id="signin_email" placeholder="이메일 주소를 입력하세요" />
				</div>
				
				<div class="form-group">
					<label for="signin_password">비밀번호</label>
					<input type="password" class="form-control" id="signin_password" placeholder="비밀번호를 입력하세요" />
				</div>
        						
				<div class="row text-center">
					<div class="col-sm-12">
						<button type="submit" class="btn btn-primary">
							로그인하기 <span class="glyphicon glyphicon-ok"></span>
						</button>
					</div>
				</div>
						           						
			</form>
			
		</div>
		
	</div>
		           		
</div>

</div> <!-- ./modal (signin) -->