<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("email")==null){
			response.sendRedirect("login.jsp");
		}
	%>
	HI OWNER ${email}
	<br>
	<hr>
	
	<a href ="profile.jsp">Profile</a><br>
	<a href ="vehicle.jsp">Vehicles</a><br>
	<a href ="bookings.jsp">Bookings</a>
	<form action="<%= request.getContextPath() %>/ownerLogout">
		<input type = "submit" value = "Logout">
	</form>
</body>
</html>