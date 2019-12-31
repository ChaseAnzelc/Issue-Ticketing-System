<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%if(session.getAttribute("uname") == null){
	response.sendRedirect("Home.jsp");
}
else{ %>
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<title>Questions for Administrators</title>
		<style>
			body, html {
				height: 100%;
				margin: 0;
				font-family: Ariel, Helvetica, sans-serif;
			}
			
			.hero-image {
				background-image: url("https://images.unsplash.com/photo-1496171367470-9ed9a91ea931?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80");
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
		<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
		  <ul class="navbar-nav">
		    <li class="nav-item active">
		      <a class="nav-link" href="http://localhost:8080/WebApplicationIssueTrackingSystem/WelcomeUser.jsp">Created Requests / Tickets</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="http://localhost:8080/WebApplicationIssueTrackingSystem/Assigned.jsp">Assigned Tickets</a>
		    </li>
		  </ul>
		</nav>
		<div class="hero-image">
			<div class="row h-100 justify-content-center align-items-center">
				<h1 class="text-center" style="color: black;font-size: 40px;">Ask a Question</h1>
			</div>
		</div>
		<div class="container mt-5 mb-5">
			<form id="askQuestion" action="AskQuestion" method="post">
				<div class="row">
					<div class="col-12 col-sm-6">
						Email: <input type="email" class="form-control" id="email" name="email" required>
					</div>
					<div class="col-12 col-sm-6">
						Question: <textarea rows="4" class="form-control" id="message" name="message" required></textarea>
					</div>
				</div>
	 			<input type="submit" class="btn-success form-control mt-4" value="Submit Question">
			</form>
		</div>
		<div class="container mt-5">
			<button class="btn btn-danger" type="button"><a style="text-decoration: none; color:white" href="http://localhost:8080/WebApplicationIssueTrackingSystem/Home.jsp">Logout</a></button>
		</div>
	</body>
	<%} %>
</html>
