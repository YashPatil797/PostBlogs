<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entites.Category"%>
<%@page import="com.tech.blog.entites.Posts"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entites.Users"%>
<%@page errorPage="error_page.jsp" %>

<%
 Users u1=(Users)session.getAttribute("currentUser");
 if(u1==null)
 {
     response.sendRedirect("login.jsp");
 }
%>

<%
   int postId=Integer.parseInt(request.getParameter("post_id"));
   PostDao pd1=new PostDao(ConnectionProvider.getConnection());
   Posts pp1=pd1.getPostByPostId(postId);
   
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=pp1.getPtitle()%></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .post-title{
                font-weight:100;
                font-size:30px;
                
            }   
            .post-content{
                font-weight:100px;
                font-size:25px;
            }
            
        </style>
    </head>        
    <body>
        
        <!--normal_navbar -->
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="index.jsp">Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Geekify  <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Data Base Management</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structures</a>
        </div>
      </li>
      <li class="nav-item">
          <a  href="#" class="nav-link" data-toggle="modal" data-target="#add-post-modal">Do Post</a>
      </li>
    </ul>
      
      
    <ul class="navbar-nav mr-right">
        
        <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" >  <%=u1.getName()%>  </a>
      </li> 
        
       <li class="nav-item">
        <a class="nav-link" href="LogoutServlet">Logout</a>
      </li> 
    </ul>    
  </div>
</nav>
        
        <!--navbar_Ends -->
        
        <!--Main Content Of Body -->
         
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="post-title"> <%=pp1.getPtitle()%></h4>
                        </div>
                        <div class="card-body">
                            <p class="post-content"> <%=pp1.getpContent()%> </p>
                        </div>
                        <div class="card-footer">
                            
                            
                        </div>
                    </div>>
                </div>
            </div>            
        </div>
        
        <!--End Of Main Coneten of Body -->
        <!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Tech-Blog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="img/download.jpg" class="img-fluid" style="border-radius:50%;max-width:150px;">
              <br>
              <h5 class="modal-title" id="exampleModalLabel"> <%=u1.getName()%> </h5>
              <!-- Details using table-->
              <!--table start-->
                          <table class="table">
                            
                            <tbody>
                             <tr>
                             <th scope="row">ID</th>
                             <td><%=u1.getId()%> </td>
                             </tr>
                             <tr>
                             <th scope="row">Email</th>
                             <td><%=u1.getEmail() %></td>
                             </tr>
                             <tr>
                            <th scope="row">Gender</th>
                            <td><%=u1.getGender() %></td>
                            </tr>
                            </tbody>
                          </table>
              
              <!--Table Ends -->
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
        <!--modal Ends-->
        <!--Postmodal Stars-->

<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Enter Blog Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form id="add-post-form" action="AddPostServlet" post="post">
              <div class="form-group">
                  <select class="form-control" name="cid">
                      <option selected disabled>---Select Category----</option>
                      <% PostDao p1 =new PostDao(ConnectionProvider.getConnection());
                         ArrayList<Category> a1=p1.getAllCategories();
                         for(Category c1:a1)
                         {
                      %>
                      <option value="<%=c1.getCid()%>" > <%=c1.getName()%> </option>
                      <%
                          }
                      %>
                  </select>
              </div> 
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Enter Post Title" class="form-control"/>
              </div>
              <div class="form-group">
                  <textarea name="pContent" class="form-control" placeholder="Enter Your Content" style="height:300px;"> 
                  
                  </textarea>
              </div>
                  <div class="container text-center">
                      
                      <button type="submit" class="btn btn-outline-success">Post</button>  
                  </div>
         </form>
      </div>
    </div>
  </div>
</div>
          
        
        <!--Post modal Ends-->
         <!--Java Scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


        <!--Javascript Ends -->
        <!--Now Add Post JS-->
        <script>
            $(document).ready(function(e){
               
               $("#add-post-form").on("submit",function(event){
                   //This code will gets executed when it is submitted..
                   event.preventDefault();
                   console.log("Hello Guys");
                  let form=new FormData(this); 
                  //Now requesting to Server
                  $.ajax({
                      url:"AddPostServlet",
                      type:'POST',
                      data:form,
                      success:function(data,textStatus,jqXHR){
                          console.log(data);                
                          if((data.trim())=='done')
                          {
                              swal("Good job!", "saved Successfully!", "success");
                          }
                          else
                          {
                              swal("Error!", "Something Went Wrong!", "error");
                          }
                      },
                      error:function(jqXHR,textStatus,errorThrown){
                          console.log("error..");
                          swal("Error!", "Something Went Wrong!!", "error");
                      },
                      processData:false,
                      contentType:false
                  })
        
               });
               
            });
        </script>   

        
    </body>
</html>
