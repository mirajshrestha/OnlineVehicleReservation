<%@page import="java.sql.*" %>

<% 
	String id = request.getParameter("id");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
		PreparedStatement pst = conn.prepareStatement("UPDATE `vehicles` SET `feature_status` = 'Accepted' WHERE `vehicles`.`vehicle_id` ='"+id+"' ");
		pst.executeUpdate();
		response.sendRedirect("feature-vehicle.jsp");
	}
	catch(Exception e){
		if(e.getMessage().contains("Cannot delete or update a parent row")){
			%>
			Cannor do the objected task
			<%	
		}else{
			e.printStackTrace();
		}
	}
%>