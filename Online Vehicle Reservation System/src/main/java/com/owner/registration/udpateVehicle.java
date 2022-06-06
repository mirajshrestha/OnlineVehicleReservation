package com.owner.registration;

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
 * Servlet implementation class udpateVehicle
 */
public class udpateVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String id = req.getParameter("v_id");
		String mfg = req.getParameter("manufacturer");
		String mdl = req.getParameter("model");
		String rate = req.getParameter("daily_fare");
		String from = req.getParameter("from_date");
		String to = req.getParameter("to_date");		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			PreparedStatement pst = conn.prepareStatement("Update vehicles set Manufacturer=?, Model=?, dailyfare=?, fromdate=?, todate=? where vehicle_id=?");
			pst.setString(1, mfg);
			pst.setString(2, mdl);
			pst.setString(3, rate);
			pst.setString(4, from);
			pst.setString(5, to);
			pst.setString(6, id);
			System.out.println(id);
			pst.executeUpdate();
			
			res.sendRedirect("frontend/owner/vehicle.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
