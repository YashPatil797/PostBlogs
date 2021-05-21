<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <div class="container text-center">
            <img src="img/browser.png" class="img-fluid" width="300" height="200">
            <br><br>
            <h5 class="display-3">Sorry ! Something went wrong !..</h5>
            <%= exception %>
            <br><br><br>
            <a href="index.jsp" class="btn btn-lg ">Back_To</a>
             
        </div>
        
    </body>
</html>
