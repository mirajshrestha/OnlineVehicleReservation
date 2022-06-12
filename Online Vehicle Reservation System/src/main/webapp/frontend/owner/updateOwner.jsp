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
String id = request.getParameter("ownerId");
String name = request.getParameter("fname");
String number = request.getParameter("phone");


try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
	PreparedStatement pst = conn.prepareStatement("Update owners set name=?, contact=? where owner_id = '"+id+"' ");
	pst.setString(1, name);
	pst.setString(2, number);
	

	pst.executeUpdate();
	
	response.sendRedirect("index.jsp");
	
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
</body>
</html>