<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.ResultSet" %>
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
		<title>Create an Issue Request</title>
		<style>
			body, html {
				height: 100%;
				margin: 0;
				font-family: Ariel, Helvetica, sans-serif;
			}
			.hero-image {
				background-image: url("https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80");
				height: 50%;
				background-position: center;
				background-repeat: no-repeat;
				background-size: cover;
				positon: relative;
				opacity: 0.7;
			}
		</style>
		<script>
			$(document).ready(function() {
				$("#createTicket").on("submit", function() {
					var priority = $("#priority").val();
					var user = $("#user").val();
					var department = $("#department").val();
				});
			});
		</script>
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
				<div class="col-12">
					<%
						request.getSession(false);
						if(session == null) {
							
						} else {
							Object name = session.getAttribute("uname");
					%>
					<h1 class="text-center" style="color: white;font-size: 45px;">Create an Issue Request</h1>
				</div>
			</div>
		</div>
		<div class="container mt-5 mb-5">
			<form class="form_control mt-2" id="createTicket" action="IssueRequest" method="post">
				<input type="hidden" name="uname" id="uname" value="<%out.println(name.toString()); %>" />
				<input type="hidden" name="status" id="status" value="0" />
				<div class="row">
					<div class="col-12 col-sm-6">
						<label>Request</label>
						<input type="text" class="form-control" name="request" id="request" required />
					</div>
					<div class="col-12 col-sm-6">
						<label>Department</label><br />
						<select class="form-control" name="department" id="department" required>
							<option value="">Choose a Department</option>
							<option value="Administration">Administration</option>
							<option value="Technology">Technology</option>
							<option value="Human Resources">Human Resources</option>
							<option value="Business Services">Business Services</option>
							<option value="Education">Education</option>
							<option value="Public Relations">Public Relations</option>
							<option value="Marketing Department">Marketing Department</option>
							<option value="Executive">Executive</option>
							<option value="Sales Department">Sales Department</option>
							<option value="Purchase Department">Purchase Department</option>
						</select>
					</div>
				</div>
				<div class="row pt-3">
					<div class="col-12 col-sm-6">
						<Label>Issue Request Description</Label>
						<textarea name="description" class="form-control" required></textarea>
					</div>
				</div>
				<button type="submit" class="form-control btn btn-success mt-3">Create Issue Request</button>
			</form>
		</div>
		<%
			}
		%>
		<div id="error"></div>
	</body>
</html>
