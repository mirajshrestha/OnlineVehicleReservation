<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="main-content">
	<div class="main-content-header">
		<h1 class="left"><i class="fa fa-edit"></i> Vehicle Reviews</h1>
		<div class="clear"></div>
	</div>
	
	<div class="main-content-body">
	<%@page import="java.sql.*" %>
	 <%
	 	ResultSet rs;
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			String id = request.getParameter("vehicle_id"); 
    		PreparedStatement pst = conn.prepareStatement("Select * from bookings where vehicle_id = '"+id+"' ");
                    			
    		rs = pst.executeQuery();
    		while(rs.next()){
    %> 
	<table class="fancy-table">
		
		<tr>
			<td>
				<div class="review"> yoyoyojojojojohohohoho </div>
				<div class="review-by">
					<h2>baaaka</h2>
					<span>date</span>
				</div>
			</td>
		</tr>
		
		<tr><td>No reviews yet.</td></tr>
		
	</table>
	<%
                    	}}
						catch(Exception e){
							e.printStackTrace();
						}
						%>
	</div>
</div>
</body>
</html>