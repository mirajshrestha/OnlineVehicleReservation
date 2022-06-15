<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../../assests/bootstrap/css/bootstrap.min.css">
</head>
<body>
<%
		if(session.getAttribute("userType")=="admin"){
			response.sendRedirect("index.jsp");
		}
	%>
	
	<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5">Administrator</h5>
            <form action="<%= request.getContextPath() %>/adminLogin" method="post">
              <div class="form-floating mb-3">
                <input type="text" class="form-control" name="username">
                <label for="floatingInput">Username</label>
              </div>
              <div class="form-floating mb-3">
                <input type="password" class="form-control" name="password">
                <label for="floatingPassword">Password</label>
              </div>
 			  <hr class="my-4">
              <div class="d-grid">
              <input type="submit" value="Sign In" class="btn btn-primary btn-login text-uppercase fw-bold"">
                
              </div>
            
              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
  <%
	if(request.getParameter("username")!=null){
		if(request.getParameter("username").equals("invalid")){
	%>
	alert('Invalid username/password.');
	<%
		}
	}
%>
  </script>
</body>
</html>