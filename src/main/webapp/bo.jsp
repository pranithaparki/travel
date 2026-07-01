<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: antiquewhite;
            padding: 30px;
        }
        .confirmation {
            background: #dff0d8;
            border-left: 5px solid #3c763d;
            padding: 20px;
            width: 400px;
            margin: auto;
            border-radius: 8px;
        }
        .error {
            background: #f2dede;
            border-left: 5px solid #a94442;
            padding: 20px;
            width: 400px;
            margin: auto;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<%
    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/studentdb";
    String dbUser = "root";
    String dbPass = "pranitha";

    // Get form parameters
    String name = request.getParameter("name");
    String contact = request.getParameter("contact");
    String state = request.getParameter("state");
    String destination = request.getParameter("destination");
    String guide = request.getParameter("guide");
    // Insert into database
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        String sql = "INSERT INTO booking(name, contact, state, destination, guide) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, contact);
        stmt.setString(3, state);
        stmt.setString(4, destination);
        stmt.setString(5, guide);

        int rows = stmt.executeUpdate();

        if (rows > 0) {
%>
            <div class="confirmation">
                Booking confirmed!<br>
                <strong>Name:</strong> <%= name %><br>
                <strong>Contact:</strong> <%= contact %><br>
                <strong>State:</strong> <%= state %><br>
                <strong>Destination:</strong> <%= destination %><br>
                <strong>Guide:</strong> <%= guide %>
                
            </div>
   
		
<%
        } else {
%>
            <div class="error">Booking failed. Please try again.</div>
<%
        }

        stmt.close();
        conn.close();if (rows > 0) {
            // ✅ Redirect to invoice page
            response.sendRedirect("invoicee.jsp");
            return; // Make sure to exit
        }
    } catch (Exception e) {
        request.setAttribute("errorMsg", e.getMessage());
    }
%>
    }

</body>
</html>
