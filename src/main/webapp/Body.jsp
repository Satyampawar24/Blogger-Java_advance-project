<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="com.project.servlets.User"%>
<%@page import="com.project.servlets.logoutServlet"%>
<%@page import="com.project.servlets.EditServlet"%>
<%@page import="com.project.entites.Message"%>
<%@page import="com.project.entites.Posts"%>
<%@page import="com.project.DAO.PostDao"%>
<%@page import="com.project.entites.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.DAO.helper.connectionProvider"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>post</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Sidebar Styles */
        .content{
        background:#FEF6EF;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background: #f8f9fa;
            padding-top: 20px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
        }
        .sidebar a {
            display: block;
            padding: 12px;
            font-size: 1rem;
            color: #333;
            text-decoration: none;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: #007bff;
            color: white;
            border-radius: 10px;
        }
        /* Content Styling */
        .content {
            margin-left: 270px;
            padding: 20px;
        }
        .card-custom {
            transition: all 0.3s ease-in-out;
        }
        .card-custom:hover {
            transform: scale(1.02);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .steps {
            display: flex;
            gap: 20px;
            justify-content: center;
        }
        .step-card {
            text-align: center;
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 180px;
        }
        .step-card i {
            font-size: 30px;
            color: #007bff;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <a href="#" onclick="getPosts(0, this)"  class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--categories-->

                            <%          
                            PostDao d = new PostDao(connectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) {

                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>


                            <%                                        }

                            %>
</div>

<!-- Main Content -->
<div class="content">
    <h2>🚀 This Is Your Blog</h2>
    <p>Follow this structured roadmap to become proficient in DSA.</p>

   <!-- Loader -->
                <div class="container text-center" id="loader">
                    <i class="fa fa-spinner fa-4x fa-spin text-primary"></i>
                    <h4 class="mt-3">Fetching Posts...</h4>
                </div>
                <div class="container-fluid" id="post-container">

                        </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <!--loading post using ajax-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function getPosts(catId, temp) {
        $("#loader").show();
        $("#post-container").hide();
        $(".c-link").removeClass("active");

        $.ajax({
            url: "load_posts.jsp",
            data: {cid: catId},
            success: function (data, textStatus, jqXHR) {
                console.log("Data loaded successfully");
                $("#loader").hide();
                $("#post-container").show();
                $("#post-container").html(data);
                $(temp).addClass("active");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("AJAX Error:", textStatus, errorThrown);
                $("#loader").hide();
                $("#post-container").html("<h4 class='text-danger'>Failed to load posts. Please try again.</h4>").show();
            }
        });
    }

    $(document).ready(function () {
        let allPostRef = $(".c-link").first();
        if (allPostRef.length > 0) {
            getPosts(0, allPostRef[0]); // Ensure it's not undefined
        }
    });
</script>

</body>
</html>
    