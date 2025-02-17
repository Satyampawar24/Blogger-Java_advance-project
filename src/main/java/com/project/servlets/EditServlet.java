package com.project.servlets;



import com.project.DAO.userDAO;



import com.project.entites.Message;
import com.project.servlets.User;
import com.project.DAO.helper.connectionProvider;
import com.project.DAO.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@WebServlet("/edit")
@MultipartConfig
public class EditServlet extends HttpServlet {

	private static final long serialVersionUID = -8792285996998256888L;

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

//            fetch all data
            String userEmail = request.getParameter("email");
            String userName = request.getParameter("name");
            String userPassword = request.getParameter("password");
           
            Part part = request.getPart("image");

            String imageName = part.getSubmittedFileName();

            //get the user from the session...
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            
            user.setProfile(imageName);
           String oldFile = user.getProfile();

            user.setProfile(imageName);

            //update database....
            userDAO userDao = new userDAO(connectionProvider.getConnection());

            boolean ans = userDao.updateUser(user);
            if (ans) {
            	out.println("done");

                String path = request.getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();

//                //start of photo  work
//                //delete code
                String pathOldFile = request.getServletContext().getRealPath("/") + "pics" + File.separator + oldFile;

                if (!oldFile.equals("johnny.jpg")) {
                    Helper.deleteFile(pathOldFile);
                }

                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Profile updated...");
                    Message msg = new Message("Profile details updated...", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                 
                    Message msg = new Message("Something went wrong..", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }

                //end of phots work
            } else {
                out.println("not updated..");
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
              s.setAttribute("msg", msg);

            }

            response.sendRedirect("profilePage.jsp");

            out.println("</body>");
            out.println("</html>");
        }
      
    }

}
