<%@page import="java.sql.*" %>

<% 
	String id = request.getParameter("booking_id");
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
		PreparedStatement pst = conn.prepareStatement("delete from bookings where booking_id='"+id+"'");
		pst.executeUpdate();
		response.sendRedirect("index.jsp?booking=success");
	}
	catch(Exception e){
		if(e.getMessage().contains("Cannot delete or update a parent row")){
			%>
	
			<%	
		}else{
			e.printStackTrace();
		}
	}
%>