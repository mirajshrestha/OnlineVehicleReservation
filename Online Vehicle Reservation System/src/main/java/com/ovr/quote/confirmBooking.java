package com.ovr.quote;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

/**
 * Servlet implementation class confirmBooking
 */
public class confirmBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getSession().getAttribute("email").toString();
		
		String add = req.getParameter("location"); 
        
		System.out.println(req.getParameter("owner"));
		String userID = req.getSession().getAttribute("user_id").toString();
		String vehicle = req.getParameter("vehicleid");
		String fordate = req.getParameter("from_date");
		String bookedfor = req.getParameter("days");
		String amount = req.getParameter("total_fare");
		String msg = req.getParameter("additional_message");
		String own = req.getParameter("owner"); 
        Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			PreparedStatement pst = conn.prepareStatement("update users set address=? where email ='"+email+"' ");
			pst.setString(1, add);

			pst.executeUpdate();
			
			PreparedStatement pst1 = conn.prepareStatement("Insert into bookings (vehicle_id, id, for_date, booked_days, total_fare, message, owner_id) Values (?,?,?,?,?,?,?)");
			pst1.setString(1, vehicle);
			pst1.setString(2, userID);
			pst1.setString(3, fordate);
			pst1.setString(4, bookedfor);
			pst1.setString(5, amount);
			pst1.setString(6, msg);
			pst1.setString(7, own);
			
			pst1.executeUpdate();
			res.sendRedirect("frontend/user/index.jsp");
			
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
