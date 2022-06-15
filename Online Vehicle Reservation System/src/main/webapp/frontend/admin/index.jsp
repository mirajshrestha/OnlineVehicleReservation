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
    <li><a href="feature-vehicle.jsp">Feature Vehicle Requests</a></li>
    <li><a href="change-password.jsp">Change Password</a></li>
    <li><a href="<%=request.getContextPath()%>/adminLogout">Log Out</a></li>
  </ul>
  <div class="clear"></div>
</div>

  </div>
  <div class="wrapper">
    <div id="maincontent">
      <div class="contentainer">
        <div class="page-header">Welcome To Admin Dashboard</div>
        <div class="content-box">You have Sucessfully Logged in.<br />
          Please use the Navigation to manage your website.</div>
      </div>
      <div class="contentainer">
        <div class="page-header1">Security Alert</div>
        <div class="content-box">Please do not forget to logout after managing your website.</div>
      </div>
    </div>
  </div>
  <div class="push"></div>
</div>
<script type="text/javascript">
<%
if(request.getParameter("pass")!=null){
	if(request.getParameter("pass").equals("changed")){%>
		alert("Password successfully updated!!");<%
	}
}
%>
</script>
</body>
