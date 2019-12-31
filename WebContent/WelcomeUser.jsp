<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
		<title>Welcome</title>
		<style>
			body, html {
				height: 100%;
				margin: 0;
				font-family: Ariel, Helvetica, sans-serif;
			}
			.hero-image {
				background-image: url("https://images.unsplash.com/photo-1515378960530-7c0da6231fb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80");
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
		<%
		if(session.getAttribute("uname") == null){
			response.sendRedirect("Home.jsp");
		}
		else{
		
			
		String userName = session.getAttribute("uname").toString();
		
		String myfirstname = "";
		String mylastname = "";
		int roleid = 0;			
		
		request.getSession(false);
			if(session == null) {
				
			} else {
				String url = "jdbc:postgresql://ec2-54-235-246-201.compute-1.amazonaws.com/d712a16gfjlf2i";
				String username = "qpvmvoqkxifbdv";
				String password = "7bb011180f5880de08fe6c69f68647a5a8409ccc13528729b792dcdee7df9512";
				Connection con = null;
				Statement statement = null;
				try {
					con = DriverManager.getConnection(url, username, password);
					statement = con.createStatement();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				ResultSet set = null;
				try {
					set = statement.executeQuery("SELECT * FROM users WHERE username = '" + userName + "'");
					while(set.next()) {
						myfirstname = set.getString("firstname");
						mylastname = set.getString("lastname");
						roleid = set.getInt("roleid");
						session.setAttribute("roleid", roleid);
					}
			} catch (SQLException sqe) {
				sqe.printStackTrace();
			}
				
			
		%>
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

					<h1 class="text-center" style="font-size: 45px; font-family: Arial; color: white">Issue Ticketing System</h1>
	  				<h3 class="text-center" style="font-family: Arial; color: white"><%out.println("Welcome " + myfirstname + " " + mylastname);%></h3>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row mt-5">
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/IssueRequest.jsp" class="btn text-center p-4">
							<h5>Create Issue Request</h5>
						</a>
					</div>
				</div>
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/MyTickets.jsp" class="btn text-center p-4">
							<h5>View My Requests<%if(roleid == 1){ %> / Tickets<%} %></h5>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row mt-3">
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/DepartmentTickets.jsp" class="btn text-center p-4">
							<h5>View Department Requests<%if(roleid == 1){ %> / Tickets<%} %></h5>
						</a>
					</div>
				</div>
<%
					if(roleid == 1){
				%>
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/ViewQuestions.jsp" class="btn text-center p-4">
							<h5>View Questions to Administrator</h5>
						</a>
					</div>
				</div>
				<%}else{ %>
								<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/AskQuestion.jsp" class="btn text-center p-4">
							<h5>Ask Question to Administrator</h5>
						</a>
					</div>
				</div>
			</div>
		</div>
		<%
				}
			if(roleid == 1){
		%>
		<div class="container">
			<div class="row mt-3">
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/TicketForm.jsp" class="btn text-center p-4">
							<h5>Create Ticket</h5>
						</a>
					</div>
				</div>
				<div class="col-12 col-sm-6">
					<div class="card">
						<a href="http://localhost:8080/WebApplicationIssueTrackingSystem/ViewAllIssueRequests.jsp" class="btn text-center p-4">
							<h5>View All Requests / Tickets</h5>
						</a>
					</div>
				</div>
			</div>
		</div>
		<%
			}
		%>
		<div class="container mt-5">
			<button class="btn btn-danger" type="button"><a style="text-decoration: none; color:white" href="http://localhost:8080/WebApplicationIssueTrackingSystem/Home.jsp">Logout</a></button>
		</div>
		<% 		
			}
		}
  		%>
	</body>
</html>
