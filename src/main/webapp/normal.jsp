<%@page import="com.ecom.mykart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if(user.getUserType().equals("admin")) {
            response.sendRedirect("admin.jsp");
            return;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/css_js.jsp" %>
        <title>user Page</title>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>This is Normal page....</h1>
    </body>
</html>
