<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<%@ include file="../includes/header.jsp" %>


  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Board Modify/Delete Page</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>								
							</small>
						</div>
						<form role="form" id="actionForm" action="/board/modify" method="post" class="form-horizontal">
							<input type="hidden" name="pageNum" value="${cri.pageNum }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="form-group">
								<label for="bno" class="col-sm-3 control-label">Bno:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="bno" id="bno" placeholder="" readonly="readonly" value="${board.bno}">
								</div>
							</div>
							<div class="form-group">
								<label for="title" class="col-sm-3 control-label">Title:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="title" id="title" placeholder="" required="required" value="${board.title}">
								</div>
							</div>
							<div class="form-group">
								<label for="content" class="col-sm-3 control-label">Text area:</label>
								<div class="col-sm-9">
									<textarea class="form-control" name="content" id="content" placeholder="" required="required">${board.content}</textarea>
								</div>
							</div>
							<div class="form-group">
								<label for="writer" class="col-sm-3 control-label">Writer:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="writer" id="writer" placeholder="" readonly="readonly" value="${board.writer}">
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
											<button type="submit" data-oper="remove" class="btn btn-default btn-sm">Remove</button>										
										</c:if>
									</sec:authorize>
									
									
									<button type="submit" data-oper="list" class="btn btn-info btn-sm">List</button>
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
						<div class="form-group uploadDiv">
							<input type="file" name="uploadFile" multiple="multiple">
						</div>
						<div class="uploadResult">
							<ul>
							
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</section><!-- #dash-content -->
</div><!-- .wrap -->
  

<script>
$(document).ready(function(){
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	var formObj = $("form[role=form]");
	
	
	let regex = new RegExp("(.*?)\.(png|gif|jpg|txt)$");
	let maxSize = 5242880;//5Mbyte
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	var cloneObj = $(".uploadDiv").clone();
	
	$(".uploadDiv").on("change","input[type=file]", function(){
		console.log("change");
		let formData = new FormData();
		
		let inputFile = $("input[name=uploadFile]");
		
		let files = inputFile[0].files;
		console.log(files);
		
		for(let i = 0; i < files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData:false,
			contentType:false,
			data:formData,
			type:'POST',
			dataType:'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success:function(result){
				console.log(result);
				/* input type=file 을 초기화 */
				$(".uploadDiv").html(cloneObj.html());
				
				/* ajax 결과값을 출력 */
				showUploadedFile(result);
				
			}
		});
		
		
	});
	
	let uploadResult = $(".uploadResult ul");
	
	function showUploadedFile(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}
		
		let str = "";
		
		$(uploadResultArr).each(function(i, obj){
			
			let fileDownPath = obj.uploadPath+"/"+obj.uuid+"_"+encodeURIComponent(obj.fileName);
			
			if(!obj.image){
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";
				str += "<div><span><a href='/download?fileName="+fileDownPath+"'>" + obj.fileName + "</a></span>";
				str += "<button type='button' data-file='"+fileDownPath+"' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>";
				str += "<img src='/resources/assets/images/attach.png'></div>"
				str += "</li>"
			} else {
				let fileCallPath = encodeURIComponent(obj.uploadPath + "/thum_"+obj.uuid+"_"+obj.fileName);
				
				fileDownPath = fileDownPath.replace(new RegExp(/\\/g), "/");
				str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'><div>";
				str += "<span><a href='/download?fileName="+fileDownPath+"'>" + obj.fileName + "</a></span>";
				str += "<button type='button' data-file='"+fileCallPath+"' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>";
				str += "<a href='javascript:showImage(\""+fileDownPath+"\")'><img src='/display?fileName="+fileCallPath+"'></a>"
				str += "</div></li>"
			}
		});
		
		uploadResult.append(str);
	}
	
	$("button[type=submit]").on("click", function(event){
		event.preventDefault();
		
		let operation = $(this).data('oper');
		
		if(operation === 'modify'){
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				let jobj = $(obj);
				
				let type = (jobj.data('type') == true)?"1":"0";

				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data('filename')+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data('uuid')+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data('path')+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+type+"'>";
			});
			
			formObj.append(str);
						
		} else if(operation === 'remove'){
			if(confirm("정말로 삭제하시겠습니까?")){
				$("#actionForm").attr("action", "/board/remove");
			} else {
				return false;
			}
		} else if(operation === 'list'){
			$("#actionForm").attr("action", "/board/list");
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
		
		formObj.submit();
	});
	
	var bnoValue = '<c:out value="${board.bno }"/>';
	
	//let uploadResult = $(".uploadResult ul");
	
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
					str += "<button type='button' data-file='"+fileDownPath+"' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>";
					str += "<img src='/resources/assets/images/attach.png'></div>"
					str += "</li>"
				} else {
					//이미지파일
					let fileCallPath = encodeURIComponent(obj.uploadPath + "/thum_"+obj.uuid+"_"+obj.fileName);
					
					fileDownPath = fileDownPath.replace(new RegExp(/\\/g), "/");
					str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-fileName='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
					str += "<span>" + obj.fileName + "</span>";
					str += "<button type='button' data-file='"+fileDownPath+"' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button>";
					str += "<img src='/display?fileName="+fileCallPath+"'>"
					str += "</div></li>"
				}
			});
			
			uploadResult.append(str);
		});	
	})();
	
	
	$(".uploadResult").on("click","button", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			$(this).closest("li").remove();
		}
	});
	
	
});//$(document).ready(function(){
</script>


<%@ include file="../includes/footer.jsp" %>


