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
                    <li><a href="">Home</a></li>
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
	<div id="main-content">
	<div class="main-content-header">
		<h1 class="left"><i class="fa fa-user"></i> Profile</h1>
		<div class="clear"></div>
	</div>
	
	<div class="main-content-body">
	<form method="post" action="updateOwner.jsp" >
	<input type="hidden" name="ownerId" value="${owner_id}">
	<table>
		<tr>
			<th><label>Full Name: </label></th>
			<td><input type="text" name="fname" value="${owner_name}" required></td>
		</tr>
		<tr>
			<th><label>Phone No.: </label></th>
			<td><input type="text" name="phone" value="${owner_phone}" required></td>
		</tr>
		<tr>
			<th><label>Email: </label></th>
			<td><input type="text" name="email" value="${email}" disabled></td>
		</tr>
	
		<tr>
			<th>&nbsp;</th>
			<td><button type="submit">Update Profile</button></td>
		</tr>	
	</table>
	</form>
	</div>
</div>

</body>
</html>