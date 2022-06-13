
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
		if(session.getAttribute("userType")=="user"){
			response.sendRedirect("index.jsp");
		}
	%>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
				<div class="signin-image">
						<figure>
							
						</figure>
						<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">User Login</h2>
						<form method="post" action="<%= request.getContextPath() %>/login" class="register-form" id="login-form" onsubmit="return validation()">
						<%
								if(request.getParameter("email")!=null){
									if(request.getParameter("email").equals("invalid")){
										out.println("*Invalid email/password*");
									}
								}
							%>
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
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me"
									class="agree-term" /> <label for="remember-me"
									class="label-agree-term"><span><span></span></span>Remember
									me</label>
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