<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="includes/header.jsp" %>




  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">profile</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body">
						<div class="m-b-lg">
							<small>								
							</small>
						</div>
						<form id="frm" class="form-horizontal" action="/memberGet" method="Post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						
							<div class="form-group">
								<label for="userid" class="col-sm-3 control-label">userid:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="userid" id="userid" placeholder="" readonly="readonly" value="${member.userid}">
								</div>
							</div>
							<div class="form-group">
								<label for="userpw" class="col-sm-3 control-label">userpw:</label>
								<div class="col-sm-9 control-label text-left">
								****
								</div>
							</div>
							<div class="form-group">
								<label for="username" class="col-sm-3 control-label">username:</label>
								<div class="col-sm-9 control-label text-left">
								<input type="text" class="form-control" name="username" id="username" placeholder=""  value="${member.username}">
								<small id="msg3"></small>								
								</div>
							</div>
							<div class="form-group">
								<label for="useremail" class="col-sm-3 control-label">useremail:</label>
								<div class="col-sm-9 control-label text-left">
								<input type="text" class="form-control" name="useremail" id="useremail" placeholder="" value="${member.useremail}">
								<small id="msg4"></small>																
								</div>
							</div>
							<div class="form-group">
								<label for="regDate" class="col-sm-3 control-label">RegDate:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="regDate" id="regDate" placeholder="" disabled="disabled" value='<fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />'>
								</div>
							</div>
							<div class="form-group">
								<label for="updateDate" class="col-sm-3 control-label">UpdateDate:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="updateDate" id="updateDate" placeholder="" disabled="disabled" value='<fmt:formatDate value="${member.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" />'>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									
								<a href="/memberGet">
								<button type="submit" data-oper="modify" class="btn btn-success btn-sm">Modify</button>	
								</a>
						</form>
						
						<a href="/"><button type="button" class="btn btn-success btn-sm"> DashBoard</button></a>
<!-- 									<a href="list${cri.listLink }" role="button" data-oper="list" class="btn btn-default btn-sm">List</a> -->
								</div>
							</div>
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- END column -->

			
		</div><!-- .row -->
		
		<script>
	$(document).ready(function(){

		let isId = true;
		let isPassword = true;
		let isName = true;
		
		
		
		
		$("#name").on("keyup", function(){
			if($(this).val().length < 0  || $(this).val().length > 30){
				$("#msg3").html("0 ~ 30글자를 입력해주세요.");
				$("#msg3").css("color","#f00");
				isName = false;

			}
			else{
					let regPass = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
					if(regPass.test($(this).val())){ 
						$("#msg3").html("한글만 입력하세요");
						$("#msg3").css("color","#f00");	
						isName = false;

					}else{
						$("#msg3").html("");
						isName = true;

					}
				}
		});
		
		$("#useremail").on("keyup", function(){
			
			let regPass =/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
			if(!regPass.test($(this).val())){ // 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐 경우
				$("#msg4").html("email + @ + domain + .com");
				$("#msg4").css("color","#f00");	
				isPassword = false;
			}else{
				$("#msg4").html("");
				isPassword = true;

			}
		}
	);	
		
		
		/* alert("회원정보수정 완료되었습니다.");
		$('#frm').submit(); */
	});

		
		
	
		</script>
<%@ include file="includes/footer.jsp" %>