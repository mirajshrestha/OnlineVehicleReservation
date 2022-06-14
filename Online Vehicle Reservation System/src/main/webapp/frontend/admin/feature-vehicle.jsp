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
		<a href="<%=request.getContextPath()%>/admin/logout">Logout</a> | <a
			href="<%= request.getContextPath() %>/admin/change-password">Change Password</a>
	</div>
	<div class="clear"></div>
</div>
<ul id="nav">
  <li><a href="" class=""><i class="zmdi zmdi-view-dashboard"></i> Dashboard</a></li>
  <!-- <li><a href="#" class="menulink"><i class="fa fa-book"></i> CMS</a></li>  --> 
</ul>
<div class="clear"></div>

<div id="nav-wrapper">
  <ul id="subnav">
    <li><a href="../../index.jsp" target="_blank">Preview Site</a></li>
    <li><a href="owners.jsp">Owners List</a></li>
    <li><a href="feature-vehicle.jsp"><b>Feature Vehicle Requests</b></a></li>
    <li><a href="">Change Password</a></li>
    <li><a href="">Log Out</a></li>
  </ul>
  <div class="clear"></div>
</div>

  </div>
  <div class="wrapper">
    <div id="maincontent">
      <div class="contentainer">
        <table class="table table-striped">
  			<thead>
			    <tr>
			      <th scope="col">SN</th>
			      <th scope="col">Vehicle Model</th>
			      <th scope="col">Manufacturer</th>
			      <th scope="col">Owner</th>
			      <th scope="col">Details</th>
			      <th scope="col">Options</th>
			    </tr>
			  </thead>
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
			  <tbody>
			    <tr>
			      <th scope="row"><%=count++%></th>
			      <td><%=rs.getString("Model")%></td>
			      <td><%=rs.getString("Manufacturer")%></td>
			      <td><%=rs.getString("owners.name")%></td>
			      <td><a href="" class="btn btn-info">Full Details</a></td>
			      <td><a href="accept-request.jsp?id=<%=rs.getString("vehicle_id") %>" class="btn btn-success">Accept</a>
			      <a href="reject-request.jsp?id=<%=rs.getString("vehicle_id") %>" class="btn btn-danger">Reject</a></td>
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
  </div>
  <div class="push"></div>
</div>
</body>