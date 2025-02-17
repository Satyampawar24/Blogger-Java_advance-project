<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@page import="com.project.entites.Message"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%@ include file="navBar.jsp" %>

<main>
    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card mt-5">
                    <div class="card-header text-center">
                        <h3>Login</h3>
                    </div>
                    <div class="card-body">
                        <!-- Display Error Message -->
                        <% 
                            String errorMessage = (String) request.getAttribute("error");
                            if (errorMessage != null) {
                        %>
                            <div class="alert alert-danger text-center">
                                <%= errorMessage %>
                            </div>
                        <% } %>
                                        <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getCssClass() %>" role="alert">
                                <%= m.getContent() %>
                            </div> 


                            <%        
                                    session.removeAttribute("msg");
                                }

                            %>

                        <form action="login" method="POST">
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input required type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input required type="password" class="form-control" id="password" name="password" placeholder="Enter password">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </form>

                        <div class="text-center mt-3">
                            <a href="RegistrationPage.jsp">Register Here</a>
                        </div>
                           
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
