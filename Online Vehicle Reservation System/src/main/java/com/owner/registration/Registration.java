package com.owner.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Registration extends HttpServlet{
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String uname = req.getParameter("name"); 
		String uemail = req.getParameter("email");
		String upwd = req.getParameter("pass"); 
		String umobile = req.getParameter("contact"); 

		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			
			PreparedStatement pst1 = conn.prepareStatement("select * from owners where email=?");
			pst1.setString(1, uemail);
			ResultSet rs = pst1.executeQuery();
			if(rs.next()) {
				res.sendRedirect("frontend/owner/registration.jsp?email=exists");
			}
			else {
			
			PreparedStatement pst = conn.prepareStatement("insert into owners(name, email, pass, contact) values (?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, upwd);
			pst.setString(4, umobile);
			
			int rowCount = pst.executeUpdate();

			res.sendRedirect("frontend/owner/login.jsp");
			if (rowCount > 0) {
				req.setAttribute("status", "success");
				
			}else {
				req.setAttribute("status", "failed");
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

}
