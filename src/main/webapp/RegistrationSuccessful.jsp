<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful</title>
     <title>Registration Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
       .containers {
    font-family: Arial, sans-serif;
    background-color: #e3f2fd;
    text-align: center;
    padding: 50px;
    color: Black;
    border-radius: 30px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    
    /* Centering the container */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
       
        .btn1 {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: white;
            color: ;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: 0.3s;
        }
        .btn1:hover {
            background-color: #1976D2;
            color: white;
        }
    </style>
</head>
<body>
<%@include file="navBar.jsp" %>
<br><br>
    <div class="containers" class="col-md-4 offset-md-4">
        <h1>Registration Successful!</h1>
        <p>Your account has been created successfully.</p>
        <a href="LoginPage.jsp" class="btn1">Go to Login</a>
    </div>
    
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
</body>
</html>
    