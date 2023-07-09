<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Transaction History</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<h1>Transaction History</h1>
<table>
  <thead>
    <tr>
      <th>Transaction ID</th>
      <th>Transaction Date</th>
      <th>Transaction Type</th>
      <th>Amount</th>
      <th>Cr/Dr</th>
      <th>Account No</th>
    </tr>
  </thead>
  <tbody>
    <%
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;

      try {
        // Create a connection to the MySQL database
        conn = DriverManager.getConnection("jdbc:mysql://localhost/banking_loan_management", "root", "");

        // Create a statement
        stmt = conn.createStatement();

        // Get the transaction history
        String sql = "SELECT transaction_id, transaction_date, transaction_type, amount, cr_dr, account_no FROM transaction WHERE user_id = 1";
        rs = stmt.executeQuery(sql);

        // Loop through the results and create the table rows
        while (rs.next()) {
          out.print("<tr>");
          out.print("<td>" + rs.getString("transaction_id") + "</td>");
          out.print("<td>" + rs.getString("transaction_date") + "</td>");
          out.print("<td>" + rs.getString("transaction_type") + "</td>");
          out.print("<td>" + rs.getString("amount") + "</td>");
          out.print("<td>" + rs.getString("cr_dr") + "</td>");
          out.print("<td>" + rs.getString("account_no") + "</td>");
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
