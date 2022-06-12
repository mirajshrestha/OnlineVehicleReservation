<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
									<th><label>Vehicle Available For: </label></th>
									<td>
										<select name="end_location" style="" id="end_location">
										<option value="">---Select Location--</option>
											<option value="Kathmandu">Kathmandu</option>
											<option value="Bhaktapur">Bhaktapur</option>
											<option value="Lalitpur">Lalitpur</option>
											<option value="Makawanpur">Makawanpur</option>
											<option value="Dhading">Dhading</option>
											<option value="Accham">Accham</option>					
										</select>
										<br>
									<span id="empty_nlocation" style="color: red; font-size:10px;"></span>
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
			document.getElementById("empty_num").innerHTML = "*Please enter your phone number*";
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
</html>