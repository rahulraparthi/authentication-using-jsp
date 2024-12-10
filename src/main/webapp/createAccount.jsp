<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crate Account</title>
</head>
<body>
	<% 
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	int eid = Integer.parseInt(request.getParameter("eid"));
	String location = request.getParameter("location");
	
	String query = "insert into authenticate values(?,?,?,?,?)";
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?user=root&&password=root");
		PreparedStatement ps = c.prepareStatement(query);
		ps.setString(1, username);
		ps.setString(2, email);
		ps.setString(3, password);
		ps.setInt(4, eid);
		ps.setString(5, location);
		ps.executeUpdate();
		
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
	
	%>
</body>
</html>