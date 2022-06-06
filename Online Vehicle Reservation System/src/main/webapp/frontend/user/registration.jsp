<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" href="../../assests/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="../../assests/css/style.css">
</head>
<body>
	<div class="main">

		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="<%= request.getContextPath() %>/register" class="register-form"
							id="register-form" enctype="multipart/form-data">
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="name" id="name" placeholder="Full name" required>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> 
								<input type="email" name="email" id="email" placeholder="Email" required>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> 
								<input type="password" name="pass" id="pass" placeholder="Password" required>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass" placeholder="Re-enter your password" required>
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="contact" id="contact" placeholder="Contact no" required>
							</div>
							<div class="form-group">
								<label for="address"><i class="zmdi zmdi-pin"></i></label>
								<input type="text" name="address" id="address" placeholder="Address" required>
							</div>
							<b>Upload Driving License</b><br><br>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-file"></i></label>
								
								<input type="file" name="driving_license" >
							</div>
							
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already a member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
</body>
</html>