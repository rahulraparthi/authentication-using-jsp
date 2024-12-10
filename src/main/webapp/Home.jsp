<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome</h1>
	<% 
		String name = (String)session.getAttribute("name");
		String email = (String)session.getAttribute("email");
		String location = (String)session.getAttribute("location");
		
		out.println("<h1>Employee Results : <h1>");
		out.println("<table border = 1>");
		out.println("<tr><td>Name</td><td>mail</td><td>password</td></tr>");
		out.println("<tr><td>"+name+"</td><td>"+email+"</td><td>"+location+"</td></tr>");
		out.println("</table>");
		
		out.println("<button>Edit</button>");
		out.println("<button>Delete</button>");
	%>
</body>
</html>