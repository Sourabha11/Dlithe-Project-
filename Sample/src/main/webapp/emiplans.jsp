<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page import="java.sql.*" %>

<%
String url = "jdbc:mysql://localhost:3306/banking";
String user = "root", password = "123456";
  String loanAmount = request.getParameter("loanAmount");

  // Connect to the MySQL database
  Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);

  // Get the EMI plan from the database
  String sql = "SELECT loanamount, interestrate, tenure, emi FROM loans WHERE loanamount = " + loanAmount;
  Statement statement = con.createStatement();
  ResultSet resultSet = statement.executeQuery(sql);
  

  // Check if the query was successful
  if (resultSet.next()) {
    // The query was successful
    resultSet.next();
    String emiPlan = resultSet.getString("emi");

    // Return the EMI plan
    request.setAttribute("emiPlan", emiPlan);
  } else {
    // The query was not successful
    request.setAttribute("emiPlan", "Failed to get EMI plan");
  }
%>



<h2>EMI Plan</h2>

<p>The EMI plan for your loan amount is:</p>

<p id="emi-plan"><%= request.getAttribute("emiPlan") %></p>


