package com.project.servlets;



import com.project.DAO.PostDao;

import com.project.entites.Posts;
import com.project.servlets.User;
import com.project.DAO.helper.connectionProvider;
import com.project.DAO.helper.*;
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

/**
 *
 * @author Durgesh
 */
@WebServlet("/AddPost")
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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

            int cid = Integer.parseInt(request.getParameter("cid"));
            String pTitle = request.getParameter("pTitle");
            String pContent = request.getParameter("pContent");
            String pCode = request.getParameter("pCode");
            Part part = request.getPart("pic");
//            getting currentuser id
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

//            out.println("your post title is " + pTitle);
//            out.println(part.getSubmittedFileName());
            Posts p = new Posts(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
            PostDao dao = new PostDao(connectionProvider.getConnection());
            if (dao.savePost(p)) {

                String path = request.getServletContext().getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
                out.println("done");
            } else {
                out.println("error");
            }

        }
    }


}

