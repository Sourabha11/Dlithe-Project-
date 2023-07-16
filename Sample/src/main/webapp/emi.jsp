<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>EMI Plans</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
<h1>EMI Plans</h1>

<h2>Choose your EMI plan</h2>
<input type="range" min="10000" max="100000" step="1000" value="10000" id="emi-slider" class="round">
<p>Loan amount: <span id="emi-amount"></span></p>

<script>
var slider = document.getElementById("emi-slider");
var amount = document.getElementById("emi-amount");

slider.oninput = function() {
  amount.innerHTML = slider.value;
};

function getEMIPlan(loanAmount) {
  // Connect to the MySQL database
  var connection = new XMLHttpRequest();
  connection.open("GET", "/emiplans.jsp?loanAmount=" + loanAmount, true);
  connection.onload = function() {
    if (connection.status === 200) {
      // The request was successful
      var response = connection.responseText;
      document.getElementById("emi-plan").innerHTML = response;
    } else {
      // The request failed
      document.getElementById("emi-plan").innerHTML = "Failed to get EMI plan";
    }
  };
  connection.send();
}
</script>

<p id="emi-plan"></p>

</body>
</html>
