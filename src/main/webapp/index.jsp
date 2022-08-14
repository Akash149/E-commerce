
<%@page import="com.ecom.mykart.helper.Helpers"%>
<%@page import="com.ecom.mykart.entities.Category"%>
<%@page import="com.ecom.mykart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.ecom.mykart.entities.Product"%>
<%@page import="com.ecom.mykart.dao.ProductDao"%>
<%@page import="com.ecom.mykart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>e-com | Home</title>
        <%@include file="components/css_js.jsp"  %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <!--        show categories...-->
        <div class="row mt-3 mx-2">
            <%  String cat = request.getParameter("category");
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());

                List<Product> list = null;
                if (cat == null || cat.trim().equals("all")) {
                    list = dao.getAllProducts();
                } else {
                    int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                }
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>
            <div class="col-md-2">
                <ul class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action mt-4 active">
                        All Products
                    </a>
                    <%
                        for (Category c : clist) {
                    %>
                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>
                    <%
                        }
                    %>
                </ul>
            </div>
            <!--            show product....-->
            <div class="col-md-10">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%
                                for (Product p : list) {
                            %>
                            <div class="card">
                                <img src="products/<%= p.getpPhoto()%>" class="card-img-top" alt="">
                                <div class="card-body">
                                    <h6 class="card-title"><%= p.getpName()%></h6>
                                    <p class="card-text">
                                        <%= Helpers.get10Words("Hello")%>
                                    </p>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn">Buy now</button>
                                    <button class="btn-cart custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>,'<%= p.getpName()%>',<%= p.getPriceAfterDiscount()%>)">
                                        <i class="fa-solid fa-cart-plus"></i>
                                    </button>
                                    <button class="btn">&#8377; <%= p.getPriceAfterDiscount()%>/- 
                                        <span class="text-secondary discount-label"><%=p.getpPrice()%> - <%=p.getpDiscount()%>% off  </span>
                                    </button>
                                </div>
                            </div>
                            <%
                                }
                            %>

                            <%
                                if (list.size() == 0) {
                                    out.print("<h1> No data in this categoy </h1>");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modals.jsp" %>
        <script src="js/script.js"></script>
    </body>
</html>
