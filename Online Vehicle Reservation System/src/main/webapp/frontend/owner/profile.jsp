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
    <li><a href="profile.jsp"><b>Profile</b></a></li>
    <li><a href="vehicle.jsp">Vehicles</a></li>
    <li><a href="bookings.jsp">Bookings</a></li>
    <li><a href="<%= request.getContextPath() %>/ownerLogout">Log Out</a></li>
  </ul>
  <div class="clear"></div>
</div>

  </div>
  <div class="wrapper">
    <div id="maincontent">
      <div class="contentainer">
        <div class="page-header">Profile</div>
        <div class="content-box">
        	<form method="post" action="updateOwner.jsp" >
        	<input type="hidden" name="ownerId" value="${owner_id}">
			  <div class="form-group row">
			    <label for="inputEmail3" class="col-sm-2 col-form-label">Full Name</label>
			    <div class="col-sm-10">
			      <input type="text" name="fname" value="${owner_name}" class="form-control" id="inputEmail3">
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword3" class="col-sm-2 col-form-label">Phone No.</label>
			    <div class="col-sm-10">
			      <input type="text" name="phone" value="${owner_phone}" class="form-control" id="inputPassword3">
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
			    <div class="col-sm-10">
			      <input type="email" name="email" value="${email}" class="form-control" id="inputEmail3" disabled>
			    </div>
			  </div>
			  <div class="form-group row">
			  	<label for="inputEmail3" class="col-sm-2 col-form-label">&nbsp;</label>
			    <div class="col-sm-10">
			      <button type="submit" class="btn btn-primary">Update Profile</button>
			    </div>
			  </div>
			</form>
        </div>
      </div>
      
    </div>
  </div>
  <div class="push"></div>
</div>
<script type="text/javascript">

</script>
</body>
	
</body>
</html>
</body>
</html>