<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="user.css">

<title>Insert title here</title>
<%
		if(session.getAttribute("userType")!="user"){
			response.sendRedirect("login.jsp");
			return;
		}
	%>
</head>
<body>

	
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
                    <li><a href="../../index.jsp">Get a Quote</a></li>
                    <li><a href="../user/login.jsp">Hi, ${user_name}</a></li>
                    <li><form action="<%= request.getContextPath() %>/logout">
		<input type = "submit" value = "Logout" style="cursor: pointer; padding: 16px 32px; border: none;">
	
	</form></li>
                </ul>
            </div>
        </nav>
    </nav>
	<%-- Welcome ${email}--%>
	
	
	<div id="content">
<br>
	<h1 style="text-align: center;">Booking History</h1>
	<br>

	<table class="fancy-data-table full-width" cellspacing=0>
	
		<tr class="header">
			<th width=5%>SN</th>
			<th width=10%>Car Image</th>
			<th>Car Model</th>
			<th>Booked Location</th>
			<th>Booked For Date</th>
			<th>Booked Days</th>
			<th>Amount</th>
			<th>Options</th>
		</tr>
		<%@page import="java.sql.*" %>
		<% 
         System.out.println("fronend/index.jsp-user_id = " + session.getAttribute("user_id"));
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
				<td><%=rs.getString("vehicles.currentlocation")%></td>
				<td><%=rs.getString("for_date")%></td>
				<td><%=rs.getString("booked_days")%> day(s)</td>
				<td>Rs.<%=rs.getString("total_fare")%></td>
				<td><a href="review.jsp?booking_id=<%= rs.getInt("booking_id") %>" class="btn">Write a review</a>
				<a href="cancel-booking.jsp?booking_id=<%= rs.getInt("booking_id") %>" class="btn">Cancel Booking</a>
				</td>
			</tr>
	<%}}
		catch(Exception e){
			e.printStackTrace();
		}
     %>	
		
	
	</table>

</div>
<script type="text/javascript">
<%
if(request.getParameter("booking")!=null){
	if(request.getParameter("booking").equals("success")){
%>
		alert("Booking cancelled successfully!");
<%
	}
}
%>
</script>
</body>
</html>