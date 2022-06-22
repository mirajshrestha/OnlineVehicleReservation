<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="owner.css">
<title>Insert title here</title>
</head>
<body>
<%
		if(session.getAttribute("email")==null){
			response.sendRedirect("login.jsp");
		}
	%>
	 <header>
	 <nav class="nav-bar">
                    <nav class="main-style">
                        <div class="logo-style">
                            <a href="">
                                <h2 class="title-style">
                                    <span>O</span>nline<span>V</span>ehicle<span>R</span>eservation
                                </h2>
                            </a>
                        </div>
                        <div class="menu-style">
                            <ul class="tab-style">
                                <li><a href="">Home</a></li>
                                <li><a href="">Get a Quote</a></li>
                                <li><a href="../owner/login.jsp">Hi, ${owner_name}</a></li>
                    <li><form action="<%= request.getContextPath() %>/ownerLogout">
					<input type = "submit" value = "Logout" style="cursor: pointer; padding: 16px 32px; border: none;">
					</form>
					</li>
                            </ul>
                        </div>
                    </nav>
                <nav>
                    <div>
                        <h1>Add a Vehicle</h1>
                    </div>
                </nav>
            </header>
            <br>
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <form method="post" action="<%= request.getContextPath() %>/addVehicle" class="" id="" enctype="multipart/form-data" onsubmit="return validation()">
							<table class="form-table">
								<tr>
									<th><label>Manufacturer: </label></th>
									<td><input type="text" name="manufacturer" value="" id="manufacturer"><br>
									<span id="empty_name" style="color: red; font-size:10px;"></span></td>
									
								</tr>
								
								<tr>
									<th><label>Model: </label></th>
									<td><input type="text" name="model" value=""id="model"><br>
									<span id="empty_model" style="color: red; font-size:10px;"></span></td>
								</tr>
								<tr>
									<th><label>Daily Fare: </label></th>
									<td><input type="text" name="daily_fare" value="" id="daily_fare"><br>
									<span id="empty_num" style="color: red; font-size:10px;"></span></td>
									
								</tr>
								<tr>
									<th><label>From Date: </label></th>
									<td><input type="date" name="from_date" id="disable_date" class="datepicker" value="" onchange="disableAnother()"><br>
									<span id="empty_date" style="color: red; font-size:10px;"></span></td>
								</tr>
								<tr>
									<th><label>To Date: </label></th>
									<td><input type="date" name="to_date" id="next_date" class="datepicker" value=""><br>
									<span id="empty_ndate" style="color: red; font-size:10px;"></span></td>
								</tr>
								<tr>
									<th><label>Vehicle Current Location: </label></th>
									<td>
										<select name="vehicle_current_location" id="vehicle_current_location">
											<option value="">---Select Location--</option>
											<option value="Kathmandu">Kathmandu</option>
											<option value="Bhaktapur">Bhaktapur</option>
											<option value="Lalitpur">Lalitpur</option>
											<option value="Makawanpur">Makawanpur</option>
											<option value="Dhading">Dhading</option>
											<option value="Accham">Accham</option>					
										</select>
										<br>
									<span id="empty_location" style="color: red; font-size:10px;"></span>
									</td>
								</tr>
								
								
								<tr>
									<th><label>Description: </label></th>
									<td>
										<textarea name="description" id="describe"></textarea>
									</td>
								</tr>
								<tr>
									<th>Vehicle Photos</th>
									<th>
										<input type="file" name="image" width=200>
									</th>
								</tr>
								<tr>
									<th>
										<input type="hidden" name="owner" value="<%=session.getAttribute("owner_id")%>">
									</th>
								</tr>
								<tr>
									<th>&nbsp;</th>
									<td><button type="submit" class="btn">Save</button></td>
								</tr>	
							</table>
						</form>
                    </div>
                </div>
            </div>
            
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
	
	
	//console.log(minDate);
	function validation(){
		//alert('Hello');
		var manufacturer = document.getElementById("manufacturer").value;
		var model = document.getElementById("model").value;
		var daily_fare = document.getElementById("daily_fare").value;
		var disable_date = document.getElementById("disable_date").value;
		var next_date = document.getElementById("next_date").value;
		var vehicle_current_location = document.getElementById("vehicle_current_location").value;
		var end_location = document.getElementById("end_location").value;
		
		
		if(manufacturer == ""){
			document.getElementById("empty_name").innerHTML = "*Please enter details*";
			return false;
		}
		if(model == ""){
			document.getElementById("empty_model").innerHTML = "*Please enter details*";
			return false;
		}
		if(daily_fare == ""){
			//alert("Please enter email address");
			document.getElementById("empty_num").innerHTML = "*Please enter number*";
			return false;
		}
		if(isNaN(daily_fare)){
			document.getElementById('empty_num').innerHTML =" ** user must write digits only not characters";
			return false;
		}
		if(disable_date == ""){
			document.getElementById("empty_date").innerHTML = "*Please enter details*";
			return false;
		}
		if(next_date == ""){
			document.getElementById("empty_ndate").innerHTML = "*Please enter details*";
			return false;
		}
		if(vehicle_current_location == ""){
			document.getElementById("empty_location").innerHTML = "*Please enter details*";
			return false;
		}
		if(end_location == ""){
			document.getElementById("empty_nlocation").innerHTML = "*Please enter details*";
			return false;
		}
		
	}
