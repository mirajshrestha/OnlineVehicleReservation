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
<%@page import="java.sql.*" %>
<% 
String id = request.getParameter("id");
Connection conn = null;
try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			PreparedStatement pst = conn.prepareStatement("Select * from vehicles where vehicle_id='"+id+"'");
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
%>
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
        <div class="page-header">Edit Vehicle</div>
        <div class="content-box">
        	<form method="post" action="<%= request.getContextPath() %>/udpateVehicle" >
        	<input type ="hidden" name ="v_id" value="<%=rs.getInt(1)%>">
			  <div class="form-group row">
			    <label for="inputEmail3" class="col-sm-2 col-form-label">Manufacturer</label>
			    <div class="col-sm-10">
			      <input type="text" name="manufacturer" value="<%=rs.getString(2) %>" class="form-control" id="inputEmail3">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword3" class="col-sm-2 col-form-label">Model</label>
			    <div class="col-sm-10">
			      <input type="text" name="model" value="<%=rs.getString(3) %>" class="form-control" id="inputPassword3">
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">Daily Fare</label>
			    <div class="col-sm-10">
			      <input type="text" name="daily_fare" value="<%=rs.getString(4) %>" class="form-control" id="inputEmail3">
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">From Date</label>
			    <div class="col-sm-10">
			      <input type="date" name="from_date" class="form-control" value="<%=rs.getString(5) %>" id="disable_date" onchange="disableAnother()">
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">To Date</label>
			    <div class="col-sm-10">
			      <input type="date" name="to_date" value="<%=rs.getString(6) %>" class="form-control" id="next_date">
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">Vehicle Available Location: </label>
			    <div class="col-sm-10">
			      <select name="vehicle_current_location">
								<option value="">---Select Location--</option>
								<option value="1">Kathmandu</option>
								<option value="2">Bhaktapur</option>
								<option value="3">Lalitpur</option>
								<option value="4">Makawanpur</option>
								<option value="5">Dhading</option>
								<option value="6">Accham</option>					
							</select>
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">Description</label>
			    <div class="col-sm-10">
			      <textarea name="description" rows="5"></textarea>
			    </div>
			  </div>
			  <div class="form-group row">
			  	<label for="inputEmail3" class="col-sm-2 col-form-label">&nbsp;</label>
			    <div class="col-sm-10">
			      <button type="submit" class="btn btn-primary">Save</button>
			    </div>
			  </div>
			</form>
        </div>
      </div>
      
    </div>
  </div>
  <div class="push"></div>
</div>
<%}}
catch(Exception e){						
	}%>
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

var minDate = year + "-" + month + "-" + tdate;
document.getElementById("disable_date").setAttribute('min', minDate);



function disableAnother(){
	var fromDate = document.getElementById("disable_date").value;
	console.log("From Date = " + fromDate);
	document.getElementById("next_date").setAttribute('min', fromDate);
}
</script>
</body>
	

</html>
