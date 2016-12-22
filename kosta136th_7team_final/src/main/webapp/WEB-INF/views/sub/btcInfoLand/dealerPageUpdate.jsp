<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">딜러 페이지 제목 수정 페이지</h3>
				</div>
				<!-- /.box-header -->

		<form role="form" action="dealerPageUpdate" method="post">
			<input type='hidden' name='page' value="${cri.page}"> 
			<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
			<input type='hidden' name='searchType' value="${cri.searchType}">
			<input type='hidden' name='keyword' value="${cri.keyword}">
			<input type='hidden' name='dealer_page_num' value="${dealer.dealer_page_num}"> 
					
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">딜러 페이지 제목</label>
							 <input type="text" name='category' class="form-control" value="${dealer.category}">
						</div>
					</div>
					<!-- /.box-body -->
				</form>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary" id="modifySave">SAVE</button>
					<button type="submit" class="btn btn-warning" id="modifyCancel">CANCEL</button>
				</div>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
<script>
$(document).ready(function() {

		var formObj = $("form[role='form']");

		$("#modifyCancel").on("click",function() {
			self.location = "btcInfoLand_board_list?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&dealer_page_num=${dealer.dealer_page_num}";
		});

		$("#modifySave").on("click",function() {
			formObj.submit();
			
		});
	});
</script>
