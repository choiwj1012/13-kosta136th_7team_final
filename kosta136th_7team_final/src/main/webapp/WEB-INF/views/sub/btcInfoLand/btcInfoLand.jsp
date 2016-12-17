<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../../include/header.jsp"%>

<head>
	<link rel="stylesheet" href="../../resources/css/btcInfoLand.css" />
</head>

<%@ include file="../../include/grandNav.jsp"%>

<!-- title area -->
<div class="container">
	
	<div class="page-header">
	
		<h1>
			BTC 정보광장<small>_이달의 추천 딜러</small>
		</h1>
		
		<ul class="breadcrumb">
			<li>Home</li>
			<li>BTC정보광장</li>
			<li class="active">이달의 추천딜러</li>
		</ul>
		
	</div>
	
	<div class="panel panel-default">
	
		<div class="panel-body">
			<span class="page_title">이달의 추천 딜러 |</span> 
			<span>비트리버 회원이면 누구나 전문 딜러로 활동 할 수 있습니다. 다양한 정보를 많은 회원들과 공유해 보시길 바랍니다.</span>
		</div>
		
	</div>
	
</div>

<!-- search input box -->
<div class="container">
		
	<div class="search_group">
	
		<div class="col-md-2"></div>
		
		<div class="form-group col-md-2">
			<select class="form-control">
				<option>선택</option>
				<option>딜러명</option>
				<option>제목</option>
				<option>제목+본문</option>
			</select>
		</div>
		
		<form>
			<div class="input-group col-md-6">
				<input type="text" class="form-control" placeholder="Search">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
		
	</div>

</div>
	
	
<!-- Dealer Page List Area -->
<div class="clearfix" role="main">

	<ul id="container">
	
		<li>
			<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img01.jpg"></a>	
			<p><span class="label label-primary glyphicon glyphicon-heart"> 20,345</span></p>		
			<h3>초보님을 위한 비트코인 시작하기~</h3>		
			<p>@webtohouse</p>		
			<span class="label label-primary">#실시간시세</span> 
			<span class="label label-primary">#Bitcoin</span> 
			<span class="label label-primary">#비트코인초보</span>	
		</li>
		
		<li>
			<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img02.jpg"></a>	
			<p><span class="label label-primary glyphicon glyphicon-heart"> 20,345</span></p>		
			<h3>초보님을 위한 비트코인 시작하기~</h3>		
			<p>@webtohouse</p>		
			<span class="label label-primary">#실시간시세</span> 
			<span class="label label-primary">#Bitcoin</span> 
			<span class="label label-primary">#비트코인초보</span>	
		</li>
		
		<li >
			<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img03.jpg"></a>	
			<p><span class="label label-primary glyphicon glyphicon-heart"> 20,345</span></p>		
			<h3>초보님을 위한 비트코인 시작하기~</h3>		
			<p>@webtohouse</p>		
			<span class="label label-primary">#실시간시세</span> 
			<span class="label label-primary">#Bitcoin</span> 
			<span class="label label-primary">#비트코인초보</span>	
		</li>
		
		<li>
			<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img01.jpg"></a>	
			<p><span class="label label-primary glyphicon glyphicon-heart"> 20,345</span></p>		
			<h3>초보님을 위한 비트코인 시작하기~</h3>		
			<p>@webtohouse</p>		
			<span class="label label-primary">#실시간시세</span> 
			<span class="label label-primary">#Bitcoin</span> 
			<span class="label label-primary">#비트코인초보</span>	
		</li>
		
		<li>
			<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img02.jpg"></a>	
			<p><span class="label label-primary glyphicon glyphicon-heart"> 20,345</span></p>		
			<h3>초보님을 위한 비트코인 시작하기~</h3>		
			<p>@webtohouse</p>		
			<span class="label label-primary">#실시간시세</span> 
			<span class="label label-primary">#Bitcoin</span> 
			<span class="label label-primary">#비트코인초보</span>	
		</li>
		
		<li>
			<a href="/btcInfoLand_board_list"><img src="../../resources/img/dealer_test_img03.jpg"></a>	
			<p><span class="label label-primary glyphicon glyphicon-heart"> 20,345</span></p>		
			<h3>초보님을 위한 비트코인 시작하기~</h3>		
			<p>@webtohouse</p>		
			<span class="label label-primary">#실시간시세</span> 
			<span class="label label-primary">#Bitcoin</span> 
			<span class="label label-primary">#비트코인초보</span>	
		</li>

	</ul>	
	
</div>
<script src="../../resources/js/wookmark.js"></script>
<script>

	(function() {
		var wookmark = new Wookmark('#container'); 
	})();
	
</script>
<%@ include file="../../include/footer.jsp"%>