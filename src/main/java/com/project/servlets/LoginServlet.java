package com.project.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.project.DAO.userDAO;
import com.project.DAO.helper.connectionProvider;
import com.project.servlets.User; // Ensure User class is correctly imported

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/login") // URL Mapping
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
//          login 
//            fetch username and password from request
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");

            userDAO dao = new userDAO(connectionProvider.getConnection());

            User u = dao.getEmailPassword(userEmail, userPassword);

            if (u == null) {
                //login.................
//                error///
//                out.println("Invalid Details..try again");
               Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);

                response.sendRedirect("index.jsp");
            } else {
                //......
//                login success
                HttpSession s = request.getSession();
                s.setAttribute("currentUser", u);
                response.sendRedirect("profilePage.jsp");

            }

            out.println("</body>");
            out.println("</html>");
    
        }
        
        catch(Exception e) {
        	e.printStackTrace();
        }
    }
    
    

    
}
