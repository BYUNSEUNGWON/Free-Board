<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/header.jsp" %>

<style>
.bigPictureWrapper {
position:absolute;
display: none;
justify-content: center;
align-items: center;
top:0%;
width:100%;
height:100%;
background-color: gray;
z-index:100;
background: rgba(255,255,255, 0.5);
}

.bigPicture{
position: relative;
display: flex;
justify-content: center;
align-items: center;

}
.bigPicture img {
width: 600px;
}
</style>


  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Board Read Page</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>								
							</small>
						</div>
						<form class="form-horizontal" action="/board/modify">
							<input type="hidden" name="pageNum" value="${cri.pageNum }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
							<div class="form-group">
								<label for="bno" class="col-sm-3 control-label">Bno:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="bno" id="bno" placeholder="" readonly="readonly" value="${board.bno}">
								</div>
							</div>
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9 control-label text-left">
									${board.title}
								</div>
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-3 control-label">Text area:</label>
								<div class="col-sm-9 control-label text-left">
									${board.content}
								</div>
							</div>
							<div class="form-group">
								<label for="writer" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9 control-label text-left">
									${board.writer}
								</div>
							</div>
							<div class="form-group">
								<label for="regdate" class="col-sm-3 control-label">RegDate:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="regdate" id="regdate" placeholder="" disabled="disabled" value='<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />'>
								</div>
							</div>
							<div class="form-group">
								<label for="updateDate" class="col-sm-3 control-label">UpdateDate:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="updateDate" id="updateDate" placeholder="" disabled="disabled" value='<fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" />'>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									
									<sec:authentication property="principal" var="pinfo"/>
									
									<sec:authorize access="isAuthenticated()">
										<c:if test="${pinfo.username eq  board.writer}">
											<button type="submit" data-oper="modify" class="btn btn-success btn-sm">Modify</button>	
										</c:if>
									</sec:authorize>
									
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
					<div class="panel-heading">File Attach</div>
					<div class="panel-body">
						<div class="uploadResult">
							<ul>
							
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i>
					Reply
					<sec:authorize access="isAuthenticated()">
					<button id="addReplyBtn" class="btn btn-primary btn-sm pull-right">New Reply
					</button>
					</sec:authorize>
					</div>
					<div class="panel-body">
						<ul class="chat">
							<li class="left clearfix" data-rno = "12">
								<div>
									<div class="header">
										<strong class="primary-font">user00</strong>
										<small class="pull-right text-muted">2023-04-18 11:45:</small>
									</div>
									<p>Good job!</p>
								</div>
								<hr>
							</li>						
						</ul>
					</div>
					
					<div class="panel-footer">
					여기에 댓글페이징
					</div>
				</div>
			</div><!-- END column -->
		</div>
		
		
	</section><!-- #dash-content -->
</div><!-- .wrap -->


<!-- 모달 추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label>
					<textarea class="form-control" name="reply" id="reply"></textarea>
				</div>
				<div class="form-group">
					<label>Replyer</label>
					<input class="form-control" name="replyer" id="replyer">
				</div>
				<div class="form-group">
					<label>Reply Date</label>
					<input class="form-control" name="replyDate" id="replyDate">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-default">Modify</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-default">Remove</button>
				<button id="modalRegisterBtn" type="button" class="btn btn-default">Register</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				
			</div><!-- modal-footer -->
		</div><!-- modal-content -->
	</div><!-- modal-dialog -->
</div><!-- modal fade -->
<!-- 모달 끝 -->
<!-- 빅그림 -->
<div class="bigPictureWrapper">
	<div class="bigPicture">
	</div>
</div>
<!-- 빅그림 -->

