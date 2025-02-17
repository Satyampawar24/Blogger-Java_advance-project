package com.project.servlets;

import com.project.DAO.PostDao;
import com.project.DAO.helper.connectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class delete_post extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        
        try {
            // Get post ID from request
            int postId = Integer.parseInt(request.getParameter("postId"));

            // Get database connection
            PostDao postDao = new PostDao(connectionProvider.getConnection());

            // Call delete method
            boolean deleted = postDao.deletePost(postId);

            // Get session
            HttpSession session = request.getSession();
            
            if (deleted) {
                session.setAttribute("message", "Post deleted successfully!");
            } else {
                session.setAttribute("message", "Failed to delete post!");
            }

            // Redirect back to home or post list
            response.sendRedirect("delete.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }
}
