<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Banking Loan Management System User Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="home.css">

</head>
<body>
<h1>Welcome To User Dash board</h1>
	<div class="mainContent">
	
	<a href="transaction.jsp">
	<div class="icons">
	<h3><i class="fas fa-money-bill-alt fa-5x"></i></h3>
	<span>Transaction Details</span>
	</div>
	</a>
	
	<a href="emi.jsp">
	<div class="icons">
	  <h3><i class="fas fa-calculator fa-5x"></i></h3>
	  <span>EMI Plans</span>
	</div>
	</a>
	
	<a href="banktype.jsp">
	<div class="icons">
	  <h3><i class="fas fa-building fa-5x"></i></h3>
	  <span>Bank Type</span>
	</div>
	</a>
	
	<a href="credit.jsp">
	<div class="icons">
  	<h3><i class="fas fa-credit-card fa-5x"></i></h3>
  	<span>Credit Score</span>
	</div>
	</a>
	</div>
</body>
</html>