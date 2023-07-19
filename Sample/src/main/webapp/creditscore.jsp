<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import=" java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>CREDIT SCORE</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<h1>Credit Score</h1>
<table>
  <thead>
    <tr>
      <th style="border: 1px solid black;">Credit Score</th>
      <th style="border: 1px solid black;">Account No</th>
    </tr>
  </thead>
  <tbody>
    <%
    String url = "jdbc:mysql://localhost:3306/banking";
    String user = "root", password = "123456";
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;

      try {
        // Create a connection to the MySQL database
        Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, user, password);

        // Create a statement
        stmt = con.createStatement();

        // Get the transaction history
        String sql = "SELECT creditscore, accountno FROM transaction WHERE userid = 1";
        rs = stmt.executeQuery(sql);

        // Loop through the results and create the table rows
        while (rs.next()) {
        	out.print("<tr>");
            out.print("<td style=\"border: 1px solid black;\">" + rs.getString("creditscore") + "</td>");
            out.print("<td style=\"border: 1px solid black;\">" + rs.getString("accountno") + "</td>");
            out.print("</tr>");
        }
      } catch (Exception e) {
        out.println(e.getMessage());
      } finally {
        // Close the connection to the database
        if (rs != null) {
          rs.close();
        }
        if (stmt != null) {
          stmt.close();
        }
        if (conn != null) {
          conn.close();
        }
      }
    %>
  </tbody>
</table>
</body>
</html>