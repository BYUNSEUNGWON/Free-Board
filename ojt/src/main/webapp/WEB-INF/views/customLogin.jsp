<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="simple-page-form animated flipInY" id="login-form">
	<h4 class="form-title m-b-xl text-center">Sign In With Your Infinity Account</h4>


	<form method="post" action="/login">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		<div class="form-group">
			<input id="username" type="text" name="username" required="required" class="form-control" placeholder="username">
		</div>

		<div class="form-group">
			<input id="password" type="password" name="password" required="required" class="form-control" placeholder="Password">
		</div>

		<div class="form-group m-b-xl">
			<div class="checkbox checkbox-primary">
				<input type="checkbox" name="remember-me" id="keep_me_logged_in"/>
				<label for="keep_me_logged_in">Remember Me</label>
			</div>
		</div>
		<input type="submit" class="btn btn-primary" value="SING IN">
	</form>
</div><!-- #login-form -->

<form method="post" action="sign">
<div class="simple-page-footer">
	<p>
		<a href="/forget">Forget password ?</a>
		<a href="/sign">CREATE AN ACCOUNT</a>
	</p>
</div><!-- .simple-page-footer -->
</form>

	</div><!-- .simple-page-wrap -->
	

</body>


</html>


   