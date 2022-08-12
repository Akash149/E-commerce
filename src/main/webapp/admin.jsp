<%@page import="java.util.List"%>
<%@page import="com.ecom.mykart.entities.Category"%>
<%@page import="com.ecom.mykart.dao.CategoryDao"%>
<%@page import="com.ecom.mykart.helper.FactoryProvider"%>
<%@page import="com.ecom.mykart.entities.User"%>

<%
    User user = (User) session.getAttribute("current-user");

    if (user == null) {
        session.setAttribute("message", "your are not loged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            response.sendRedirect("normal.jsp");
            return;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Pannel</title>
        <%@include file="components/css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container admin mb-4">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <!--First Row-->
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card mt-2">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px; max-height: 100px; " class="img-fluid mt-2 rounded-circle" src="image/group.png" alt="user_icon">
                            </div>
                            <h1 class="text-uppercase text-muted">Users</h1>
                            <h1>200</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mt-2">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px; max-height: 100px; " class="img-fluid mt-2 rounded-circle" src="image/list.png" alt="user_icon">
                            </div>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                            <h1>40</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mt-2">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px; max-height: 100px; " class="img-fluid mt-2 rounded-circle" src="image/box.png" alt="user_icon">
                            </div>
                            <h1 class="text-uppercase text-muted">Products</h1>
                            <h1>500</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!--Second Row-->
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card mt-2" data-toggle="modal" data-target="#add-category-Modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px; max-height: 100px; " class="img-fluid mt-2 rounded-circle" src="image/plus.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                            <h1>200</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card mt-2" data-toggle="modal" data-target="#add-product-Modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 80px; max-height: 100px; " class="img-fluid mt-2 rounded-circle" src="image/plus.png" alt="user_icon">
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add product</h1>
                            <h1>200</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!--      Add category Modal-->
            <div class="modal fade" id="add-category-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ProductOperationServlet" method="post">
                                
                                <input type="hidden" name="operation" value="addcategory">
                                
                                <div class="form-group">
                                    <input type="text" required="true" class="form-control" name="catTitle" placeholder="Enter category title" required/>
                                </div>
                                <div class="form-group">
                                    <textarea style="height: 120px;" class="form-control" required="true" placeholder="Enter description" name="catDescription" required></textarea>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn">Add Category</button>
                                    <button type="button" class="btn" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--            End category model-->
            
            <!--            Add product Modal-->
             <div class="modal fade" id="add-product-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header custom-bg text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Fill product details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                                
                                <input type="hidden" name="operation" value="addproduct">
                                
                                <div class="form-group">
                                    <input type="text" required="true" class="form-control" name="pName" placeholder="Enter product name"/>
                                </div>
                                <div class="form-group">
                                    <textarea style="height: 120px;" class="form-control" required="true" placeholder="Enter product description" name="pDesc"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="number" required="true" class="form-control" name="pPrice" placeholder="Enter product price"/>
                                </div>
                                <div class="form-group">
                                    <input type="number" required="true" class="form-control" name="pDiscount" placeholder="Enter product discount"/>
                                </div>
                                <div class="form-group">
                                    <input type="number" required="true" class="form-control" name="pQuantity" placeholder="Enter product quantity"/>
                                </div>
                                <%
                                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                    List<Category> list = cdao.getCategories();
                                %>
                                <div class="form-group">
                                    <select name="catId" class="form-control" id="">
                                        <%
                                            for(Category c:list) {
                                        %>
                                        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="">Select picture of Product</label><br>
                                    <input type="file" name="pPic" required="true"/>
                                </div>
                                
                                <div class="container text-center">
                                    <button type="submit" class="btn">Add Product</button>
                                    <button type="button" class="btn" data-dismiss="modal">Close</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--            End product modal-->
    </body>
</html>
