<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSU</title>
</head>
<body>
<%
	String url = "jdbc:mysql://localhost:3306/banking";
	String user = "root", password = "123456";
	String username = request.getParameter("username");
	String pwd = request.getParameter("password");
	String type = request.getParameter("role");
	String sql;
	if(type.equalsIgnoreCase("admin"))
		sql = "select * from admin where username='" + username + "' and password='" + pwd + "'";
	else
		sql = "select * from users where email='" + username+ "' and password='" + pwd + "'";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);
		Statement smt = con.createStatement();
		ResultSet rs = smt.executeQuery(sql);
        if (rs.next()) {
            String errorMessage = "Login Successful...";
            session.setAttribute("username", username);
            session.setAttribute("userType", type);
            session.setAttribute("errorMessage", errorMessage);
            rs.close();
    		smt.close();
    		con.close();
            if(type.equalsIgnoreCase("admin"))
            	response.sendRedirect("adminHome.jsp");
            else
            	response.sendRedirect("userHome.jsp");
        } else {
        	String errorMessage = "Invalid username or password!";
            session.setAttribute("errorMessage", errorMessage);
            response.sendRedirect("index.jsp");
        }
	}catch(Exception ex){
		out.println(ex);
	}

%>
</body>
</html>