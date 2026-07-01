<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*" errorPage=""%>
  
<html>
<body bgcolor="yellow">
<h1>
<%
	String u=request.getParameter("uname");
	String pwd=request.getParameter("pwd");
	out.println("Hello "+u);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb","root","pranitha");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from login where username='"+u+"'and password='"+pwd+"'");
	if(rs.next())
	{
		
		response.sendRedirect("project.html");
	}
	else
	{
		out.println("<h1>login unsuccessful</h1>");
		out.println("<h1>Invalid username or password...</h1>");
	}
	con.close();
	
%>
</h1>
</body>
</html>
