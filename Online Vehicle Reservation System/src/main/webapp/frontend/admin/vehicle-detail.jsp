<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Admin Dashboard | OVR</title>

<link rel="stylesheet" href="../../assests/bootstrap/css/bootstrap.min.css">




<!-- Font Awesome -->
<link rel="stylesheet" href="../../assests/fonts/material-icon/css/material-design-iconic-font.min.css" />
<link href="admin.css" rel="stylesheet" type="text/css" />


<script src="<%= request.getContextPath() %>/assets-admin/js/jquery.min.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/assets-admin/js/jquery.validate.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/assets-admin/js/tooltip.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/assets-admin/js/checks.js" type="text/javascript"></script>
<%
		if(session.getAttribute("userType")!="admin"){
			response.sendRedirect("login.jsp");
			return;
		}
	%>
</head>
<body>
<div id="main_wrapper">
  <div class="wrapper">
  	<div id="header">
	<div class="logo">
		<a href="./">
			<h1>Online Vehicle Reservation</h1>
		</a>
	</div>
	<div class="header-right">
		<span class="txt1">Hello Admin,</span> Welcome to your Dashboard <br />
		<a href="<%=request.getContextPath()%>/adminLogout">Logout</a> | <a
			href="change-password.jsp">Change Password</a>
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
    <li><a href="owners.jsp">Owners List</a></li>
    <li><a href="feature-vehicle.jsp"><b>Feature Vehicle Requests</b></a></li>
    <li><a href="change-password.jsp">Change Password</a></li>
    <li><a href="<%=request.getContextPath()%>/adminLogout">Log Out</a></li>
  </ul>
  <div class="clear"></div>
</div>

  </div>

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
         Connection conn = null;
         int count = 1;
         try {
         		Class.forName("com.mysql.cj.jdbc.Driver");
         		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
         		PreparedStatement pst = conn.prepareStatement("Select vehicles.*, owners.name from vehicles JOIN owners ON owners.owner_id = vehicles.owner_id where feature_status = 'Requested' ");
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
</body>