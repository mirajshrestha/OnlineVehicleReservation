<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assests/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="user.css">
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
					<div class="page-header"> Write Vehicle Review</div>
					<div class="content-box">
					<%@page import="java.sql.*" %>
		<% 
         String id = request.getParameter("booking_id");
         Connection conn = null;
         int count = 1;
         try {
         		Class.forName("com.mysql.cj.jdbc.Driver");
         		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
         		PreparedStatement pst = conn.prepareStatement("Select bookings.* from bookings where booking_id='"+id+"' ");
         		ResultSet rs = pst.executeQuery();
         		while(rs.next()){
         %>
						<form action="<%= request.getContextPath() %>/reviews" method="post">
							 <input type="hidden" name="booking_id" value="<%= rs.getInt("booking_id") %>">
	<input type="hidden" id="reviewed_date" name="review_date">
						<table>			
						<tr>
						
							<th style="width:20%">Review:</th>
							<td><textarea rows="10" name="review"></textarea></td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td><input type="submit" value="Save Review" class="btn btn-success"></td>
						</tr>
						</table>
						</form>
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
var date = new Date();
var tdate = date.getDate();
var month = date.getMonth() + 1;
var year = date.getUTCFullYear();

if(tdate<10){
	tdate = "0" + tdate;
}
if(month<10){
	month = "0" + month;
}

var today = year + "-" + month + "-" + tdate;
document.getElementById('reviewed_date').value=today;

</script>
</body>
</html>