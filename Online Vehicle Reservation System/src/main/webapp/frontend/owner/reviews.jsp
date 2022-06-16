<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="main-content">
	<div class="main-content-header">
		<h1 class="left"><i class="fa fa-edit"></i> Vehicle Reviews</h1>
		<div class="clear"></div>
	</div>
	
	<div class="main-content-body">
	<%@page import="java.sql.*" %>
	 <%
	 	ResultSet rs;
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			String id = request.getParameter("booking_id"); 
    		PreparedStatement pst = conn.prepareStatement("Select bookings.*, users.name from bookings JOIN users ON users.id = bookings.id where booking_id = '"+id+"' ");
                    			
    		rs = pst.executeQuery();
    		while(rs.next()){
    %> 
	<table class="fancy-table">
		
		<tr>
			<td>
				<%if(rs.getString("review").isEmpty()){ %>
				<div class="review">Review: No reviews yet.</div>
				<%}else{ %>
				<div class="review">Review: <%= rs.getString("review") %></div>
				<div class="review-by">
					<h2>Reviewd By:<%= rs.getString("users.name") %></h2>
					<span>Date: <%= rs.getString("review-date") %></span>
				</div>
				<%} %>
				
			</td>
		</tr>
		<%
                    	}}
						catch(Exception e){
							e.printStackTrace();
						}
						%>
		<tr><td></td></tr>
		
	</table>
	
	</div>
</div>
</body>
</html>