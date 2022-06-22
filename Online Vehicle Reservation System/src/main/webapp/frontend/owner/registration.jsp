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
	<header class="header">
        <div class="logo-style">
			<a href="../../index.jsp" style="text-decoration: none;">
				<h2 class="title-style">
					<span>O</span>nline<span>V</span>ehicle<span>R</span>eservation
				</h2>
			</a>
		</div>

      <nav class="navbar">
        
        <ul class="navbar-list">
          <li><a class="navbar-link" href="../../index.jsp">Home</a></li>
          
        </ul>
      </nav>

      <div class="mobile-navbar-btn">
        <ion-icon name="menu-outline" class="mobile-nav-icon"></ion-icon>
        <ion-icon name="close-outline" class="mobile-nav-icon"></ion-icon>
      </div>
    </header>
	<div class="main">

		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
					
						<form method="post" action="<%= request.getContextPath() %>/Registration" class="register-form" onsubmit="return validation()" >
							<p id="empty_name" style="color: red;"></p>
							<div class="form-group">
								<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label> 
								<input type="text" name="name" id="name" placeholder="Full name" >	
							</div>
							<%
								if(request.getParameter("email")!=null){
									if(request.getParameter("email").equals("exists")){
										out.println("*Email Already Exists*");
									}
								}
							%>
							<p id="empty_email" style="color: red;"></p>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> 
								<input type="email" name="email" id="email" placeholder="Email" >
							</div>
							<p id="empty_password" style="color: red;"></p>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> 
								<input type="password" name="pass" id="pass" placeholder="Password" >
							</div>
							<span id="incorrect_pwd" style="color: red;"></span>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass" placeholder="Re-enter your password" >
							</div>
							<p id="empty_num" style="color: red;"></p>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-phone"></i></label>
								<input type="text" name="contact" id="contact" placeholder="Contact no" >
							</div>
							
							
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img alt="" src="../../images/signup-image.jpg">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already a member</a>
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
		var username = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var pwd = document.getElementById("pass").value;
		var confirm_pwd = document.getElementById("re_pass").value;
		var phone = document.getElementById("contact").value;
		
		
		if(username == ""){
			//alert("Please enter email address");
			document.getElementById("empty_name").innerHTML = "*Please enter your name*";
			return false;
		}
		if((username.length <= 2) || (username.length > 20)) {
			document.getElementById('empty_name').innerHTML =" ** Username lenght must be between 2 and 20";
			return false;	
		}
		if(!isNaN(username)){
			document.getElementById('empty_name').innerHTML =" ** only characters are allowed";
			return false;
		}
		
		if(email == ""){
			//alert("Please enter email address");
			document.getElementById("empty_email").innerHTML = "*Please enter your email address*";
			return false;
		}
		if(email.indexOf('@')<=0){
			//alert("Please enter email address");
			document.getElementById("empty_email").innerHTML = "*Invalid @ position*";
			return false;
		}
		if((email.charAt(email.length-4)!='.') && (email.charAt(email.length-3)!='.')){
			//alert("Please enter email address");
			document.getElementById("empty_email").innerHTML = "*Invalid email sturcture*";
			return false;
		}
		
		if(pwd == ""){
			//alert("Please enter email address");
			document.getElementById("empty_password").innerHTML = "*Please enter password*";
			return false;
		}
		if((pwd.length <= 5) || (pwd.length > 20)) {
			document.getElementById('empty_password').innerHTML =" ** Passwords lenght must be between 6 and 20";
			return false;	
		}
		
		if(pwd!=confirm_pwd){
			document.getElementById('incorrect_pwd').innerHTML =" ** Password does not match the confirm password";
			return false;
		}
		if(confirm_pwd == ""){
			//alert("Please enter email address");
			document.getElementById("incorrect_pwd").innerHTML = "*Please enter password*";
			return false;
		}
		
		if(phone == ""){
			//alert("Please enter email address");
			document.getElementById("empty_num").innerHTML = "*Please enter your phone number*";
			return false;
		}
		if(isNaN(phone)){
			document.getElementById('empty_num').innerHTML =" ** user must write digits only not characters";
			return false;
		}
		if((phone.length <= 9) || (phone.length > 13)) {
			document.getElementById('empty_num').innerHTML =" *Invalid phone number*";
			return false;	
		}
	}
</script>
</body>
</html>