<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
		<div class="simple-page-form animated flipInY" id="reset-password-form">
	<h4 class="form-title m-b-xl text-center">Forgot Your Password ?</h4>
	<h1>비밀번호 찾기</h1>
    <form action="/forget" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        이메일 주소: <input type="email" id="useremail" name="useremail" required>
        <br>
      	새 비밀번호:<input type="password" id="userpw" name ="userpw">
      	<div class="row">
			<div class="col-sm-9 col-sm-offset-3">
				<button type="submit" class="btn btn-success" >비밀번호 변경</button>
			</div>
		</div>
    </form>
</div><!-- #reset-password-form -->

	</div><!-- .simple-page-wrap -->
</body>
</html>