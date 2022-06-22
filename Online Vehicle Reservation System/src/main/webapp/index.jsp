<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="navbar.jsp" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<title>Online Vehicle Reservation</title>
</head>
<body>

	<div class="Rent">
        <h1>Rent a Vehicle</h1><br>
        <div class="form"> 
        <form action="frontend/quote/quote.jsp" method="get">
            <select name ="combo1" style="width:200px; height:25px;">
			<option value="">--- Choose District ---</option>
			<option value="Kathmandu">Kathmandu</option>
			<option value="Bhaktapur">Bhaktapur</option>
			<option value="Lalitpur">Lalitpur</option>
			<option value="Makawanpur">Makawanpur</option>
			<option value="Dhading">Dhading</option>
			<option value="Accham">Accham</option>
		</select>
		<input type="date" name="date" style="width:200px; height:25px;" id="fD">
		<br>
        <input type="submit" value="Search" class="search">
        	</form>
     	</div>
     </div>
     <div class="ccc">
		<section class="middle">
            <div class="feature">
                        <h3>Exclusive</h3>
                        <div class="conten">
                            <p>want to rent a Vehicle??</p>
                            <p>We are here</p>
                        </div>
                    </div>

                    <div class="feature">
                        <h3>Exclusive</h3>
                        <div class="conten">
                            <p>Rent vehicles in cheapest price</p>
                            <p>Minimum as RS.1k per day</p>
                        </div>
                    </div>

                    <div class="feature">
                        <h3>Exclusive</h3>
                        <div class="conten">
                            <p>Ride safe</p>
                            <p>All functions included vehicle</p>
                        </div>
                    </div>

                    <div class="feature">
                        <h3>Exclusive</h3>
                        <div class="conten">
                            <p>Insurance Coverage</p>
                            <p>You are insured</p>
                        </div>
                    </div>


                </section>
            </div>
       		<section class="vehicle" id="vehicle">
                <h1 class="heading">Featured <span>Vehicles</span></h1>
                <div class="swiper vehicle-slider">
                    <div class="swiper-wrapper">
						<%@page import="java.sql.*" %>
                        <% 
                            Connection conn = null;
                        	int count = 1;
                            try {
                    			Class.forName("com.mysql.cj.jdbc.Driver");
                    			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
                    			PreparedStatement pst = conn.prepareStatement("Select vehicles.*, owners.name from vehicles JOIN owners ON owners.owner_id = vehicles.owner_id where `feature_status` = 'Accepted' ");
                    			ResultSet rs = pst.executeQuery();
                    			while(rs.next()){
                        %>
                        <div class="swiper-slide box">
                            <img src="<%= request.getContextPath() +"/images/"+ rs.getString(10)%>" alt="">
                            <div class="content">
                                <h3><%=rs.getString(2) %> <%=rs.getString(3) %></h3>
                                <p><%=rs.getString("owners.name") %></p>
                                <p><%=rs.getString("currentlocation") %></p>
                                <p><%=rs.getString("dailyfare")%>/day </p>
                                <a href="frontend/quote/vehicle-details.jsp?vehicle_id=<%=rs.getString("vehicle_id") %>" class="btn btn-info">Vehicle details</a>

                            </div>
                        </div>
						<%}}
						catch(Exception e){
							
						}
						%>
                        


                    </div>
                    <div class="swiper-pagination"></div>

                </div>
            </section>
        </div>
        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <script>
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
	
	var minDate = year + "-" + month + "-" + tdate;
	document.getElementById("fD").setAttribute('min', minDate);
    var swiper = new Swiper(".vehicle-slider", {
    	  slidesPerView: 1,
    	  spaceBetween: 20,
    	  loop:true,
    	  grapCursor:true,
    	  autoplay: {
    	      delay: 9500,
    	      disableOnInteraction: false,
    	    },
    	  pagination: {
    	    el: ".swiper-pagination",
    	    clickable: true,
    	  },
    	  breakpoints: {
    	    0: {
    	      slidesPerView: 1,	
    	      
    	    },
    	    768: {
    	      slidesPerView: 2,
    	    },
    	   991: {
    	      slidesPerView: 3,
    	    },
    	  },
    	});
    
  
    </script>
</body>
</html>