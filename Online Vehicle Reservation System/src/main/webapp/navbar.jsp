<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/navbar.css">

</head>
<body>
	<nav class="main-style">
		<div class="logo-style">
			<a href="">
				<h2 class="title-style">
					<span>O</span>nline<span>V</span>ehicle<span>R</span>eservation
				</h2>
			</a>
		</div>
		<div class="menu-style">
			<ul class="tab-style">
				<li><a href="">Home</a></li>
				<li><a href="">Get a Quote</a></li>
				<li>
				<%if(session.getAttribute("userType")=="user"){ %>
				<a href="frontend/user/login.jsp">Hi, ${user_name}</a>
				<%}else if(session.getAttribute("userType")=="owner"){ %>
				<a href="frontend/owner/login.jsp">Hi, ${owner_name}</a>
				<%}else{ %>
				<a href="frontend/user/login.jsp">User Login</a>
				<%} %>
				</li>
				<li>
				<%if(session.getAttribute("userType")=="user"){ %>
				<form action="<%= request.getContextPath() %>/logout">
					<input type = "submit" value = "Logout" style="cursor: pointer; padding: 16px 32px; border: none;">
				</form>
				<%}else if(session.getAttribute("userType")=="owner"){ %>
				<form action="<%= request.getContextPath() %>/ownerLogout">
		<input type = "submit" value = "Logout" style="cursor: pointer; padding: 16px 32px; border: none;">
	
	</form>
				<%}else{ %>
				<a href="frontend/owner/login.jsp">Owner Login</a>
				<%} %>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>