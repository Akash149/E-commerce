
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/css_js.jsp"  %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body px-5 mb-4">
                            <%@include file="components/message.jsp" %>
                            <h3 class="text-center my-3">Sign up here!!</h3>
                            <form action="RegisterServlet" method="post">
                                <div class="form-group">
                                    <label for="name">Name</label>
                                    <input type="text" required="true" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" required="true" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" required="true" name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter password">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="number" required="true" name="user_phnumber" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter phone number">
                                </div>
                                <div class="form-group">
                                    <label for="address">Address</label>
                                    <textarea type="text" required="true" name="user_address" style="height: 100px;" class="form-control" id="phone" placeholder="Enter your Address"></textarea>
                                </div>

                                <div class="container text-center">
                                    <button type="submit" class="btn">Register</button>
                                    <a href="login.jsp" class="btn">Login</a>
                                </div>
                            </form>
                        </div>
                    </div>               
                </div>
            </div>
        </div>
    </body>
</html>
