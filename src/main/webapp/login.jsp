
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <%@include file="components/css_js.jsp"  %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">                    
                    <div class="card mt-5">
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <div class="container text-center mt-5">
                                <h3 style="font-weight: 800">Login here!</h3>
                            </div>
                            <form action="Login" method="post">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" required="true" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" required="true" name="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter password">
                                 </div> 
                                <div class="container text-center mb-5">
                                    <button type="submit" class="btn btn-outline-success">Login</button>
                                    <a  href="register.jsp" class="btn btn-outline-success">Register</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
