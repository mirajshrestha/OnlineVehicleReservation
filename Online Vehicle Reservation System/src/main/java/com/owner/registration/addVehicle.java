package com.owner.registration;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)

/**
 * Servlet implementation class addVehicle
 */
public class addVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String UPLOAD_DIR = "images";
    public String dbFileName = "";
	
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
		String mfg = req.getParameter("manufacturer");
		String mdl = req.getParameter("model");
		String rate = req.getParameter("daily_fare");
		String from = req.getParameter("from_date");
		String to = req.getParameter("to_date");
		String start = req.getParameter("vehicle_current_location");
		String end = req.getParameter("end_location");
		String describe = req.getParameter("description");
		String owner_id = req.getParameter("owner");
//		String img = req.getParameter("image");
		Part part = req.getPart("image");//
        String fileName = extractFileName(part);//file name
        
        String savePath ="C:\\Users\\MODERN\\git\\OnlineVehicleReservation\\Online Vehicle Reservation System\\src\\main\\webapp\\images" + File.separator + fileName;
        File fileSaveDir = new File(savePath);
        part.write(savePath + File.separator);
                
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ovr","root","");
			PreparedStatement pst = conn.prepareStatement("insert into vehicles(Manufacturer, Model, dailyfare, fromdate, todate, currentlocation, availablelocation, desciption, filename, path, owner_id) values (?,?,?,?,?,?,?,?,?,?,?)");
			pst.setString(1, mfg);
			pst.setString(2, mdl);
			pst.setString(3, rate);
			pst.setString(4, from);
			pst.setString(5, to);
			pst.setString(6, start);
			pst.setString(7, end);
			pst.setString(8, describe);
			pst.setString(9, fileName);
            pst.setString(10, savePath);
            System.out.println(owner_id);
            pst.setString(11, owner_id);
			
			
			pst.executeUpdate();
			res.sendRedirect("frontend/owner/vehicle.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
