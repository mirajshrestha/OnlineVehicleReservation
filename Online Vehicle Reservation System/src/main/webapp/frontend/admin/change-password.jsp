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
    <li><a href="change-password.jsp"><b>Change Password</b></a></li>
    <li><a href="<%=request.getContextPath()%>/adminLogout">Log Out</a></li>
  </ul>
  <div class="clear"></div>
</div>

  </div>
  <div class="wrapper">
    <div id="maincontent">
      <div class="contentainer">
        <div class="page-header">Change Admin Password</div>
        <div class="content-box">
        <form action="<%= request.getContextPath() %>/changePassword" method="post" onsubmit="return validation()">
      		<table class="fancy-table">
      		
      			<tr>
      				<th>New Password</th>
      				<td><input type="password" name="new_pass" id="pass"></td>
      			</tr>
      			
      			<tr>
      				<th>Repeat New Password</th>
      				<td><input type="password" name="new_pass_r" id="re_pass"></td>
      			</tr>
      			 
      			<tr>
      				<th>&nbsp;</th>
      				<td><button type="submit">Change Password</button></td>
      			</tr>
      		
      		</table>  	
        </form>
        </div>
      </div>
      
    </div>
  </div>
  <div class="push"></div>
</div>
<script type="text/javascript">
function validation(){
var pwd = document.getElementById("pass").value;
var confirm_pwd = document.getElementById("re_pass").value;

if(pwd == ""){
	alert("Please enter password");
	//document.getElementById("empty_password").innerHTML = "*Please enter password*";
	return false;
}
if(pwd!=confirm_pwd){
	alert("Password does not match");
	//document.getElementById('incorrect_pwd').innerHTML =" ** Password does not match the confirm password";
	return false;
}
if(confirm_pwd == ""){
	alert("Please repeat password");
	//document.getElementById("incorrect_pwd").innerHTML = "*Please enter password*";
	return false;
}
}
</script>
</body>