<script src="/resources/assets/js/reply.js"></script>
<script>
$(document).ready(function(){
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
	<sec:authorize access="isAuthenticated()">
	var replyer = "<sec:authentication property="principal.username"/>";
	</sec:authorize>
	
	var bnoValue = '<c:out value="${board.bno }"/>';
		
	var replyUL = $(".chat");		
	var replyPageFooter = $(".panel-footer");

	var pageNum = 1;
	var replyCnt2 = 0;
	
	
	showList(1);
	showReplyPage(1);
	
	function showList(page){

		
		replyService.getList({bno:bnoValue, page:page|| 1}, function(replyCnt, list){

			replyCnt2 = replyCnt;
			
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			
			var str = ""; 
			
			if(list == null || list.length == 0){
				
				replyUL.html("");
				
				return;
			}
			
			
			len = list.length || 0;
			for(var i = 0; i < len; i++){
				str += '<li class="left clearfix" data-rno = "'+list[i].rno+'">';
				str += '<div>';
				str += '<div class="header">';
				str += '<strong class="primary-font">'+list[i].replyer+'</strong>';
				str += '<small class="pull-right text-muted">'+replyService.displayTime(list[i].replyDate)+'</small>';
				str += '</div>';
				str += '<p>'+list[i].reply+'</p>';
				str += '</div>';
				str += '<hr>';
				str += '</li>';			
			}
			
			replyUL.html(str);
			
			showReplyPage(replyCnt);
			
		});


	}
			
	//모달창 띄우기
	var modal = $(".modal");
	var modalInputReply = $('#reply');
	var modalInputReplyer = $('#replyer');
	var modalInputReplyDate = $('#replyDate');
	
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#addReplyBtn").on("click", function(e){

		modalInputReply.val('');
		modalInputReplyer.val('');
		modalInputReplyDate.val('');		
		
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id != 'modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		
		modal.modal("show");
	});
	
	modalRegisterBtn.on("click",function(){
		var reply = {
				reply:modalInputReply.val(),
				replyer:modalInputReplyer.val(),
				bno:bnoValue
		};
		
		replyService.add(
				reply,
				function(result){

					modalInputReply.val('');
					modalInputReplyer.val('');
					modalInputReplyDate.val('');	
					
					modal.modal("hide");
					
					showList(-1);
				});
	});
	
	//목록을 클릭하면
	$(".chat").on("click", "li", function(){
		var rno = $(this).data("rno");
		replyService.get(rno, function(reply){
			
			modalInputReplyDate.closest("div").show();
			
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate));
			
			modal.data("rno", reply.rno);
			
			modal.find("button[id != 'modalCloseBtn']").hide();
			
			modalModBtn.show();
			modalRemoveBtn.show();
			
			modal.modal("show");
		});
	});
	
	modalModBtn.on("click", function(){
		
		var rno = modal.data("rno");
		
		if(!replyer){
			alert("로그인후 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		var originalReplyer = modalInputReplyer.val();
		
		if(replyer != originalReplyer){
			alert("자신이 작성한 댓글만 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		var reply = {
				rno:rno,
				reply:modalInputReply.val(),
				replyer:originalReplyer
		};
		
		replyService.update(
				reply,
				function(result){

					modalInputReply.val('');
					modalInputReplyer.val('');
					modalInputReplyDate.val('');	
					
					modal.modal("hide");
					
					showList(pageNum);
				});
	});
	
	modalRemoveBtn.on("click", function(){
		
		var rno = modal.data("rno");
		
		console.log("RNO:" + rno);
		console.log("REPLYER:" + replyer);
		
		if(!replyer){
			alert("로그인후 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		var originalReplyer = modalInputReplyer.val();
		
		if(replyer != originalReplyer){
			alert("자신이 작성한 댓글만 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		var endNum = Math.ceil(pageNum / 10.0) *10;
		
		replyCnt2 = replyCnt2 -1;
		
		if(endNum * 10 >= replyCnt2){
			endNum = Math.ceil(replyCnt2/10.0);
		}
		
		replyService.remove(rno, originalReplyer, function(result){
			alert(result);

			modalInputReply.val('');
			modalInputReplyer.val('');
			modalInputReplyDate.val('');	
			
			modal.modal("hide");
			
			if(pageNum > endNum){
				pageNum = pageNum-1;
			} 
			
			showList(pageNum);
		});
		
	});
	
	
	function showReplyPage(replyCnt){
		var endNum = Math.ceil(pageNum / 10.0) *10;
		var startNum = endNum -9;
		
		var prev = startNum != 1;
		var next = false;

		if(endNum * 10 >= replyCnt){
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt){
			next = true;
		}

		var str = "<div class='text-right'><ul class='pagination'>";
		if(prev){
			
			str += "<li class='page-item'><a class='page-link' href='"+(startNum - 1) + "'>Previous</a></li>";
		}

		console.log("startNum:" + startNum);
		console.log("endNum:" + endNum);
		
		for(var i = startNum ; i <= endNum; i++){
			var active = pageNum == i?"active":"";
			str += "<li class='page-item "+active+"'><a class='page-link' href='"+i + "'>"+i+"</a></li>";	
		}

		if(next){
			
			str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1) + "'>Next</a></li>";
		}
		str += "</ul></div>";
		//console.log(str);
		replyPageFooter.html(str);
	}
	
	replyPageFooter.on("click", "li a", function(e){
		e.preventDefault();
		
		var targetPageNum = $(this).attr("href");
		
		pageNum = targetPageNum;
		
		showList(pageNum);
	});
	
	////////////////////////////////////////////////////////////////////
	
	let uploadResult = $(".uploadResult ul");
	
	(function(){
		$.getJSON("/board/getAttachList", {bno: bnoValue}, function(uploadResultArr){
			
			let str = "";
			
			$(uploadResultArr).each(function(i, obj){
				
				let fileDownPath = obj.uploadPath+"/"+obj.uuid+"_"+encodeURIComponent(obj.fileName);
				//console.log(obj);
				
				//일반파일
				if(obj.fileType != '1'){
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'>";
					str += "<div><span>" + obj.fileName + "</span>";
					str += "<img src='/resources/assets/images/attach.png'></div>"
					str += "</li>"
				} else {
					//이미지파일
					let fileCallPath = encodeURIComponent(obj.uploadPath + "/thum_"+obj.uuid+"_"+obj.fileName);
					
					fileDownPath = fileDownPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<img src='/display?fileName="+fileCallPath+"'>"
					str += "</div></li>"
				}
			});
			
			uploadResult.append(str);
		});	
	})();
	
	
	$(".uploadResult").on("click", "li", function(){
		let liObj = $(this);
		
		let path = encodeURIComponent(liObj.data('path')+"/"+liObj.data('uuid')+"_"+liObj.data('filename'));
		
		
		if(liObj.data('type')){
			showImage(path.replace(new RegExp(/\\/g), "/"));
		} else {
			self.location = "/download?fileName="+path;
		}
	});
	

	$(".bigPictureWrapper").on("click", function(){
		$(".bigPicture").animate({width:'0%',height:'0%'}, 1000);
		setTimeout(()=>{
			$(this).hide();
		}, 1000);
	});
	
});//$(document).ready(function(){
	
	
function showImage(fileCallPath){
	$(".bigPictureWrapper").css("display","flex").show();
	
	$(".bigPicture").html("<img src='/display?fileName="+fileCallPath+"'>")
	.animate({width:'100%',height:'100%'}, 1000);
}	
</script>

<%@ include file="../includes/footer.jsp" %>