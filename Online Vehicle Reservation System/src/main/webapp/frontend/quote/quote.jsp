<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	session.setAttribute("booking_date_from", request.getParameter("date"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style_quote.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

<title>Insert title here</title>
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
<h2 style="padding: 38px; text-align: center;">--- Available Vehicles ---
</h2>
<%-- <table class="" style="border: 1px solid black">
                       	<thead>
                            <tr>
                                <th width=3%>SN</th>
								<th width=15%>Photo</th>
								<th width=13%>Manufacturer</th>
								<th width=10%>Model</th>
								<th width=10%>Daily Fare</th>
								<th width=15%>Date From/To</th>
								<th width=15%>Options</th>
								
                            </tr>
                        </thead>
                        
                        <tbody>
                        <%@page import="java.sql.*" %>
                        <% 
                        int count = 1;
                		ResultSet rs;
                            Connection conn = null;
                            try {
                    			Class.forName("com.mysql.cj.jdbc.Driver");
                    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
                    			String combo1 = request.getParameter("combo1"); 
                        		String combo2 = request.getParameter("combo2");
                        		String date = request.getParameter("date");
                    			PreparedStatement pst = conn.prepareStatement("Select * From vehicles where currentlocation = ? And availablelocation=? and fromdate <= ? And todate >= ?");
                    			pst.setString(1, combo1);
                    			pst.setString(2, combo2);
                    			pst.setString(3, date);
                    			pst.setString(4, date);
                    			
                    			rs = pst.executeQuery();
                    			if(rs.next()){
                        %>
                           

                                <tr>
                                    <td>
                                        <%=count++%>
                                    </td>
                                    <td>
                                        <img src="<%= request.getContextPath() +"/images/"+ rs.getString("filename")%>" width="300" height="200"/>
                                    </td>
                                    <td>
                                        <%=rs.getString("Manufacturer") %>
                                    </td>
                                    <td>
                                        <%=rs.getString("Model") %>
                                    </td>
                                    <td>
                                         Rs. <%=rs.getString("dailyfare") %>
                                    </td>
                                    <td>
                                        <%=rs.getString("fromdate")%> to <%=rs.getString("todate") %>
                                    </td>
                                    <td><a href="">View Reviews</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="booking-details.jsp?vehicle_id=<%=rs.getString("vehicle_id") %>">Book this car</a></td>
                                </tr>
                            
                        </tbody>
						<%}else{%>
							<p>No results found.</p>
                    	<%}}
						catch(Exception e){
							e.printStackTrace();
						}
						%>
                    </table>--%>
 <%@page import="java.sql.*" %>
 <% 
                        int count = 1;
                		ResultSet rs;
                            Connection conn = null;
                            try {
                    			Class.forName("com.mysql.cj.jdbc.Driver");
                    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
                    			String combo1 = request.getParameter("combo1"); 
                        		String combo2 = request.getParameter("combo2");
                        		String date = request.getParameter("date");
                    			PreparedStatement pst = conn.prepareStatement("Select vehicles.*, (select count(*) from bookings where vehicle_id = vehicles.vehicle_id and for_date <= ? And to_date >= ?) as booking_count from vehicles where currentlocation = ? and fromdate <= ? And todate >= ? ");
                    			pst.setString(1, date);
                    			pst.setString(2, date);
                    			pst.setString(3, combo1);
                    			pst.setString(4, date);
                    			pst.setString(5, date);
                    			
                    			rs = pst.executeQuery();
                    			while(rs.next() && request.getAttribute("status")!= "booked"){
                    				if(rs.getInt("booking_count")>0){
                    					continue;
                    				}
                        %>                 
                        
                    <div class="wrapper">
                	
                <div class="view_main">
                    <div class="view_wrap list-view" style="display: block;">
                        <div class="view_item">
                            <div class="vi_left">
                                <img src="<%= request.getContextPath() +"/images/"+ rs.getString("filename")%>" />
                            </div>
                            <div class="vi_right">
                                <p class="Manufacturer"><%=rs.getString("Manufacturer") %></p>
                                <p class="Model"><%=rs.getString("Model") %></p>
                                <p class="DailyFare">Rs. <%=rs.getString("dailyfare") %></p>
                                <p class="FromTo"><%=rs.getString("fromdate")%> to <%=rs.getString("todate") %></p>
                                <a href="vehicle-details.jsp?vehicle_id=<%=rs.getString("vehicle_id") %>">View Details</a>
                                <a href="booking-details.jsp?vehicle_id=<%=rs.getString("vehicle_id") %>">Book this car</a>
                            </div>
                        </div>
                        <%-- <%= rs.getString("booking_count") %> --%>
                        
                       
            
                    </div>
                </div>
            </div>

							
                    	<%
                    	}}
						catch(Exception e){
							e.printStackTrace();
						}
						%>
						
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