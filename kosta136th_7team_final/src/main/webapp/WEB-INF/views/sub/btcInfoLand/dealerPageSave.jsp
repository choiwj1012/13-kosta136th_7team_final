<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

				<form role="form" method="post">
					<div class="box-body">
						<div class="form-group">
							<label for="exampleInputEmail1">페이지 제목</label> <input type="text"
								name='category' class="form-control" placeholder="페이지 제목을 써주세요">
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">등록</button>
						<button type="submit" class="btn btn-primary" id="saveCancel">취소</button>
					</div>
				</form>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<script>
	$(document).ready(
			
			function() {

				$('#saveCancel').on("click", function(event) {

					self.location = "btcInfoLand";

				});

			});
</script>
