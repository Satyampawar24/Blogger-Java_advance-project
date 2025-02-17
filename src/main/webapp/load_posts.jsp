<%@page import="com.project.servlets.User"%>

<%@page import="com.project.entites.Posts"%>
<%@page import="java.util.List"%>
<%@page import="com.project.DAO.helper.connectionProvider"%>
<%@page import="com.project.DAO.PostDao"%>
<%@page import="com.project.servlets.delete_post"%>


<div class="row">

    <%
    User uuu=(User)session.getAttribute("currentUser");
            
            Thread.sleep(1000);
            PostDao d = new PostDao(connectionProvider.getConnection());
            
            int cid = Integer.parseInt(request.getParameter("cid"));
            List<Posts> posts = null;
            if (cid == 0) {
                posts = d.getAllPosts();
            } else {
                posts = d.getPostByCatId(cid);
            }
            
            if (posts.size() == 0) {
                out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
                return;
            }
            
            for (Posts p : posts) {
    %>

    <div class="col-md-5 mt-4" style=" box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.3);">
        <div class="card">
            <img class="card-img-top" src="pics/<%= p.getpPic()%>" alt="Card image cap"  style="width: 100%; height: auto; object-fit: cover; border-radius: 10px;">
            <div class="card-body">
            
                 
            
                <b><%= p.getpTitle()%></b>  
             
                  <p><%= p.getpDate()%></p>

            </div>
            <div class="card-footer primary-background text-center">
            
                <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                <form action="delete" method="post">
    <input type="hidden" name="postId" value="<%= p.getPid() %>">
    
    <button type="submit" class="btn btn-outline-danger btn-sm" onclick="return confirm('Are you sure you want to delete this post?');" value="<%= p.getPid() %>">
        <i class="fa fa-trash" ></i> Delete
    </button>
</form>
                
                
            </div>

        </div>


    </div>


    <%
        }
        

    %>

</div>