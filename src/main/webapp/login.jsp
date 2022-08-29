
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="components/s_up.css">
        <title>Home</title>
        
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">                    
                    <div class="card mt-5">
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <div class="actionBtns">
                                <button class="actionBtn signupBtn" onclick="action();">Signup</button>
                                <button class="actionBtn signupBtn" onclick="actionr();">Login</button>
                                <button class="moveBtn">Signup</button>
                            </div>  

                            <div class="userForm">
                                <form action="RegisterServlet" method="post" class="form signup signupForm">
                                    <div class="inputGroup">
                                        <input type="text" name="user_name" placeholder="Name">
                                    </div>
                                    <div class="inputGroup">
                                        <input type="text" name="user_email" placeholder="Email address">
                                    </div>
                                    <div class="inputGroup">
                                        <input type="password" name="user_password" placeholder="Password">
                                    </div>
                                    <div class="inputGroup">
                                        <input type="password" name="user_rpassword" placeholder="Confirm Password">
                                    </div>
                                    <div class="inputGroup">
                                        <input type="number" name="user_number" placeholder="Mobile No.">
                                    </div>
                                    <div class="inputGroup">
                                        <textarea name="address" name="user_address" id="" rows="1" placeholder="Enter your address"></textarea>
                                    </div>
                                    <button type="submit" class="submitBtn">Signup</button>
                                </form>
                            </div>

                            <div class="userForm">
                                <form action="Login" method="post" class="form signin">
                                    <div class="inputGroup">
                                        <input type="text" name="email" placeholder="Email address">
                                    </div>
                                    <div class="inputGroup">
                                        <input type="password" name="password" placeholder="Password">
                                    </div>
                                    <button type="submit" class="submitBtn">Signin</button>
                                </form>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="components/s_up.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!--<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/script.js"></script>
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
