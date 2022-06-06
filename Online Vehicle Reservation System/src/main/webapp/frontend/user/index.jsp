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
	Welcome ${email}
	<a href="../../index.jsp">Home</a>
	<form action="<%= request.getContextPath() %>/logout">
		<input type = "submit" value = "Logout">
	
	</form>
	<div id="content">

	<h2>Booking History</h2>

	<table class="fancy-data-table full-width" cellspacing=0>
	
		<tr class="header">
			<th width=5%>SN</th>
			<th width=10%>Car Image</th>
			<th>Car Model</th>
			<th>Journey From/To</th>
			<th>Booked For Date</th>
			<th>Booked Days</th>
			<th>Amount Paid</th>
			<th>Options</th>
		</tr>
		<%@page import="java.sql.*" %>
		<% 
         System.out.println(session.getAttribute("user_id"));
         //String id = session.getAttribute("owner_id").toString();
         String id = session.getAttribute("user_id").toString();
         Connection conn = null;
         int count = 1;
         try {
         		Class.forName("com.mysql.cj.jdbc.Driver");
         		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
         		PreparedStatement pst = conn.prepareStatement("Select bookings.*, vehicles.filename, vehicles.Model, vehicles.currentlocation, vehicles.availablelocation from bookings JOIN vehicles ON vehicles.vehicle_id = bookings.vehicle_id where bookings.id='"+id+"' ");
         		ResultSet rs = pst.executeQuery();
         		while(rs.next()){
         %>
			<tr>
				<td><%=count++%></td>
				<td><img src="<%= request.getContextPath() +"/images/"+ rs.getString("vehicles.filename")%>" width=100></td>
				<td><%=rs.getString("vehicles.Model")%></td>
				<td><%=rs.getString("vehicles.currentlocation")%> / <%=rs.getString("vehicles.availablelocation")%></td>
				<td><%=rs.getString("for_date")%></td>
				<td><%=rs.getString("booked_days")%> day(s)</td>
				<td>Rs.<%=rs.getString("total_fare")%></td>
				<td><a href="" class="btn"><i class="fa fa-edit"></i> Write a review</a></td>
			</tr>
	<%}}
		catch(Exception e){
			e.printStackTrace();
		}
     %>	
		
	
	</table>

</div>
</body>
</html>