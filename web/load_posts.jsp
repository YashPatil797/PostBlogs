<%@page import="java.util.*"%>
<%@page import="com.tech.blog.entites.Posts"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

<div class="row">
<%

  PostDao d1 =new PostDao(ConnectionProvider.getConnection());
  int cid=Integer.parseInt(request.getParameter("cid"));
  List<Posts> a1;
  if(cid==0)
  {
      a1=d1.getAllPosts();
  }
  else
  {
      a1=d1.getPostByCatId(cid);
  }
  
  if(a1.size()==0)
  {
      out.println("<h3 class='display-3 text-center'>No Posts Available.!  </h3>");
      return;
  }
  for(Posts xx:a1)
  {
 %>
 <div class="col-md-6 mt-2">   
   <div class="card">
       <div class="card-body">           
          <b> <%=xx.getPtitle()%> </b> 
          <p><%=xx.getpContent()%> </p>
       </div>
       <div class="card-footer text-center">
           <a href="show_blog_page.jsp?post_id=<%=xx.getPid()%>" class="btn btn-primary"> Read more...</a>
       </div>
   </div>  
 </div>   
 <%   
   }
%>

</div>