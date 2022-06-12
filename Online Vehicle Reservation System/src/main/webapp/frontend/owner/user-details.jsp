<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
		<% 
         String user = request.getParameter("user_id");
         Connection conn = null;
         int count = 1;
         try {
         		Class.forName("com.mysql.cj.jdbc.Driver");
         		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
         		PreparedStatement pst = conn.prepareStatement("Select * from users where id ='"+user+"' ");
         		ResultSet rs = pst.executeQuery();
         		while(rs.next()){
         %>
<div id="main-content">
	<div class="main-content-header">
		<h1 class="left"><i class="fa fa-user"></i> User Details</h1>
		<div class="clear"></div>
	</div>
	
	<div class="main-content-body">
	
	<table class="fancy-table">
		<tr>
			<th><label>Full Name: </label></th>
			<td><%= rs.getString("name") %></td>
		</tr>
		<tr>
			<th><label>Contact No.: </label></th>
			<td><%= rs.getString("contact") %></td>
		</tr>
		<tr>
			<th><label>Email: </label></th>
			<td><%= rs.getString("email") %>
		</tr>
		<tr>
			<th><label>Address: </label></th>
			<td><%= rs.getString("address") %>
		</tr>
	
		<tr>
			<th><label>Driving License</label></th>
			<td>
				<img src="<%= request.getContextPath() +"/doc_images/"+ rs.getString(7)%>" width="200">	
			</td>
		</tr>
		<%}}
		catch(Exception e){
			e.printStackTrace();
		}
     %>
		
	</table>
	
	</div>
</div>
</body>
</html>