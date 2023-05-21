<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../includes/header.jsp" %>


  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Daangn Modify/Delete Page</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>								
							</small>
						</div>
						<form id="actionForm" action="/daangn/modify" method="post" class="form-horizontal">
							<input type="hidden" name="pageNum" value="${cri.pageNum }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
							<div class="form-group">
								<label for="bno" class="col-sm-3 control-label">Bno:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="bno" id="bno" placeholder="" readonly="readonly" value="${daangn.bno}">
								</div>
							</div>
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="title" id="title" placeholder="" required="required" value="${daangn.title}">
								</div>
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-3 control-label">Text area:</label>
								<div class="col-sm-9">
									<textarea class="form-control" name="content" id="content" placeholder="" required="required">${daangn.content}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="writer" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="writer" id="writer" placeholder="" readonly="readonly" value="${daangn.writer}">
								</div>
							</div>
							<div class="form-group">
								<label for="regdate" class="col-sm-3 control-label">RegDate:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="regdate" id="regdate" placeholder="" disabled="disabled" value='<fmt:formatDate value="${daangn.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />'>
								</div>
							</div>
							<div class="form-group">
								<label for="updateDate" class="col-sm-3 control-label">UpdateDate:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="updateDate" id="updateDate" placeholder="" disabled="disabled" value='<fmt:formatDate value="${daangn.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" />'>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button type="submit" data-oper="modify" class="btn btn-success btn-sm">Modify</button>
									<button type="submit" data-oper="remove" class="btn btn-default btn-sm">Remove</button>
									<button type="submit" data-oper="list" class="btn btn-info btn-sm">List</button>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

			
		</div><!-- .row -->
	</section><!-- #dash-content -->
</div><!-- .wrap -->
  

<script>
$(document).ready(function(){
	$("button[type=submit]").on("click", function(event){
		event.preventDefault();
		
		let operation = $(this).data('oper');
		
		if(operation === 'remove'){
			if(confirm("정말로 삭제하시겠습니까?")){
				$("#actionForm").attr("action", "/daangn/remove");
			} else {
				return false;
			}
		} else if(operation === 'list'){
			$("#actionForm").attr("action", "/daangn/list");
			$("#actionForm").attr("method", "get");
			
			let pageNumTag = $("input[name=pageNum]").clone();
			let amountTag = $("input[name=amount]").clone();
			let typeTag = $("input[name=type]").clone();
			let keywordTag = $("input[name=keyword]").clone();
			
			$("#actionForm").empty();
			$("#actionForm").append(pageNumTag);
			$("#actionForm").append(amountTag);
			$("#actionForm").append(typeTag);
			$("#actionForm").append(keywordTag);
		}
		
		$("form").submit();
	});
});
</script>
<%@ include file="../includes/footer.jsp" %>