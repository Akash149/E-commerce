<%
    User user = (User) session.getAttribute("current-user");
    if(user == null) {
        session.setAttribute("message", "you are not logged in, Login first");
        response.sendRedirect("login.jsp");
        return;
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/css_js.jsp"  %>
        <title>Checkout </title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container text-center">
            <div class="row">
                <div class="col-md-6">
                    <!--                    cart-->
                    <div class="card mt-5" style="padding: 0px 10px;">
                        <h3 class="text-center mt-3" style="color: green;">Your selected item </h3>
                        <div class="card-body">
                            
                            <div class="cart-body mt-3">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <!--                    form details-->
                    <div class="card mt-5 mb-5" style="padding: 0px 10px;">
                        <h3 class="text-center mt-3">Your details for order </h3>
                        <div class="card-body" >
                            <form action="#" method="post">
                                <div class="form-group">
                                    <label>Email address</label>
                                    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" placeholder="Email" required="true">
                                </div>
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="<%= user.getUserName() %>" type="text" class="form-control" placeholder="Your name" required="true">
                                </div>
                                <div class="form-group">
                                    <label>Phone No.</label>
                                    <input value="<%= user.getUserPhone() %>" type="number" class="form-control" placeholder="Your name"required="true">
                                </div>
                                <div class="form-group">
                                    <label>Shipping address</label>
                                    <textarea value="<%= user.getUserAddress() %>" class="form-control" row="3" placeholder="Enter your address" required="true"></textarea>
                                </div>
                                <div class="container mb-2 text-center">
                                    <button class="btn">Order now</button>
                                    <button class="btn">Continue shopping</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
