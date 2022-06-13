package com.user.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String uemail = req.getParameter("email");
		String upwd = req.getParameter("pass");
//		RequestDispatcher dispatcher = null;
//		
//		if(uemail == null || uemail.equals("")) {
//			req.setAttribute("status", "invalidEmail");
//			dispatcher = req.getRequestDispatcher("frontend/user/login.jsp");
//			dispatcher.forward(req, res);
//		}else {
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			PreparedStatement pst = conn.prepareStatement("Select * from users where email=? and pass=? ");
			pst.setString(1, uemail);
			pst.setString(2, upwd);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				HttpSession session = req.getSession();
				session.setAttribute("email", uemail);
				System.out.println(rs.getInt(1));
				session.setAttribute("user_id", rs.getInt(1));
				session.setAttribute("user_name", rs.getString(2));
				session.setAttribute("userType", "user");
				res.sendRedirect("frontend/user/index.jsp");
			}else {
				res.sendRedirect("frontend/user/login.jsp?email=invalid");
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				
	}
	

}
