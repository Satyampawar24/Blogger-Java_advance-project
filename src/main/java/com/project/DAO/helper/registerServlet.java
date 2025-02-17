package com.project.DAO.helper;
import java.io.IOException;
import java.io.PrintWriter;

import com.project.DAO.userDAO;
import com.project.servlets.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@MultipartConfig
@WebServlet("/reg") // URL Mapping
public class registerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
   try(PrintWriter out=response.getWriter()){
	 out.println("<!Doctype html>");
	 out.println("<html>");
	 out.println("<head>");
	 out.println("<body>");
//fetch all data from form
	  String check=request.getParameter("check");
	 out.println(check);
	 if(check==null) {
		 response.sendRedirect("ErrorPage.jsp");
	 }
	 else {
		 String name=request.getParameter("name");
		 String email=request.getParameter("email");
		 String password=request.getParameter("password");
		 String gender=request.getParameter("gender");
		 //create the obj userDao
		 userDAO dao=new userDAO(connectionProvider.getConnection());
		 User user=new User(name,email,password,gender);
		 if( dao.saveUser(user)) {
			 response.sendRedirect("RegistrationSuccessful.jsp");
		 }
		 else {
			 response.sendRedirect("ErrorPage.jsp");
		 }
	 }
	 out.println("</body>");
	 out.println("</head>");
	 out.println("</html>");
   }
   catch(Exception e) {
	   e.printStackTrace();
   }
    }
}
