<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style_quote.css">
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
<%
	if(session.getAttribute("userType")!="user"){
		response.sendRedirect("../user/login.jsp");
	}

	String email = (String)session.getAttribute("email");

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
		PreparedStatement pst = conn.prepareStatement("select * from users where email ='"+email+"' ");
		ResultSet rs = pst.executeQuery();
		while(rs.next()){
	
%>

<div id="content">
<form action="<%= request.getContextPath() %>/confirmBooking" method="post" enctype="multipart/form-data" id="" style="
    margin: 5rem;
    border: 1px solid #cecaca;
    padding: 3rem;
">
	<h2>Personal Details</h2>
	<table class="form-table">
		<tr>
			<td>
				<label>Full Name:</label>
				<input type="text" name="fullname" value="<%=rs.getString("name") %>" required>
			</td>
			<td>
				<label>Contact No:</label>
				<input type="text" name="contact_no" value="<%=rs.getString("contact") %>" required>
			</td>
			<td>
				<label>Address:</label>
				<input type="text" name="location" value="<%=rs.getString("address") %>" required>
			</td>
		</tr>
		<tr><td colspan=3><h3>Driver License</h3></td></tr>
		<tr>
			<td>
				
			<%--	<% if(rs.getString("license_name") != null){ %>
					Already Uploaded
				<% } else { %>
				<input type="file" name="driving_license" required>
				<% } %>
				<input type="file" name="driving_license" >
			   --%>	
				
				<img alt="" src="<%= request.getContextPath() +"/doc_images/"+ rs.getString(7)%>" width="300" height="200">
				
			</td>
		</tr>

	</table>
	
<%
		}}
		catch(Exception e){
			e.printStackTrace();
		}
%>
<% 

	String id = request.getParameter("vehicle_id");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
		PreparedStatement pst = conn.prepareStatement("select vehicles.*, owners.name from vehicles JOIN owners ON owners.owner_id = vehicles.owner_id where vehicle_id ='"+id+"' ");
		ResultSet rs = pst.executeQuery();
		while(rs.next()){
%>
	<h2>Booking Details</h2>

	<table class="form-table">
		<tr>
			<td>
				<label>Vehicle Location:</label>
				<input type="text" value="<%=rs.getString("currentlocation") %>" disabled>
			</td>
		</tr>
		<tr>
			<td>
				<label>From Date:</label>
				<% System.out.println(session.getAttribute("booking_date_from")); %>
				<input type="hidden" name="from_date" value="<%= session.getAttribute("booking_date_from") %>" id="d1" >
				<input type="date" value="<%= session.getAttribute("booking_date_from") %>" disabled>
				
			</td>
			<td>
				<label>To Date:</label>
				<input type="date" name="to_date" value="" id="d2" onchange = "calculate_days()">
			</td>
		</tr>
		<tr><td colspan=2><h3>Vehicle Details</h3></td></tr>
		<tr>
			<td>
				<img src="<%= request.getContextPath() +"/images/"+ rs.getString(10)%>" class="booking-details-car-image" width="300" height="200">
			</td>
			<td>
				<table class="fancy-table">
					<tr>
						<td class="odd"><input type="hidden" value="<%=rs.getString("vehicle_id") %>"  style="border:none;" name="vehicleid"></td>
					</tr>
					<tr>
						<th class="odd">Vehicle Model</th>
						<td class="odd"><input type="text" value="<%=rs.getString("Model") %>"  style="border:none;"disabled></td>
					</tr>
					<tr>
						<th class="even">Manufacturer</th>
						<td class="even"><%=rs.getString("Manufacturer")%></td>
					</tr>
					<tr>
						<th class="odd">Vehicle Owner</th>
						<td class="odd"><input type="hidden" value="<%=rs.getString("owner_id")%>" name ="owner">
						<input type="text" value="<%=rs.getString("owners.name")%>" style="border:none;" disabled></td>
					</tr>
					<tr>
						<th class="even">Daily Fare</th>
						<td class="even" id="rate"><%=rs.getString("dailyfare") %></td>
					</tr>
				
					<tr>
						<th class="odd">Booked Days</th>
						<td class="odd">
							<input type="hidden" name="days" value="" id="days-input">
							<span id="days" style="font-size: 1.5rem;">-</span>
						</td>
					</tr>
					<tr>
						<th class="even">Total Fare</th>
						<td class="even">
							<input type="hidden" name="total_fare" id="total-fare-input">
							<span id="total_fare" style="font-size: 1.5rem;">-</span>
						</td>
					</tr>
					<tr>
						<th class="odd">Additional Message</th>
						<td class="odd"><textarea name="additional_message"></textarea></td>
					</tr>
					<tr>
						<th class="even">Pay By</th>
						<td class="even">
							<input type="radio" name="payment_method" value="cash" checked> Cash
						</td>
					</tr>
					<tr>
						<th>&nbsp;</th>
						<td><input type="submit" value="Confirm Booking" style="width:100%"></td>
					</tr>
					<%
		}}
		catch(Exception e){
			e.printStackTrace();
		}
%>
				</table>
			</td>
		</tr>
	</table>
</form>
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
<script>
var fromDate = document.getElementById("d1").value;
document.getElementById("d2").setAttribute('min', fromDate);


function calculate_days(){
	var date1 = new Date(document.getElementById('d1').value);
	var date2 = new Date(document.getElementById('d2').value);

	var Difference_In_Time = date2.getTime() - date1.getTime(); 
	var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);
	
	document.getElementById("days").innerHTML= Difference_In_Days;
	document.getElementById("days-input").value = Difference_In_Days;

	var fare = document.getElementById('rate').innerHTML;
	var total_price = Difference_In_Days *  fare;
	
	//alert(total_price);
	
	
	//var days = document.getElementById('days').value;
	//var fare = document.getElementById('rate').value;
	
	//var total_price = days * fare;
	//alert(total_price);
	document.getElementById("total_fare").innerHTML= total_price;
	document.getElementById("total-fare-input").value = total_price;

	
}

</script>
</body>
</html>
