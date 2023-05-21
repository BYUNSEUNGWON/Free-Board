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
						<h4 class="widget-title">Hospital Read Page</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>								
							</small>
						</div>
						<form class="form-horizontal" action="/hospital/modify">
							<input type="hidden" name="pageNum" value="${cri.pageNum }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
							<div class="form-group">
								<label for="bno" class="col-sm-3 control-label">Bno:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="bno" id="bno" placeholder="" readonly="readonly" value="${hospital.bno}">
								</div>
							</div>
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9 control-label text-left">
									${hospital.title}
								</div>
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-3 control-label">Text area:</label>
								<div class="col-sm-9 control-label text-left">
									${hospital.content}
								</div>
							</div>
							<div class="form-group">
								<label for="writer" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9 control-label text-left">
									${hospital.writer}
								</div>
							</div>
							<div class="form-group">
								<label for="regdate" class="col-sm-3 control-label">RegDate:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="regdate" id="regdate" placeholder="" disabled="disabled" value='<fmt:formatDate value="${hospital.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />'>
								</div>
							</div>
							<div class="form-group">
								<label for="updateDate" class="col-sm-3 control-label">UpdateDate:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="updateDate" id="updateDate" placeholder="" disabled="disabled" value='<fmt:formatDate value="${hospital.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" />'>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button type="submit" data-oper="modify" class="btn btn-success btn-sm">Modify</button>
									<a href="list${cri.listLink }" role="button" data-oper="list" class="btn btn-default btn-sm">List</a>
								</div>
							</div>
						</form>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

			
		</div><!-- .row -->
		
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>
					Reply
					
					</div>
					<div class="panel-body">
						<div class="row">
							<form id="replyAct" method="post" action="/hospital/replies/register">
								<input type="hidden" name="bno" value="${hospital.bno}">
								<input type="hidden" name="pageNum" value="${cri.pageNum }">
								<input type="hidden" name="amount" value="${cri.amount }">
								<input type="hidden" name="type" value="${cri.type }">
								<input type="hidden" name="keyword" value="${cri.keyword }">
								<input type="hidden" name="rno" id="rno" value="0">
								
								<textarea name="reply" id="reply" required="required" placeholder="댓글내용을 작성하세요" class="form-control"></textarea>
								<input name="replyer" id="replyer" required="required" placeholder="댓글작성자이름을 입력하세요" class="form-control">
								<button id="addReplyBtn" class="btn btn-primary btn-sm">New Reply</button>
								<button id="modifyReplyBtn" class="btn btn-primary btn-sm">Reply Modify</button>							
							</form>
							<hr>
						</div>
						<ul class="chat">
						<c:forEach var="reply" items="${replyList}">
							<li class="left clearfix" data-rno = "${reply.rno}">
								<div>
									<div class="header">
										<strong class="primary-font">${reply.replyer}</strong>
										<small class="pull-right text-muted"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </small>
										<small class="pull-right text-muted" style="margin-right:20px;">
										<a href="javascript:void(0);" class="modify" data-rno="${reply.rno}" data-reply="${reply.reply}" data-replyer="${reply.replyer}">M</a>
										/
										<a href="javascript:void(0);" class="delete" data-rno="${reply.rno}">D</a>
										</small>
									</div>
									<p>${reply.reply}</p>
								</div>
								<hr>
							</li>	
						</c:forEach>						
						</ul>
					</div>
				</div>
			</div><!-- END column -->
		</div>
		
		
	</section><!-- #dash-content -->
</div><!-- .wrap -->
  
<script>
$(document).ready(function(){
	
	let addReplyBtn = $("#addReplyBtn");
	let modifyReplyBtn = $("#modifyReplyBtn");
	
	modifyReplyBtn.hide();
	
	$(".modify").on("click", function(){
		let rno = $(this).data("rno");
		let reply = $(this).data("reply");
		let replyer = $(this).data("replyer");
		
		$("#rno").val(rno);
		$("#reply").val(reply);
		$("#replyer").val(replyer).attr("readonly", true);
		
		$("#replyAct").attr("action", "/hospital/replies/modify");
				
		modifyReplyBtn.show();
		addReplyBtn.hide();
		
		$("#reply").focus();
	});
	
	$(".delete").on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			let rno = $(this).data("rno");
			
			$("#rno").val(rno);
			
			$("#replyAct").attr("action", "/hospital/replies/remove");
			$("#replyAct").submit();
		}
	});
	
});//$(document).ready(function(){
</script>

<%@ include file="../includes/footer.jsp" %>