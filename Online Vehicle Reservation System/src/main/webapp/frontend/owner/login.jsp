
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign IN</title>

<link rel="stylesheet" href="../../assests/fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="../../css/style.css">
<link rel="stylesheet" href="../../assests/css/style.css">
</head>
<body>
	<%
		if(session.getAttribute("userType")=="owner"){
			response.sendRedirect("index.jsp");
		}
	%>
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img alt="" src="../../images/signin-image.jpg">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Owner Login</h2>
						<form method="post" action="<%= request.getContextPath() %>/ownerLogin" class="register-form"
							id="login-form" onsubmit="return validation()">
							<span id="empty_email" style="color: red;"></span>
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email"
									placeholder="Email" />
							</div>
							<span id="empty_pass" style="color: red;"></span>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="password"
									placeholder="Password" />
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin"
									class="form-submit" value="Log in" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>
<script type="text/javascript">
	//var status = document.getElementById("status").value;
	//if(status == "invalidEmail"){
		//alert("Please enter email");
	//}
	function validation(){
		var user = document.getElementById("email").value;
		var password = document.getElementById("password").value;
		
		if(user == ""){
			//alert("Please enter email address");
			document.getElementById("empty_email").innerHTML = "Please enter email address";
			return false;
		}
		if(password == ""){
			//alert("Please enter password");
			document.getElementById("empty_pass").innerHTML = "Please enter password";
			return false;
		}
	}
</script>
</body>

</html>