<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title> Welcome to Admin Home</title>
</head>
<body>

<div class="container">
    <h1>Admin Home</h1>
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <i class="fa fa-user"></i> Customer Details
                    </h5>
                    <p class="card-text">View and manage customer details.</p>
                    <a href="customerDetails.jsp" class="btn btn-primary">View</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <i class="fa fa-check-circle"></i> Approval
                    </h5>
                    <p class="card-text">Approve or reject loan applications.</p>
                    <a href="approval.jsp" class="btn btn-primary">View</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <i class="fa fa-user-circle"></i> Profile
                    </h5>
                    <p class="card-text">View and modify your profile.</p>
                    <a href="profile.jsp" class="btn btn-primary">View</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
