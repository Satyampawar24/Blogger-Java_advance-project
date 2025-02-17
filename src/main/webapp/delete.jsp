<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Success</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .fade-in {
            opacity: 0;
            animation: fadeIn 1s forwards;
        }
        .fade-out {
            animation: fadeOut 1s forwards;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }
    </style>
</head>
<body class="flex items-center justify-center h-screen bg-gray-100">

    <div id="successMessage" class="bg-green-500 text-white p-4 rounded-lg shadow-lg text-center fade-in">
        <h2 class="text-xl font-bold">Post Deleted Successfully!</h2>
    </div>

    <script>
        setTimeout(() => {
            document.getElementById("successMessage").classList.add("fade-out");
        }, 2000);

        setTimeout(() => {
            window.location.href = "index.jsp"; // Change this to your desired redirect page
        }, 3000);
    </script>

</body>
</html>
