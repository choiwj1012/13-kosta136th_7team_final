<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<footer id="footer">
	
	<div class="container-fluid text-center">
		<div id="footer_row" class="row">

			<div class="col-sm-3">
				<img alt="footer_logo" src="../../resources/img/logo_footer.png" id="footer_logo_img">
			</div>
			
			<div class="col-sm-7" id="footer_content">
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
						<li role="presentation"><a role="menuitem" tabindex="-1" href="/sub/btcInfoLand/btcInfoLand">BTC 정보광장</a></li>
						<li role="presentation"><a role="menuitem" tabindex="-1" href="/board_list">게시판</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
	
	<%@ include file="chatting.jsp" %>
	
</footer>
</body>
</html>