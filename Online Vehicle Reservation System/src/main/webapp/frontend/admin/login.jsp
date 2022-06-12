<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="admin-loginbox">
		<img src="" class="user">
		<h2>Administrator</h2>
		<form action="<%= request.getContextPath() %>/adminLogin" method="post">
			<p>Username</p>
			<input type="text" name="username" placeholder="Enter Username" required>
			<p>Password</p>
			<input type="password" name="password" placeholder="**********" required>
			<input type="submit" value="Sign In">
		</form>
	</div>
</body>
</html>