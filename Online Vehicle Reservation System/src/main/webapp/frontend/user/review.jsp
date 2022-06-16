<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assests/bootstrap/css/bootstrap.min.css">
<script type="text/javascript">
</script>
</head>
<body>
<div id="content">
	<%@page import="java.sql.*" %>
		<% 
         String id = request.getParameter("booking_id");
         Connection conn = null;
         int count = 1;
         try {
         		Class.forName("com.mysql.cj.jdbc.Driver");
         		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
         		PreparedStatement pst = conn.prepareStatement("Select bookings.* from bookings where booking_id='"+id+"' ");
         		ResultSet rs = pst.executeQuery();
         		while(rs.next()){
         %>
	
	<form action="<%= request.getContextPath() %>/reviews" method="post">
	
	
	<div class="main-content-header">
		<h2 class="left"><i class="fa fa-edit"></i> Write Vehicle Review</h2>
		<button type="submit"
			class="btn right">Save Review</button>
		<div class="clear"></div>
	</div>
	
	<input type="hidden" name="booking_id" value="<%= rs.getInt("booking_id") %>">
	<input type="hidden" id="reviewed_date" name="review_date">
	
	<br>
	<label>Review:</label>
	<table class="fancy-table full-width">
	
		<tr>
			<td>
				<textarea rows="10" name="review"></textarea>
			</td>
		
		</tr>
	
	</table>
	</form>
<%}}
		catch(Exception e){
			e.printStackTrace();
		}
     %>	
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

var today = year + "-" + month + "-" + tdate;
document.getElementById('reviewed_date').value=today;

</script>
</body>
</html>