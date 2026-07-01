<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" errorPage=""%>
<%
    // Get form data
    String name = request.getParameter("name").trim();
    String contact = request.getParameter("contact").trim();
    String state = request.getParameter("state").trim;
    String destination = request.getParameter("destination").trim;
    String guide = request.getParameter("guide").trim;
    //String Confirm_Password = request.getParameter("Confirm_Password");
    if (name == null || name.equals("") || contact == null || contact.equals("") || state == null || state.equals("") || destination == null || destination.equals("") || guide == null || guide.equals("") ) {
        out.println("<p style='color:red;'>All fields are required.</p>");
        return;
    }

    

    // Optionally hash password here for security (see note below)
    //String Confirm_Password = password;

    // Database configuration
    String dbURL = "jdbc:mysql://localhost:3306/studentdb";
    String dbUser = "root";
    String dbPass = "pranitha";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

        // Prepare SQL query
        String sql = "INSERT INTO login(name, contact,state,destination,guide ) VALUES (?, ?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, contact);
        pstmt.setString(3, state);
        pstmt.setString(4, destination);
        pstmt.setString(5, guide);// Insecure — hash it in real apps

        int rows = pstmt.executeUpdate();
        if (rows > 0) {
            out.println("<p style='color:green;'>successful!</p>");
            

        } else {
            out.println("<p style='color:red;'>Booking failed. Please try again.</p>");
        }

    } catch (SQLIntegrityConstraintViolationException e) {
        out.println("<p style='color:red;'>registered.</p>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
