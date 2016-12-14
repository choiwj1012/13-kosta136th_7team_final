<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<footer id="footer">
	
	<div class="container-fluid text-center">
		<div class="row">

			<div class="col-sm-2">
				<img alt="footer_logo" src="../../resources/img/logo_footer.png" id="footer_logo_img">
			</div>
			
			<div class="col-sm-8" id="footer_content">
				<p>주식회사 비트리버닷컴 | 서울특별시 금천구 가산동 이노플렉스 2차 2층 | 대표 홍길동</p> 
				<p>사업자등록번호 123-45-12345 | 통신판매신고번호 제 2017-서울금천-00010호</p>
				<p>문의전화 : 09:00 ~ 18:00 1588-1588 | master@bitriver.com</p>
				<p><span class="footer_copyright">Copyright &copy; 2016 BITRIVER ALL RIGHTS RESERVED.</span></p>				
			</div>
			 
			<div class="col-sm-2">
				<div class="dropup">
				
					<button class="btn btn-default btn-xm dropdown-toggle" type="button" id="sitemap" data-toggle="dropdown">
						비트리버 바로가기<span class="caret"></span>
					</button>
					
					<ul class="dropdown-menu" role="menu" aria-labelledby="sitemap">
						<li role="presentation"><a role="menuitem" tabindex="-1" href="marketPrice">실시간 시세</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="/news">최신 뉴스</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="/btcInfoLand">BTC 정보광장</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="/board_list">게시판</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- 채팅창 온오프 버튼 -->
	<div id="chatBtn">
	 	<i class="fa fa-comment" aria-hidden="true" id="chatBtn_icon"></i>
	</div>
	
	<!-- 채팅 기능 추가구현 -->
	<div id="chatroom">
		<iframe id="chat" src="http://52.78.224.181:3000/public/index.html" frameborder="none"></iframe>
	</div>
	
	<script>
		
		$(document).ready(function(){
				
			$('#chatBtn > i').on('click', function(){
			
				var chatroomLocation = $('#chatroom').css('right');
				
				if(chatroomLocation == '-340px'){
					
					$('#chatroom').animate({'right' : '0px'});
					
				} else {
					
					$('#chatroom').animate({'right' : '-340px'});
					
				}
				
			});
		
		});
		
	</script>
	
</footer>
</body>
</html>