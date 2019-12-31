<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta charset="ISO-8859-1">
		<title>Issue Ticketing System</title>
		<style>
			body, html {
				height: 100%;
				margin: 0;
				font-family: Ariel, Helvetica, sans-serif;
			}
			.hero-image {
				/*background-image: url("file:///C:/Users/Zach/eclipse-workspace/WebApplicationIssueTrackingSystem/src/images/issuetrackingsyste.jpg");*/
				background-image: url("https://images.unsplash.com/photo-1556761175-4b46a572b786?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80");
				height: 50%;
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				position: relative;
				opacity: .7;
			}
		</style>
	</head>
	<body>
	<%session.invalidate(); %>
		<div class="hero-image">
			<div class="row h-100 justify-content-center align-items-center">
  				<div class="col-12">
					<h1 class="text-center" style="font-size: 45px; font-family: Arial; color: black">Issue Ticketing System</h1>
					<p class="text-center" style="font-size: 25px; font-family: Arial; color: black">Easily manage and maintain issues at your company. </p>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row mt-5">
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/login.jsp" class="btn text-center">
							Login
						</a>
					</div>
				</div>
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/signup.jsp" class="btn text-center">
							Sign Up
						</a>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>