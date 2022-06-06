<%@page import="java.sql.*" %>

<% 
	String id = request.getParameter("id");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
		PreparedStatement pst = conn.prepareStatement("delete from vehicles where vehicle_id='"+id+"'");
		pst.executeUpdate();
		response.sendRedirect("vehicle.jsp");
	}
	catch(Exception e){
		if(e.getMessage().contains("Cannot delete or update a parent row")){
			%>
			Vehicle already booked. Sorry, cannot delete vehicle.
			<%	
		}else{
			e.printStackTrace();
		}
	}
%>