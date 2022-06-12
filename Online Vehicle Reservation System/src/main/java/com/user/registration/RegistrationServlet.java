package com.user.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@MultipartConfig

public class RegistrationServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String uname = req.getParameter("name"); 
		String uemail = req.getParameter("email");
		String upwd = req.getParameter("pass"); 
		String umobile = req.getParameter("contact"); 
		String location = req.getParameter("address");
//		RequestDispatcher dispatcher = null;
		Part part = req.getPart("driving_license");//
        String fileName = extractFileName(part);//file name
        
        System.out.println(getServletContext().getRealPath(""));
        String savePath ="C:\\Users\\MODERN\\git\\OnlineVehicleReservation\\Online Vehicle Reservation System\\src\\main\\webapp\\doc_images\\" + fileName;
//        String savePath = getServletContext().getRealPath("doc_images/"+fileName);

        File fileSaveDir = new File(savePath);
        part.write(savePath);
        
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			PreparedStatement pst = conn.prepareStatement("insert into users(name, email, pass, contact, address, license_name) values (?,?,?,?,?,?)");
			pst.setString(1, uname);
			pst.setString(2, uemail);
			pst.setString(3, upwd);
			pst.setString(4, umobile);
			pst.setString(5, location);
			pst.setString(6, fileName);
			
			
			
			int rowCount = pst.executeUpdate();
//			dispatcher = req.getRequestDispatcher("frontend/user/login.jsp");
			res.sendRedirect("frontend/user/login.jsp");
			if (rowCount > 0) {
				req.setAttribute("status", "success");
				
			}else {
				req.setAttribute("status", "failed");
			}
//			dispatcher.forward(req, res);
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

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
	}

}
