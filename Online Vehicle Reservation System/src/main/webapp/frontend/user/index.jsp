<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../../assests/bootstrap/css/bootstrap.min.css">
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
	
	
	<header class="header">
        <div class="logo-style">
			<a href="../../index.jsp" style="text-decoration: none;">
				<h2 class="title-style">
					<span>O</span>nline<span>V</span>ehicle<span>R</span>eservation
				</h2>
			</a>
		</div>

      <nav class="navbar">
        
        <ul class="navbar-list">
          <li><a class="navbar-link" href="../../index.jsp">Home</a></li>
          <li><a class="navbar-link" href="../../index.jsp">Get a Quote</a></li>
          <li>
          	<%if(session.getAttribute("userType")=="user"){ %>
          	<a class="navbar-link" href="../user/login.jsp">Hi, ${user_name}</a>
          	<%}else if(session.getAttribute("userType")=="owner"){ %>
          	<a class="navbar-link" href="../owner/login.jsp">Hi, ${owner_name}</a>
          	<%}else{ %>
          	<a class="navbar-link" href="../user/login.jsp">User Login</a>
          	<%} %>
          </li>
          <li>
          	<%if(session.getAttribute("userType")=="user"){ %>
				<form action="<%= request.getContextPath() %>/logout">
					<input type = "submit" value = "Logout" style="cursor: pointer; border: none; background: #ffffff;">
				</form>
				<%}else if(session.getAttribute("userType")=="owner"){ %>
				<form action="<%= request.getContextPath() %>/ownerLogout">
					<input type = "submit" value = "Logout" style="cursor: pointer; border: none; background: #ffffff;" >
				</form>
				<%}else{ %>
				<a class="navbar-link" href="../owner/login.jsp">Owner Login</a>
				<%} %>
          </li>
        </ul>
      </nav>

      <div class="mobile-navbar-btn">
        <ion-icon name="menu-outline" class="mobile-nav-icon"></ion-icon>
        <ion-icon name="close-outline" class="mobile-nav-icon"></ion-icon>
      </div>
    </header>
	<%-- Welcome ${email}--%>
	
	
	<div id="content">
<br>
	<h1 style="text-align: center;">Booking History</h1>
	
	<div class="main-content" style="margin: 5rem; font-size: 1.5rem; border: 1px solid #e0e0e0">
	<table class="table table-striped">
		<thead>
			    <tr>
			      <th scope="col">SN</th>
			      <th scope="col">Car Image</th>
			      <th scope="col">Car Model</th>
			      <th scope="col">Booked Location</th>
			      <th scope="col">Booked For Date</th>
			      <th scope="col">Booked Days</th>
			      <th scope="col">Amount</th>
			      <th scope="col">Options</th>
			    </tr>
			  </thead>
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
			  <tbody>
			    <tr>
			      <th scope="row"><%=count++%></th>
			      <td><img src="<%= request.getContextPath() +"/images/"+ rs.getString("vehicles.filename")%>" width=100></td>
			      <td><%=rs.getString("vehicles.Model")%></td>
			      <td><%=rs.getString("vehicles.currentlocation")%></td>
			      <td><%=rs.getString("for_date")%></td>
			      <td><%=rs.getString("booked_days")%> day(s)</td>
			      <td>Rs.<%=rs.getString("total_fare")%></td>
			      <td><a href="review.jsp?booking_id=<%= rs.getInt("booking_id") %>" class="btn btn-primary">Write a review</a>
			      <a href="cancel-booking.jsp?booking_id=<%= rs.getInt("booking_id") %>" class="btn btn-danger">Cancel Booking</a></td>
			    </tr>
			    </tbody>
			    <%}}
		catch(Exception e){
			e.printStackTrace();
		}
     %>
	</table>
	</div>

</div>
<script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>
    <script>
    const mobile_nav = document.querySelector(".mobile-navbar-btn");
    const nav_header = document.querySelector(".header");

    const toggleNavbar = () => {
      // alert("Plz Subscribe ");
      nav_header.classList.toggle("active");
    };

    mobile_nav.addEventListener("click", () => toggleNavbar());
    </script>
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