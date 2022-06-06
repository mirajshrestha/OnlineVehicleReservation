<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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

<div class="container col-md-5">
	<div class="card">
		<div class="card-body">
            <form method="post" action="<%= request.getContextPath() %>/udpateVehicle">
				<table class="form-table">
					<tr>
						<th><input type ="hidden" name ="v_id" value="<%=rs.getInt(1)%>"></th>
					</tr>
					<tr>
						<th><label>Manufacturer: </label></th>
						<td><input type="text" name="manufacturer" value="<%=rs.getString(2) %>"></td>
					</tr>
					<tr>
						<th><label>Model: </label></th>
						<td><input type="text" name="model" value="<%=rs.getString(3) %>"></td>
					</tr>
					<tr>
						<th><label>Daily Fare: </label></th>
						<td><input type="text" name="daily_fare" value="<%=rs.getString(4) %>"></td>
					</tr>
					<tr>
						<th><label>From Date: </label></th>
						<td><input type="date" name="from_date" class="datepicker" value="<%=rs.getString(5) %>"></td>
					</tr>
					<tr>
						<th><label>To Date: </label></th>
						<td><input type="date" name="to_date" class="datepicker" value="<%=rs.getString(6) %>"></td>
					</tr>
					<tr>
						<th><label>Vehicle Current Location: </label></th>
						<td>
							<select name="vehicle_current_location">
								<option value="">---Select Location--</option>
								<option value="1">Kathmandu</option>
								<option value="2">Bhaktapur</option>
								<option value="3">Lalitpur</option>
								<option value="4">Makawanpur</option>
								<option value="5">Dhading</option>
								<option value="6">Accham</option>					
							</select>
						</td>
					</tr>
							
					<tr>
						<th><label>Vehicle Available For: </label></th>
						<td>
						<select name="end_location" style="">
							<option value="">---Select Location--</option>
							<option value="1">Kathmandu</option>
								<option value="2">Bhaktapur</option>
								<option value="3">Lalitpur</option>
								<option value="4">Makawanpur</option>
								<option value="5">Dhading</option>
								<option value="6">Accham</option>					
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
									<th>&nbsp;</th>
									<td><button type="submit" class="btn">Save</button></td>
								</tr>	
							</table>
						</form>
                    </div>
                </div>
            </div>
<%}}
catch(Exception e){						
	}%>
</body>
</html>