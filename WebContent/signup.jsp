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
		<title>Sign Up</title>
		<style>
			body, HTML {
				margin: 0;
				height: 100%;
				font-family: Ariel, Helvetica, sans-serif;
			}
			.hero-image {
				background-image: url("https://images.unsplash.com/photo-1498409785966-ab341407de6e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1060&q=80");
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
					<h1 class="text-center" style="color: white;font-size: 45px;">Sign Up</h1>
				</div>
			</div>
		</div>
		<div class="container mt-5 mb-5">
			<form method="post" id="signupform" action="SignUp">
				<div class="row">
					<div class="col-12 col-sm-6">
						<label>First Name</label>
						<input class="form-control" type="text" name="firstname" required />
					</div>
					<div class="col-12 col-sm-6">
						<label>Last Name</label>
						<input class="form-control" type="text" name="lastname" required />
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-12 col-sm-6">
						<label>Email Address</label>
						<input class="form-control" type="email" name="email" required />
					</div>
					<div class="col-12 col-sm-6">
						<label>Department</label>
						<select name="department" id="department" class="form-control" required>
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
				<div class="row mt-3">
					<div class="col-12 col-sm-6">
						<label>Job Title</label>
						<input class="form-control" type="text" name="jobtitle" required />
					</div>
					<div class="col-12 col-sm-6">
						<label>Username</label>
						<input class="form-control" type="text" name="uname" required />
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-12 col-sm-6">
						<label>Password</label>
						<input class="form-control" type="password" name="password" required />
					</div>
					<div class="col-12 col-sm-6">
						<label>Confirm Password</label>
						<input class="form-control" type="password" name="confirmpassword" required />
					</div>
				</div>
				<input class="btn btn-success btn-block mt-5" type="submit" value="Sign Up">
			</form>
		</div>
		<div id="error"></div>
	</body>
</html>
