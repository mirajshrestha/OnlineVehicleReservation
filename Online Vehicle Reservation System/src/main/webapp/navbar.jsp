<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/navbar.css">

</head>
<body>
	
	<header class="header">
        <div class="logo-style">
			<a href="" style="text-decoration: none;">
				<h2 class="title-style">
					<span>O</span>nline<span>V</span>ehicle<span>R</span>eservation
				</h2>
			</a>
		</div>

      <nav class="navbar">
        
        <ul class="navbar-list">
          <li><a class="navbar-link" href="#">Home</a></li>
          <li><a class="navbar-link" href="#">Get a Quote</a></li>
          <li>
          	<%if(session.getAttribute("userType")=="user"){ %>
          	<a class="navbar-link" href="frontend/user/login.jsp">Hi, ${user_name}</a>
          	<%}else if(session.getAttribute("userType")=="owner"){ %>
          	<a class="navbar-link" href="frontend/owner/login.jsp">Hi, ${owner_name}</a>
          	<%}else{ %>
          	<a class="navbar-link" href="frontend/user/login.jsp">User Login</a>
          	<%} %>
          </li>
          <li>
          	<%if(session.getAttribute("userType")=="user"){ %>
				<form action="<%= request.getContextPath() %>/logout">
					<input type = "submit" value = "Logout" style="cursor: pointer; border: none; background: #ffffff;">
				</form>
				<%}else if(session.getAttribute("userType")=="owner"){ %>
				<form action="<%= request.getContextPath() %>/ownerLogout">
					<input type = "submit" value = "Logout" style="cursor: pointer; border: none; background: #ffffff;" >
				</form>
				<%}else{ %>
				<a class="navbar-link" href="frontend/owner/login.jsp">Owner Login</a>
				<%} %>
          </li>
        </ul>
      </nav>

      <div class="mobile-navbar-btn">
        <ion-icon name="menu-outline" class="mobile-nav-icon"></ion-icon>
        <ion-icon name="close-outline" class="mobile-nav-icon"></ion-icon>
      </div>
    </header>
    <!-- ======================================== 
          Our Main Hero Section Start  
    ========================================  -->
    <!-- <main>
      <section class="section-hero">
        <div class="hero">
          <p>Hero section Plz Subscribe to thapa technical channel</p>
        </div>
      </section>
    </main> -->

    <!-- ======================================== 
          Our Service Section Start  
    ========================================  -->
    <!-- <section class="section-services">
      <div class="hero">
        <p>Services section</p>
      </div>
    </section> -->

    <!-- ======================================== 
          Our JavaScript Section Start  
    ========================================  -->
    <script
      type="module"
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"
    ></script>
    <script
      nomodule
      src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"
    ></script>
    <script>
    const mobile_nav = document.querySelector(".mobile-navbar-btn");
    const nav_header = document.querySelector(".header");

    const toggleNavbar = () => {
      // alert("Plz Subscribe ");
      nav_header.classList.toggle("active");
    };

    mobile_nav.addEventListener("click", () => toggleNavbar());
    </script>
</body>
</html>