<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <%@ include file="../../navbar.jsp" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="admin.css">
<title>Insert title here</title>

</head>
<body>
<header class="header">
        <div class="nav">
            <a href="#" class="ovr"><span>OnlineVehicle</span>Reservation</a>
        <nav class="navbar">
            <a href="#">Home</a>
            <a href="#">Vehicles</a>
            <a href="#">Services</a>
            <a href="#">Featured</a>
            <a href="#">Search</a>
            <a href="#">About Us</a>
        </nav>
        
         <div id="logout">
            <button class="btn">logout</button>
            <i class="far fa-user"></i>
         </div>
         </div>

         <div class="AdminHeader">
             <h1>Admin Dashboard</h1>
            </div>

            <div class="admin">

            <div class="admin-content">
                <h1>Name</h1>
                <p>admin name</p>

                <h1>Email</h1>
                <p>admin@gmail.com</p>
            </div>

                <div id="password">
                    <button class="change">Change Password</button>
                </div>
            </div>

            <div class="request-feature">
               <h1> Feature Request </h1>
            </div>

            <div class="request">
                <div class="feature">
                    <ul class="details">
                        <li class="topic">Owner Name</li>
                        <li><a href="#">a</a></li>
                        <li><a href="#">b</a></li>
                        
                    </ul>

                    <ul class="details">
                        <li class="topic">Vehicle</li>
                        <li><a href="#">Skoda</a></li>
                        <li><a href="#">Bmw</a></li>
                    </ul>

                    <ul class="details">
                        <li class="topic">Request Date</li>
                        <li><a href="#">10-05-2022</a></li>
                        <li><a href="#">10-06-2022</a></li>
                    </ul>

                    <ul class="details">
                        <li class="topic">Accept</li>
                        <li><button>Accept</button></li>
                        <li><button>Accept</button></li>
                    </ul>

                    <ul class="details">
                        <li class="topic">Decline</li>
                        <li><button>Decline</button></li>
                        <li><button>Decline</button></li>
                    </ul>


                
               
            </div>

            </header>
</body>
</html>