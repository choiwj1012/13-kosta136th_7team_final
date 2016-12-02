<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="../include/header.jsp" %>
<header>
	<link rel="stylesheet" href="../../resources/css/graph.css" />
</header>
<%@ include file="../include/grandNav.jsp" %>

<div class="container-fluid">
	<div class="row">
	
		<!-- 실시간 채팅 -->
		<div class="col-sm-2" id="realtimeChat">
			<img src="http://dummyimage.com/300x1000" alt="" />
		</div>
	
		<!-- 실시간 시세보기 -->
		<div class="col-sm-10" id="realtimeGraph">
	
		</div>
		
	</div>
</div>










<%@ include file="../include/footer.jsp" %>		