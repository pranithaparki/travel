<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" errorPage=""%>
<%
    // Get form data
    String username = request.getParameter("username").trim();
    String Email_Address = request.getParameter("email").trim();
    String password = request.getParameter("password");
    //String Confirm_Password = request.getParameter("Confirm_Password");
    if (username == null || username.equals("") || Email_Address == null || Email_Address.equals("") ) {
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
        String sql = "INSERT INTO login(username, Email_Address,password ) VALUES (?, ?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, Email_Address);
        pstmt.setString(3, password); // Insecure — hash it in real apps

        int rows = pstmt.executeUpdate();
        if (rows > 0) {
            out.println("<p style='color:green;'>Registration successful!</p>");
            response.sendRedirect("loginn.html");

        } else {
            out.println("<p style='color:red;'>Registration failed. Please try again.</p>");
        }

    } catch (SQLIntegrityConstraintViolationException e) {
        out.println("<p style='color:red;'>Email is already registered.</p>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
