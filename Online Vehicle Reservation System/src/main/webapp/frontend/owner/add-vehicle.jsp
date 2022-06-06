<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		if(session.getAttribute("email")==null){
			response.sendRedirect("login.jsp");
		}
	%>
	 <header>
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
                        <form method="post" action="<%= request.getContextPath() %>/addVehicle" class="" id="" enctype="multipart/form-data">
							<table class="form-table">
								<tr>
									<th><label>Manufacturer: </label></th>
									<td><input type="text" name="manufacturer" value=""></td>
								</tr>
								<tr>
									<th><label>Model: </label></th>
									<td><input type="text" name="model" value=""></td>
								</tr>
								<tr>
									<th><label>Daily Fare: </label></th>
									<td><input type="text" name="daily_fare" value=""></td>
								</tr>
								<tr>
									<th><label>From Date: </label></th>
									<td><input type="date" name="from_date" class="datepicker" value=""></td>
								</tr>
								<tr>
									<th><label>To Date: </label></th>
									<td><input type="date" name="to_date" class="datepicker" value=""></td>
								</tr>
								<tr>
									<th><label>Vehicle Current Location: </label></th>
									<td>
										<select name="vehicle_current_location">
											<option value="">---Select Location--</option>
											<option value="Kathmandu">Kathmandu</option>
											<option value="Bhaktapur">Bhaktapur</option>
											<option value="Lalitpur">Lalitpur</option>
											<option value="Makawanpur">Makawanpur</option>
											<option value="Dhading">Dhading</option>
											<option value="Accham">Accham</option>					
										</select>
									</td>
								</tr>
								
								<tr>
									<th><label>Vehicle Available For: </label></th>
									<td>
										<select name="end_location" style="">
										<option value="">---Select Location--</option>
											<option value="Kathmandu">Kathmandu</option>
											<option value="Bhaktapur">Bhaktapur</option>
											<option value="Lalitpur">Lalitpur</option>
											<option value="Makawanpur">Makawanpur</option>
											<option value="Dhading">Dhading</option>
											<option value="Accham">Accham</option>					
										</select>
									</td>
								</tr>
								
								<tr>
									<th><label>Description: </label></th>
									<td>
										<textarea name="description"></textarea>
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
            
</body>
</html>