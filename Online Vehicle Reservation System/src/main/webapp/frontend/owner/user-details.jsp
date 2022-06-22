<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Owner Dashboard | OVRS</title>
<link rel="stylesheet" href="../../assests/bootstrap/css/bootstrap.min.css">




<!-- Font Awesome -->
<link rel="stylesheet" href="../../assests/fonts/material-icon/css/material-design-iconic-font.min.css" />
<link href="owner.css" rel="stylesheet" type="text/css" />

<script src="<%= request.getContextPath() %>/assets-admin/js/jquery.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/assets-admin/js/jquery.validate.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/assets-admin/js/tooltip.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/assets-admin/js/checks.js" type="text/javascript"></script>
<%
		if(session.getAttribute("email")==null){
			response.sendRedirect("login.jsp");
		}
		if(session.getAttribute("userType")!="owner"){
			response.sendRedirect("login.jsp");
		}
	%>
</head>
<body>

<div id="main_wrapper">
  <div class="wrapper">
  	<div id="header">
	<div class="logo">
		<a href="../../index.jsp">
			<h1>Online Vehicle Reservation</h1>
		</a>
	</div>
	<div class="header-right">
		<span class="txt1">Hello ${owner_name},</span> Welcome to your Dashboard <br />
		<a href="<%= request.getContextPath() %>/ownerLogout">Logout</a> | <a
			href="profile.jsp">Update Profile</a>
	</div>
	<div class="clear"></div>
</div>
<ul id="nav">
  <li><a href="index.jsp" class=""><i class="zmdi zmdi-view-dashboard"></i> Dashboard</a></li>
  <!-- <li><a href="#" class="menulink"><i class="fa fa-book"></i> CMS</a></li>  --> 
</ul>
<div class="clear"></div>

<div id="nav-wrapper">
  <ul id="subnav">
    <li><a href="../../index.jsp" target="_blank">Preview Site</a></li>
    <li><a href="profile.jsp">Profile</a></li>
    <li><a href="vehicle.jsp">Vehicles</a></li>
    <li><a href="bookings.jsp"><b>Bookings</b></a></li>
    <li><a href="<%= request.getContextPath() %>/ownerLogout">Log Out</a></li>
  </ul>
  <div class="clear"></div>
</div>

  </div>
  <div class="wrapper">
    <div id="maincontent">
      <div class="contentainer">
        <div class="page-header">User Details</div>
        <div class="content-box">
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
        	<table>			
						<tr>
							<th style="width:20%">Full Name</th>
							<td><%= rs.getString("name") %></td>
						</tr>
						<tr>
							<th>Contact No.</th>
							<td><%= rs.getString("contact") %></td>
						</tr>
						<tr>
							<th>Email</th>
							<td><%= rs.getString("email") %></td>
						</tr>
						<tr>
							<th>Address</th>
							<td><%= rs.getString("address") %></td>
						</tr>
						<tr>
							<th>Driving License</th>
							<td><img src="<%= request.getContextPath() +"/doc_images/"+ rs.getString(7)%>" width="300"></td>
						</tr>
						
					<%}}
		catch(Exception e){
			e.printStackTrace();
		}
     %>
						</table>
        </div>
      </div>
      
    </div>
  </div>
  <div class="push"></div>
</div>
<script type="text/javascript">

</script>
</body>
	

</html>