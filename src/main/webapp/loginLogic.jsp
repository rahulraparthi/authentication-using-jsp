<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 	
		
		String email = request.getParameter("email");
		String password = request.getParameter("password"); 
		String query = "select * from authenticate where email = ? and password = ?";
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo?user=root&&password=root");
		PreparedStatement ps = c.prepareStatement(query);
		
		ps.setString(1, email);
		ps.setString(2, password);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
			
			RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
				
			String name = rs.getString("username");
			String email1 = rs.getString("email");
			int eid = rs.getInt("eid");
			String location = rs.getString("location");
			
			session.setAttribute("name", name);
			session.setAttribute("email", email1);
			session.setAttribute("eid", eid);
			session.setAttribute("location", location);
		}
		else{
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.forward(request, response);
		}
		
	%>
</body>
</html>