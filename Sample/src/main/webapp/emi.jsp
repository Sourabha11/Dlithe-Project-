<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>

<html>
<head>
<title>EMI Calculation</title>
</head>
<body>

<h1>EMI Calculation</h1>

<form action="emi.jsp" method="post">

<label for="principal">Principal Amount:</label>
<input type="text" name="principal" id="principal" />

<label for="interest">Interest Rate:</label>
<input type="text" name="interest" id="interest" />

<label for="tenure">Tenure (in months):</label>
<input type="text" name="tenure" id="tenure" />

<input type="submit" value="Calculate EMI" />

</form>

<hr />

<%
Object rs;
ResultSet rs3;
if (request.getParameter("LoansAmount") != null &&
request.getParameter("Interest") != null &&
request.getParameter("Tenure") != null) {

double LoansAmount = Double.parseDouble(request.getParameter("LoansAmount"));
double Interest = Double.parseDouble(request.getParameter("Interest"));
int Tenure = Integer.parseInt(request.getParameter("Tenure"));

double emi = LoansAmount * (Interest / 1200.0) * (1 + Interest / 1200.0)
* Tenure / (1 - Math.pow(1 + Interest / 1200.0, -12 * Tenure));


out.println("EMI = " + emi);

// Connect to the MySQL database.
String url = "jdbc:mysql://localhost:3306/banking";
String username = "root";
String password = "123456";

Connection connection = null;
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(url, username, password);
    // Create a statement.
    Statement statement = connection.createStatement();

    // Select the EMI data from the `loans` table.
    String sql = "SELECT LoansAmount, tenure, interest FROM banking.loans WHERE userid=1";
    PreparedStatement preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setDouble(1, LoansAmount);
    ResultSet e3 = preparedStatement.executeQuery();

    // If the EMI data is found, then display it.
    if (e3 != null) {
        // Get the tenure and interest from the database.
        int dbTenure = e3.getInt("tenure");
        double dbInterest = e3.getDouble("interest");

        // Calculate the total amount.
        double totalAmount = emi * dbTenure;

        // Display the total amount.
        out.println("Total Amount = " + totalAmount);

        // Close the ResultSet object.
        e3.close();
    } else {
        out.println("No EMI data found in the database");
    }

} catch (SQLException e) {
    e.printStackTrace();
} finally {
    if (connection != null) {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
}
%>

</body>
</html>
