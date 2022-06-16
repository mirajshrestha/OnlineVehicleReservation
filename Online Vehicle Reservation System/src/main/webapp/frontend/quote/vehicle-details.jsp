<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="content">
	

	<div id="search-results">
	<%@page import="java.sql.*" %>
 <% 
                        int count = 1;
                		ResultSet rs;
                            Connection conn = null;
                            try {
                    			Class.forName("com.mysql.cj.jdbc.Driver");
                    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
                    			String id = request.getParameter("vehicle_id");
                    			PreparedStatement pst = conn.prepareStatement("select vehicles.*, owners.name from vehicles JOIN owners ON owners.owner_id = vehicles.owner_id where vehicle_id ='"+id+"' ");
                    			
                    			rs = pst.executeQuery();
                    			while(rs.next()){
                        %>    
		
	
		<h2><a href="booking-details.jsp?vehicle_id=<%=rs.getString("vehicle_id") %>" class="btn right"><i class="fa fa-shopping-cart"></i> Book this car</a></h2>
		

		<img
			src="<%= request.getContextPath() +"/images/"+ rs.getString(10)%>" width="300" height="200">
		<br>
		<br>
		<strong>Vehicle Owner:</strong>
		<p><%= rs.getString("owners.name") %></a></p>

		<strong>Manufacturer:</strong>
		<p><%=rs.getString("Manufacturer")%></p>
		
		<strong>Available From Date:</strong>
		<p><%=rs.getString(5)%></p>
		
		<strong>Available To Date:</strong>
		<p><%=rs.getString(6) %></p>
		
		<strong>Vehicle Available:</strong>
		<p><%=rs.getString("currentlocation") %></p>
		
			
		<br>
		<h3>
			<strong>Daily Fare: </strong> Rs. <%=rs.getString("dailyfare") %>
		</h3>
		<br>
		<h2 id="vehicle-reviews">Vehicle Reviews</h2>
		<table class="fancy-table full-width">
		
		<tr>
			<td>
				<div class="review"></div>
				<div class="review-by" style="float: right">
					<h3></h3>
					<span></span>
				</div>
			</td>
		</tr>
		
			<tr><td>No reviews yet.</td></tr>
		
		</table>

<%
                    	}}
						catch(Exception e){
							e.printStackTrace();
						}
						%>

	</div>
	<div class="clear"></div>
</div>
</body>
</html>