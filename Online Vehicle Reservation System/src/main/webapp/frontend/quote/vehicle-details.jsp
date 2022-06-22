<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assests/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="style_quote.css">
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
    
    <div id="main_wrapper">
		<div class="wrapper">
		</div>
		<div class="wrapper">
			<div id="maincontent">

				<div class="contentainer">
					<div class="page-header">Vehicle Complete Details</div>
					<div class="content-box">
						
							  <%@page import="java.sql.*" %>
		<% 
		String id = request.getParameter("vehicle_id");
         Connection conn = null;
         int count = 1;
         try {
         		Class.forName("com.mysql.cj.jdbc.Driver");
         		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
         		PreparedStatement pst = conn.prepareStatement("Select vehicles.*, owners.name from vehicles JOIN owners ON owners.owner_id = vehicles.owner_id where vehicle_id = '"+id+"' ");
         		ResultSet rs = pst.executeQuery();
         		while(rs.next()){
         %>
						<table>			
						<tr>
							<th style="width:20%">Model</th>
							<td><%=rs.getString("Model")%></td>
						</tr>
						<tr>
							<th>Image</th>
							<td><img src="<%= request.getContextPath() +"/images/"+ rs.getString(10)%>" width="300"></td>
						</tr>
						<tr>
							<th>Vehicle Owner</th>
							<td><%= rs.getString("owners.name") %></td>
						</tr>
						<tr>
							<th>Manufacturer</th>
							<td><%=rs.getString("Manufacturer")%></td>
						</tr>
						<tr>
							<th>Available From Date</th>
							<td><%=rs.getString(5)%></td>
						</tr>
						<tr>
							<th>Available To Date</th>
							<td><%=rs.getString(6) %></td>
						</tr>
						<tr>
							<th>Vehicle Available</th>
							<td><%=rs.getString("currentlocation") %></td>
						</tr>
						<tr>
							<th>Daily Fare</th>
							<td>Rs. <%=rs.getString("dailyfare") %></td>
						</tr>
						
					
						</table>
					</div>
				</div>

<%}}
		catch(Exception e){
			e.printStackTrace();
		}
         %>


			</div>
		</div>
		<div class="push"></div>
	</div>
    
<div id="content">
	
<%--
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
</div> --%>
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
</body>
</html>