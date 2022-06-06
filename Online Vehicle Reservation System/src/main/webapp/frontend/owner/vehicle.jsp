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
		if(session.getAttribute("userType")!="owner"){
			response.sendRedirect("login.jsp");
		}
	
	%>
			<header>
                <nav>
                    <div>
                        <h1>Vehicle Management</h1>
                    </div>
                </nav>
            </header>
            <br>
			<a href="index.jsp">Go back</a>
            <div class="row">

                <div class="container">
                    <h3 class="text-center">List of Vehicles</h3>
                    <hr>
                    <div class="container text-left">

                        <a href="add-vehicle.jsp" class="btn btn-success">Add New Vehicle</a>
                    </div>
                    <br>
                    <table class="" style="border: 1px solid black">
                        <thead>
                            <tr>
                                <th width=3%>SN</th>
								<th width=15%>Photo</th>
								<th width=13%>Manufacturer</th>
								<th width=10%>Model</th>
								<th width=17%>Feature Status</th>
								<th width=15%>Date From/To</th>
								<th width=15%>Options</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                        <%@page import="java.sql.*" %>
                        <% 
                        	System.out.println(session.getAttribute("owner_id"));
                        	String id = session.getAttribute("owner_id").toString();
                            Connection conn = null;
                        	int count = 1;
                            try {
                    			Class.forName("com.mysql.cj.jdbc.Driver");
                    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
                    			PreparedStatement pst = conn.prepareStatement("Select * from vehicles where owner_id=?");
                    			pst.setString(1, id);
                    			ResultSet rs = pst.executeQuery();
                    			while(rs.next()){
                        %>
                           

                                <tr>
                                    <td>
                                        <%=count++%>
                                    </td>
                                    <td>
                                        <img src="<%= request.getContextPath() +"/images/"+ rs.getString(10)%>" width="300" height="200"/>
                                    </td>
                                    <td>
                                        <%=rs.getString(2) %>
                                    </td>
                                    <td>
                                        <%=rs.getString(3) %>
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <%=rs.getString(5)%>-<%=rs.getString(6) %>
                                    </td>
                                    <td><a href="edit-vehicle.jsp?id=<%=rs.getString(1) %>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="delete.jsp?id=<%=rs.getString(1) %>">Delete</a></td>
                                </tr>
                            
                        </tbody>
						<%}}
						catch(Exception e){
							
						}
						%>
                    </table>
                </div>
            </div>
</body>
</html>