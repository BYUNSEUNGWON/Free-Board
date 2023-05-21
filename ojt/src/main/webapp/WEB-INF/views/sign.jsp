<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<head>
	<meta charset="UTF-8">
	<title>Infinity - Bootstrap Admin Template</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta name="description" content="Admin, Dashboard, Bootstrap" />
	<link rel="shortcut icon" sizes="196x196" href="/resources/assets/images/logo.png">
	
	<link rel="stylesheet" href="/resources/libs/bower/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/resources/libs/bower/material-design-iconic-font/dist/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="/resources/libs/bower/animate.css/animate.min.css">
	<link rel="stylesheet" href="/resources/assets/css/bootstrap.css">
	<link rel="stylesheet" href="/resources/assets/css/core.css">
	<link rel="stylesheet" href="/resources/assets/css/misc-pages.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,500,600,700,800,900,300">
	
	<script src="/resources/libs/bower/jquery/dist/jquery.js"></script>
	
</head>
<body class="simple-page">
	<div id="back-to-home">
		<a href="index.html" class="btn btn-outline btn-default"><i class="fa fa-home animated zoomIn"></i></a>
	</div>
	<div class="simple-page-wrap">
		<div class="simple-page-logo animated swing">
			<a href="index.html">
				<span><i class="fa fa-gg"></i></span>
				<span>Infinity</span>
			</a>
		</div><!-- logo -->
		<div class="simple-page-form animated flipInY" id="login-form">
	<h4 class="form-title m-b-xl text-center">회원가입</h4>
	
	<form id="frm" class="form-horizontal" method="post" action="/sign">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<div class="form-group" >	
								<label for="id" class="col-sm-3 control-label">아이디:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name = "userid" id="id" placeholder="6 ~ 12글자를 입력해주세요." maxlength="12">
									<small id="msg"></small>
								</div>
							</div>
							
							<div class="form-group">
								<label for="password" class="col-sm-3 control-label">비밀번호:</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" name="userpw" id="password" placeholder="영문자, 숫자, 특수문자 각각 1개이상으로 작성하세요." maxlength="12">
									<small id="msg2"></small>
								</div>
							</div>
							
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">이메일:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="useremail" id="useremail" placeholder="abc123@gmail.com" maxlength="30">
									<small id="msg4"></small>
								</div>
							</div>
							
							
							<div class="form-group">
								<label for="name" class="col-sm-3 control-label">이름:</label>
								<div class="col-sm-9">
									<input type="text" class="form-control" name="username" id="name" placeholder="" maxlength="30">
									<small id="msg3"></small>
								</div>
							</div>
							
							<div class="form-group">
								<label for="textarea1" class="col-sm-3 control-label">권한:</label>
								<div class="col-sm-9">
								<input type="radio" name="auth" id="role1" value="ROLE_USER" >USER
								<input type="radio" name="auth" id="role2" value="ROLE_ADMIN">ADMIN
								</div>
							</div>
							
							<div class="row">
								<div class="col-sm-9 col-sm-offset-3">
									<button type="submit" class="btn btn-success" >회원가입</button>
								</div>
							</div>
						</form>
						
		</div><!-- #login-form -->



	</div><!-- .simple-page-wrap -->
	
	<script>
	$(document).ready(function(){

		let isId = true;
		let isPassword = true;
		let isName = true;
		
		
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
		
		
		$("#password").on("keyup", function(){
			if($(this).val().length < 6  || $(this).val().length > 12){
				$("#msg2").html("6 ~ 12글자를 입력해주세요.");
				$("#msg2").css("color","#f00");
				isPassword = false;
			}
			else{
				let regPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,12}$/;
				if(!regPass.test($(this).val())){ // 영, 숫, 특을 포함하지 않았을 때
					$("#msg2").html("영, 숫, 특을 포함하세요");
					$("#msg2").css("color","#f00");	
					isPassword = false;

				}else{
					$("#msg2").html("");
					isPassword = true;

				}
			}
		});
		
		
		$("#id").on("keyup",function(){
			if($(this).val().length < 6 || $(this).val().length > 12){
				$("#msg").html("6 ~ 12글자를 입력해주세요.");
				$("#msg").css("color","#f00");
								
			}else{
				$("#msg").html('');				
			}
		});

		
		$("button[type=submit]").on("click",function(event){
			event.preventDefault();		
			
			
			let role1 = $("#role1").is(":checked");
			let role2 = $("#role2").is(":checked");
			
			/* 아이디 체크 */
			if($('#id').val()==''){
				alert("아이디를 입력하세요");
				$('#id').focus();
				return;
			}
			
			if($('#id').val().length < 6){
				alert("6~12글자를 입력하세요.");
				$('#id').focus();
				return;
			}

			/* 비밀번호 체크 */
			if($('#password').val()==''){
				alert("비밀번호를 입력하세요");
				$('#password').focus();
				return;
			}
			
			if($('#password').val().length < 6){
				alert("6~12글자를 입력하세요.");
				$('#password').focus();
				return;
			}
			
			if($('#useremail').val()==''){
				alert("email을 입력하세요");
				$('#useremail').focus();
				return;
			}
			

			if(!isPassword){
				alert("영, 숫, 특을 포함하세요");
				$('#password').focus();
				return;
			}
			
			
			if($('#name').val()==''){
				alert("이름을 입력하세요");
				$('#name').focus();
				return;
			}
			
			if(!isName){
				alert("한글만 입력하세요.");
				$('#name').focus();
				return;
			}
			

						
			if(role1 == false && role2 == false){
				alert("권한을 선택해주세요");
				document.getElementById('role1').focus();
				return;
			} 
			
				alert("회원가입이 완료되었습니다.");
				$('#frm').submit();
			
			
			//t.submit();
			
			});
		
		});
	
	</script>
	
</body>
</html>