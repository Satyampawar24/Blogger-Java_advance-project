<%@page import="java.sql.Connection"%>
<%@page import="com.project.DAO.helper.connectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blogger</title>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa fa-certificate"></i> BLOGGER</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><i class="fa fa-home"></i> Home</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-recycle"></i> Menu
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fa fa-address-book"></i> Contact</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="LoginPage.jsp"><i class="fa fa-sign-in"></i> Login</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="RegistrationPage.jsp"><i class="fa fa-user-plus"></i> Sign Up</a>
                    </li>
                </ul>

                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-5">
        <h1 class="text-center">Welcome to Blogger</h1>
        <p class="text-center">Explore our blogs on Programming, Projects, and Data Structures.</p>
        
        <div class="row">
            <div class="col-md-6">
                <img src="https://uploads-ssl.webflow.com/5f2429f172d117fcee10e819/605c62f4c78c4ba46a1268be_avatar-1-p-2000.jpeg"
                    class="img-fluid rounded" alt="Blog Image">
            </div>
            <div class="col-md-6">
                <h2>Interactive <span>Artist!</span></h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Quod doloremque, accusamus nam ipsa asperiores
                    soluta amet nisi veritatis mollitia dolorum est deserunt quidem assumenda enim tempore quia fuga eaque
                    eum.</p>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center p-3 mt-5">
        <p>&copy; 2025 Blogger | Designed by You</p>
    </footer>

    <!-- Bootstrap & jQuery Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
