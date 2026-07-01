<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
    String userId = request.getParameter("user_id");

    if (userId == null || userId.trim().isEmpty()) {
        out.print("<h3>Please log in to proceed with the checkout.</h3>");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }
        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }
        .address-form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            resize: vertical;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <h2>Booking</h2>

    <div class="address-form">
        <form action="invoicee.jsp" method="post">
            <!-- Hidden field to pass user_id -->
            <input type="hidden" name="user_id" value="<%= userId %>">

            <div class="form-group">
                <label for="Name">name</label>
                <textarea id="name" name="name" rows="4" required></textarea>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required>
            </div>

            <div class="form-group">
                <label for="state">state:</label>
                <input type="text" id="state" name="state" required>
            </div>

            <div class="form-group">
                <label for="guide">Guide:</label>
                <input type="text" id="guide" name="guide" required>
            </div>

            <button type="submit">ConfirmBooking</button>
        </form>