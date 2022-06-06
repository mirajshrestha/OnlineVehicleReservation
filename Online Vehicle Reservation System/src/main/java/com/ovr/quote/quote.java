package com.ovr.quote;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class quote
 */
public class quote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String combo1 = req.getParameter("combo1"); 
		String combo2 = req.getParameter("combo2");
		String date = req.getParameter("date");

		Connection conn = null;
		ResultSet rs;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			PreparedStatement pst = conn.prepareStatement("Select * From vehicles where currentlocation = ? And availablelocation=? and fromdate <= ? And todate >= ?");
			pst.setString(1, combo1);
			pst.setString(2, combo2);
			pst.setString(3, date);
			pst.setString(4, date);
			
			rs = pst.executeQuery();

			res.sendRedirect("frontend/quote/quote.jsp");
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
