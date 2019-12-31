<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<meta charset="ISO-8859-1">
		<title>Create a Ticket</title>
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
				positive: relative;
				opacity: 0.7;
			}
		</style>
		<script>
			$(document).ready(function() {
				$("#createTicket").on("submit", function() {
					var priority = $("#priority").val();
					var user = $("#user").val();
					var department = $("#department").val();
					if(priority == "") {
						alert("Priority is required. ");
					} else if(user == "") {
						alert("This ticket needs to be assigned to a staff member. ");
					} else if(department == "") {
						alert("Department is required. ");
					} 
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
							String url = "jdbc:postgresql://ec2-54-235-246-201.compute-1.amazonaws.com/d712a16gfjlf2i";
							String username = "qpvmvoqkxifbdv";
							String password = "7bb011180f5880de08fe6c69f68647a5a8409ccc13528729b792dcdee7df9512";
							Connection con = null;
							Statement statement = null;
					%>
					<h1 class="text-center" style="color: white;font-size: 45px;">Create a Ticket</h1>
				</div>
			</div>
		</div>	
		<div class="container mt-5 mb-5">
			<form class="form_-control mt-2" id="createTicket" action="CreateTicket" method="post">
				<input type="hidden" value="<%out.println(name.toString()); %>" name="uname" id="uname" />
				<input type="hidden" name="status" id="status" value="0" />
				<div class="row">
					<div class="col-12 col-sm-6">
						<label>Ticket Name</label>
						<input type="text" class="form-control" name="ticketname" id="ticketname" required />
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
							<option value="Maintenance Department">Maintenance Department</option>
							
						</select>
					</div>
				</div>
				<div class="row pt-3">
					<div class="col-12 col-sm-6">
						<label>Assigned To</label><br />
						<select class="form-control" name="user" id="user" required>
							<option value="">Assign to a Staff Member</option>
								<%
									try {
										con = DriverManager.getConnection(url, username, password);
										statement = con.createStatement();
									} catch (SQLException e1) {
										e1.printStackTrace();
									}
									ResultSet set = null;
									try {
										
										
										set = statement.executeQuery("SELECT * FROM Users");
										while(set.next()) {	
								%>
							<option value="<% out.println(set.getString("firstname") + " " + set.getString("lastname")); %>">
								<%
										out.println(set.getString("firstname")); out.println(set.getString("lastname"));
									}
								} catch(SQLException e) {
									e.printStackTrace();
								}
								%>
							</option>
						</select>
					</div>
					<div class="col-12 col-sm-6">
						<Label>Priority</Label><br />
						<select class="form-control" name="priority" id="priority" required>
							<option value="">Choose a Priority</option>
							<option value="Urgent">Urgent</option>
							<option value="High">High</option>
							<option value="Medium">Middle</option>
							<option value="Low">Low</option>
						</select>
					</div>
				</div>
				<div class="row pt-3">
					<div class="col-12 col-sm-6">
						<label>Preferred Completed Date</label>
						<input type="date" name="date" id="date" class="form-control" required />
					</div>
					<div class="col-12 col-sm-6">
						<Label>Issue Description</Label>
						<textarea name="description" id="description" class="form-control" required></textarea>
					</div>
				</div>
				<div class="row pt-3">
					<div class="col-12 col-sm-12">
						<label>Ticket for Issue Request</label>
						<select class="form-control" name="issuerequestid" required>
							<option value="">Select a Issue Request</option>
							<%
								ResultSet setTicketName = null;
								try {
									setTicketName = statement.executeQuery("SELECT id, request FROM issuerequests WHERE status = '0'");
									while(setTicketName.next()) {
							%>
							<option><%out.println(setTicketName.getString("request"));%></option>
							<% 
									}
								} catch (SQLException e) {
									e.printStackTrace();
								}
							%>
						</select>
					</div>
				</div>
				<button type="submit" class="form-control btn btn-success mt-3">Create Ticket</button>
			</form>
		</div>
		<%
			}
		%>
		<div id="error"></div>
	</body>
</html>
