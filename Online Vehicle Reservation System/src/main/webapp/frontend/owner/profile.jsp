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
	<div id="main-content">
	<div class="main-content-header">
		<h1 class="left"><i class="fa fa-user"></i> Profile</h1>
		<div class="clear"></div>
	</div>
	
	<div class="main-content-body">
	<form action="<%= request.getContextPath() %>/owner/profile" method="post" enctype="multipart/form-data" id="owner-profile-form">
	<input type="hidden" name="ownerId" value="${owner.id}">
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
			<th><label>Profile Image: </label></th>
			<td>
				<input type="file" name="profile_image" required>
				<%-- <img src="<%= ImageUtil.getImagePath(request) %>${owner.profileImage}" width=200> --%>
				<img src="<%= request.getContextPath() %>/owner/profile-image" width="200">	
			</td>
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