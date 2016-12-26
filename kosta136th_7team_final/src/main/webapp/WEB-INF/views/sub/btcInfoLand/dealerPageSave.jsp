<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
  <script src="http://code.jquery.com/jquery-2.2.3.min.js"></script>
  <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style>
.fileDrop {
  width: 80%;
  height: 100px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
  
}
</style>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">딜러페이지 등록페이지</h3>
				</div>
				<!-- /.box-header -->

				<form id="registerForm" role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">페이지 제목</label> <input type="text"
								name='category' class="form-control" placeholder="페이지 제목을 써주세요">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">File DROP Here</label>
							<div class="fileDrop"></div>
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
							<div>
								<hr>
							</div>
							
							<ul class="mailbox-attachments clearfix uploadedList">
							</ul>
						<button type="submit" class="btn btn-primary">등록</button>
						
					</div>
				</form>
					<button class="btn btn-primary" id="saveCancel">취소</button>	
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

				$('#saveCancel').on("click", function(event) {
					
					self.location = "btcInfoLand";

				});

			});
</script>
