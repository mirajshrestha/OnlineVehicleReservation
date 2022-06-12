<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="owner.css">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("email")==null){
			response.sendRedirect("login.jsp");
		}
		if(session.getAttribute("userType")!="owner"){
			response.sendRedirect("login.jsp");
		}
	%>
	<nav class="nav-bar">
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
                    <li><a href="../../index.jsp">Home</a></li>
                    <li><a href="">Get a Quote</a></li>
                    <li><a href="../owner/login.jsp">Hi, ${owner_name}</a></li>
                    <li><form action="<%= request.getContextPath() %>/ownerLogout">
					<input type = "submit" value = "Logout" style="cursor: pointer; padding: 16px 32px; border: none;">
					</form>
					</li>
                </ul>
            </div>
        </nav>
    </nav>
<%--	HI OWNER ${email} --%>
	<br>
	
	<div class="owner-index">
	
	<a href ="profile.jsp">Profile</a><br>
	<a href ="vehicle.jsp">Vehicles</a><br>
	<a href ="bookings.jsp">Bookings</a>
	</div>
</body>
</html>