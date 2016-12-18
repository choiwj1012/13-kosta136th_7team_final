<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 채팅창 온오프 버튼 -->
<div id="chatBtn">
 	<img src="../../resources/img/message.png" alt="chat_icon" id="chat_icon"/>
</div>

<!-- 채팅 기능 추가구현 -->
<div id="chatroom">	
	<iframe id="chat" src="http://52.78.224.181:3000/public/index.html" frameborder="0"></iframe>
</div>

<script>
	
	$(document).ready(function(){
			
		$('#chat_icon').on('click', function(){
		
			var chatroomLocation = $('#chatroom').css('right');
			
			if(chatroomLocation == '-400px'){
				
				$('#chatroom').animate({'right' : '0px'});
				
			} else {
				
				$('#chatroom').animate({'right' : '-400px'});
				
				
			}
			
		});
	
	});
	
</script>