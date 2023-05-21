<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="../includes/header.jsp" %>


  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Hospital Register Page</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>
							</small>
						</div>
						<form action="/hospital/register" method="post" class="form-horizontal">
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="title" id="title" placeholder="" required="required">
								</div>
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-3 control-label">Content:</label>
								<div class="col-sm-9">
									<textarea class="form-control" name="content" id="content" placeholder="" required="required"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="writer" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="writer" id="writer" placeholder="" required="required">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button type="submit" class="btn btn-success btn-sm">Register</button>
									<button type="reset" class="btn btn-default btn-sm">Reset</button>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

			
		</div><!-- .row -->
	</section><!-- #dash-content -->
</div><!-- .wrap -->
  


<%@ include file="../includes/footer.jsp" %>