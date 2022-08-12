package com.ecom.mykart.servlets;

import com.ecom.mykart.dao.CategoryDao;
import com.ecom.mykart.dao.ProductDao;
import com.ecom.mykart.entities.Category;
import com.ecom.mykart.entities.Product;
import com.ecom.mykart.helper.FactoryProvider;
import com.ecom.mykart.helper.Helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetching category data......
            String op = request.getParameter("operation");
            if (op.trim().equals("addcategory")) {
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDescription");

                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                //save category in database.....
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                //out.println("Category saved");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Category added successfully " + catId);
                response.sendRedirect("admin.jsp");
                return;
            } else if (op.trim().equals("addproduct")) {
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");

                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQunatity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());

                //get category by id....
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);

                //Product Save....
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);

                String path = request.getRealPath("/")+"products" + File.separator + part.getSubmittedFileName();
                
                //uploading code.....
                Helper.saveFile(part.getInputStream(),path);
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", pName + " successfully added in " + catId);
                response.sendRedirect("admin.jsp");
                return;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
