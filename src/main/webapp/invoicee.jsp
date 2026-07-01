<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
    // Sample data - In real usage, retrieve from request or database
    String customerName = request.getParameter("customerName") != null ? request.getParameter("customerName") : "pranitha";
    String contact = request.getParameter("contact") != null ? request.getParameter("contact") : "9390305177";
    String state = request.getParameter("state") != null ? request.getParameter("state") : "kerala";
    String destination = request.getParameter("destination") != null ? request.getParameter("destination") : "temple";
    String guide = request.getParameter("guide") != null ? request.getParameter("guide") : "ravi";
    String amount = "4500"; // Hardcoded as shown in your image

    SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
    String dateString = formatter.format(new Date());
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Travel Blog - Invoice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fef6ed;
            display: flex;
            justify-content: center;
            padding: 20px;
        }
        .invoice {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 600px;
        }
        h1 {
            text-align: center;
            font-size: 26px;
        }
        .meta {
            margin: 20px 0;
        }
        .meta b {
            display: inline-block;
            width: 120px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ccc;
        }
        tfoot td {
            font-weight: bold;
        }
        .thank-you {
            text-align: center;
            margin-top: 30px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="invoice">
    <h1>Travel Blog - Invoice</h1>
    <p><strong>Date:</strong> <%= dateString %></p>

    <div class="meta">
        <p><b>Customer Name:</b> <%= customerName %></p>
        <p><b>Contact:</b> <%= contact %></p>
        <p><b>State:</b> <%= state %></p>
        <p><b>Destination:</b> <%= destination %></p>
        <p><b>Guide:</b> <%= guide %></p>
    </div>

    <table>
        <thead>
            <tr>
                <th>Description</th>
                <th>Amount (₹)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Base Package (<%= destination %>)</td>
                <td><%= amount %></td>
            </tr>
        </tbody>
    </table>

    <p class="thank-you">Thank you for booking with us!</p>
</div>
</body>
</html>
