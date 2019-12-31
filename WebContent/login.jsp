<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<title>Login</title>
		<style>
			body, html {
				height: 100%;
				margin: 0;
				font-family: Ariel, Helvetica, sans-serif;
			}
			.hero-image {
				background-image: url("https://images.unsplash.com/photo-1509822929063-6b6cfc9b42f2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80");
				height: 50%;
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				position: relative;
				opacity: 0.7;
			}
		</style>
	</head>
	<body>
		<div class="hero-image">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="col-12">
					<h1 class="text-center" style="color: white;font-size: 45px;">Login</h1>
				</div>
			</div>
		</div>
		<div class="container mt-5">
			<form action="Login" id="loginForm" method="post">
				<div class="row">
					<div class="col-12 col-sm-6">
						<label>User Name</label><br />
						<input class="form-control" type="text" name="uname" />
					</div>
					<div class="col-12 col-sm-6">
						<label>Password</label><br />
						<input class="form-control" type="password" name="upass">
					</div>
				</div>
				<input class="btn btn-success btn-block mt-5" type="submit" value="Login">
			</form>
		</div>
	</body>
</html>