</script>
            
</body>
</html> --%>
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
        <div class="page-header">Add new Vehicle</div>
        <div class="content-box">
        	<form method="post" action="<%= request.getContextPath() %>/addVehicle" enctype="multipart/form-data" onsubmit="return validation()" >
        	<input type="hidden" name="owner" value="<%=session.getAttribute("owner_id")%>">
			  <div class="form-group row">
			    <label for="inputEmail3" class="col-sm-2 col-form-label">Manufacturer</label>
			    <div class="col-sm-10">
			      <span id="empty_name" style="color: red; font-size:10px;"></span>
			      <input type="text" name="manufacturer" id="manufacturer" class="form-control"><br>
				
			    </div>
			  </div>
			  <div class="form-group row">
			    <label for="inputPassword3" class="col-sm-2 col-form-label">Model</label>
			    <div class="col-sm-10">
			    <span id="empty_model" style="color: red; font-size:10px;"></span>
			      <input type="text" name="model" value=""id="model" class="form-control"><br>
					
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">Daily Fare</label>
			    <div class="col-sm-10">
			    <span id="empty_num" style="color: red; font-size:10px;"></span>
			      <input type="text" name="daily_fare" value="" id="daily_fare" class="form-control"><br>
				
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">From Date</label>
			    <div class="col-sm-10">
			    <span id="empty_date" style="color: red; font-size:10px;"></span>
			      <input type="date" name="from_date" id="disable_date" class="form-control" value="" onchange="disableAnother()"><br>
				
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">To Date</label>
			    <div class="col-sm-10">
			    <span id="empty_ndate" style="color: red; font-size:10px;"></span>
			     <input type="date" name="to_date" id="next_date" class="form-control" value=""><br>
				
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">Vehicle Available Location </label>
			    <div class="col-sm-10">
			    <span id="empty_location" style="color: red; font-size:10px;"></span>
			      <select name="vehicle_current_location" id="vehicle_current_location">
								<option value="">---Select Location--</option>
								<option value="Kathmandu">Kathmandu</option>
								<option value="Bhaktapur">Bhaktapur</option>
								<option value="Lalitpur">Lalitpur</option>
								<option value="Makawanpur">Makawanpur</option>
								<option value="Dhading">Dhading</option>
								<option value="Accham">Accham</option>					
							</select>
					
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">Description</label>
			    <div class="col-sm-10">
			      <textarea name="description" id="describe"></textarea>
			    </div>
			  </div>
			  <div class="form-group row">
    			<label for="inputEmail3" class="col-sm-2 col-form-label">Vehicle Photo</label>
			    <div class="col-sm-10">
			      <input type="file" name="image" width=200>
			    </div>
			  </div>
			  <br>
			  <div class="form-group row">
			  	<label for="inputEmail3" class="col-sm-2 col-form-label">&nbsp;</label>
			    <div class="col-sm-10">
			      <button type="submit" class="btn btn-primary">Add Vehicle</button>
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
	
	
	//console.log(minDate);
	function validation(){
		//alert('Hello');
		var manufacturer = document.getElementById("manufacturer").value;
		var model = document.getElementById("model").value;
		var daily_fare = document.getElementById("daily_fare").value;
		var disable_date = document.getElementById("disable_date").value;
		var next_date = document.getElementById("next_date").value;
		var vehicle_location = document.getElementById("vehicle_current_location").value;
		
		if(manufacturer == ""){
			//alert("Please enter details");
			document.getElementById("empty_name").innerHTML = "*Please enter details*";
			return false;
		}
		if(model == ""){
			document.getElementById("empty_model").innerHTML = "*Please enter details*";
			return false;
		}
		if(daily_fare == ""){
			//alert("what is this");
			document.getElementById("empty_num").innerHTML = "*Please enter rate*";
			return false;
		}
		if(isNaN(daily_fare)){
			//alert("Whatis this");
			document.getElementById("empty_num").innerHTML = "*User must write digits only not characters*";
			return false;
		}
		if(disable_date == ""){
			//alert("Whatis this");
			document.getElementById("empty_date").innerHTML = "*Please enter date*";
			return false;
		}
		if(next_date == ""){
			//alert("Whatis this");
			document.getElementById("empty_ndate").innerHTML = "*Please enter date*";
			return false;
		}
		if(vehicle_location == ""){
			//alert("Whatis this");
			document.getElementById("empty_location").innerHTML = "*Please enter location*";
			return false;
		}
		
		
	}
</script>
</body>
	

</html>
