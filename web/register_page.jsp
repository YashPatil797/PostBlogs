<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
    </head>
    <body>
        <%@include file="normal_navbar.jsp" %>
        
        <main class="d-flex align-items-center" style="height:110vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header">
                          Register Here
                        </div>
                        <div class="card-body">
                            
                            <form id="reg-form" action="RegisterServlet" method="post">
  
    <div class="mb-3">
    <label for="user_name" class="form-label">User Name</label>
    <input name="user_name" type="text" class="form-control" id="user_name">
  </div> 
                                
                                
                                <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">Please Enter You Email to register.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
                                
    <div class="mb-3"> 
        <label for="gender">Select Gender</label><br>
        <input type="radio" name="gender" id="gender1" value="male"/>Male &nbsp;&nbsp;
        <input type="radio" name="gender" id="gender2" value="female"/>Female 
     </div>                           
     <br>
  <div class="mb-3 form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">agree terms and conditions.</label>
  </div>
    <br>
    
  <button type="submit" class="btn btn-primary">submit</button>
</form>
                        </div>
                        <div class="card-footer">
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>    
        
        <!--Java Scripts -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        <script>
            $(document).ready(function()
            {
                console.log("Yes The Page is loaded");
                $('#reg-form').on('submit',function(event){
                     event.preventDefault();
                     let form=new FormData(this);
                     $.ajax({
                         url:"RegisterServlet",
                         type:'POST',
                         data:form,
                         success: function(data,textStatus,jqXHR){
                                   console.log(data);
                                   if((data.trim())==='done')
                                   {
                                      swal({
                                       title: "Registered!",
                                       text: "",
                                       icon: "success",
                                       button: "ok",
                                       }); 
                                   }
                                   else
                                   {
                                       swal(data);
                                   }
                         },
                         error:function(jqXHR,textStatus,errorThrown)
                         {
                              console.log("error occurred");   
                              swal("Error..");
                         },
                         processData:false,
                         contentType:false
                     });
                });
            });
        </script>
    </body>
</html>
