<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	session.setAttribute("booking_date_from", request.getParameter("date"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table class="" style="border: 1px solid black">
                       	<thead>
                            <tr>
                                <th width=3%>SN</th>
								<th width=15%>Photo</th>
								<th width=13%>Manufacturer</th>
								<th width=10%>Model</th>
								<th width=10%>Daily Fare</th>
								<th width=15%>Date From/To</th>
								<th width=15%>Options</th>
								
                            </tr>
                        </thead>
                        
                        <tbody>
                        <%@page import="java.sql.*" %>
                        <% 
                        int count = 1;
                		ResultSet rs;
                            Connection conn = null;
                            try {
                    			Class.forName("com.mysql.cj.jdbc.Driver");
                    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
                    			String combo1 = request.getParameter("combo1"); 
                        		String combo2 = request.getParameter("combo2");
                        		String date = request.getParameter("date");
                    			PreparedStatement pst = conn.prepareStatement("Select * From vehicles where currentlocation = ? And availablelocation=? and fromdate <= ? And todate >= ?");
                    			pst.setString(1, combo1);
                    			pst.setString(2, combo2);
                    			pst.setString(3, date);
                    			pst.setString(4, date);
                    			
                    			rs = pst.executeQuery();
                    			if(rs.next()){
                        %>
                           

                                <tr>
                                    <td>
                                        <%=count++%>
                                    </td>
                                    <td>
                                        <img src="<%= request.getContextPath() +"/images/"+ rs.getString("filename")%>" width="300" height="200"/>
                                    </td>
                                    <td>
                                        <%=rs.getString("Manufacturer") %>
                                    </td>
                                    <td>
                                        <%=rs.getString("Model") %>
                                    </td>
                                    <td>
                                         Rs. <%=rs.getString("dailyfare") %>
                                    </td>
                                    <td>
                                        <%=rs.getString("fromdate")%> to <%=rs.getString("todate") %>
                                    </td>
                                    <td><a href="">View Reviews</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="booking-details.jsp?vehicle_id=<%=rs.getString("vehicle_id") %>">Book this car</a></td>
                                </tr>
                            
                        </tbody>
						<%}else{%>
							<p>No results found.</p>
                    	<%}}
						catch(Exception e){
							e.printStackTrace();
						}
						%>
                    </table>

</body>
</html>