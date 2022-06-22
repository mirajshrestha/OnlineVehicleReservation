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
    <li><a href="vehicle.jsp"><b>Vehicles</b></a></li>
    <li><a href="bookings.jsp">Bookings</a></li>
    <li><a href="<%= request.getContextPath() %>/ownerLogout">Log Out</a></li>
  </ul>
  <div class="clear"></div>
</div>

  </div>
  <div class="wrapper">
    <div id="maincontent">
      <div class="contentainer">
        <div class="page-header">Vehicle Management | <a href="add-vehicle.jsp" class="btn btn-primary">Add Vehicles</a></div>
        <div class="content-box">
        	<table class="table table-striped">
  			 <thead>
			    <tr>
			      <th scope="col">SN</th>
			      <th scope="col">Photo</th>
			      <th scope="col">Manufacturer</th>
			      <th scope="col">Model</th>
			      <th scope="col">Feature Status</th>
			      <th scope="col">Date From / To</th>
			      <th scope="col">Options</th>
			    </tr>
			  </thead>
			  <tbody>
                        <%@page import="java.sql.*" %>
                        <% 
                        	System.out.println(session.getAttribute("owner_id"));
                        	String id = session.getAttribute("owner_id").toString();
                            Connection conn = null;
                        	int count = 1;
                            try {
                    			Class.forName("com.mysql.cj.jdbc.Driver");
                    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
                    			PreparedStatement pst = conn.prepareStatement("Select * from vehicles where owner_id=?");
                    			pst.setString(1, id);
                    			ResultSet rs = pst.executeQuery();
                    			while(rs.next()){
                        %>
                 <tbody>
			    <tr>
			      <th scope="row"><%=count++%></th>
			      <td><img src="<%= request.getContextPath() +"/images/"+ rs.getString(10)%>" height="100"/></td>
			      <td><%=rs.getString(2) %></td>
			      <td><%=rs.getString(3) %></td>
			      <td><%if(rs.getString("feature_status")== null){ %>
                                        <a href="request-feature.jsp?id=<%=rs.getString(1)%>" class="btn btn-success">Request</a>
                                        <%}else if(rs.getString("feature_status")!= null){%>
                                        <%=rs.getString("feature_status") %>
                                        <%} %></td>
			      <td><%=rs.getString(5)%><br>-<br><%=rs.getString(6) %></td>
			      <td><a class="btn btn-secondary" href="edit-vehicle.jsp?id=<%=rs.getString(1) %>">Edit</a> <a class="btn btn-danger" href="delete.jsp?id=<%=rs.getString(1) %>">Delete</a></td>
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
  </div>
  <div class="push"></div>
</div>
<script type="text/javascript">

</script>
</body>
	

</html>
