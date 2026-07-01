Booking servlets.java

package com.tour.booking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database configuration
    private static final String DB_URL = "jdbc:mysql://localhost:3306/travel";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "pranitha"; // change to your db password
    
    // Package amounts for each state
    private static final Map<String, Double> PACKAGE_AMOUNTS = new HashMap<>();
    static {
        PACKAGE_AMOUNTS.put("Kerala", 12000.00);
        PACKAGE_AMOUNTS.put("Karnataka", 15000.00);
        PACKAGE_AMOUNTS.put("Tamil Nadu", 10000.00);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String state = request.getParameter("state");
        String destination = request.getParameter("destination");
        
        // Calculate package amount
        double amount = PACKAGE_AMOUNTS.getOrDefault(state, 0.00);
        
        // Store in database
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            String sql = "INSERT INTO bookings (name, contact, state, destination, amount) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, contact);
            pstmt.setString(3, state);
            pstmt.setString(4, destination);
            pstmt.setDouble(5, amount);
            
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            // Set attributes for invoice page
            request.setAttribute("name", name);
            request.setAttribute("contact", contact);
            request.setAttribute("state", state);
            request.setAttribute("destination", destination);
            request.setAttribute("amount", amount);
            
            // Forward to invoice page
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}