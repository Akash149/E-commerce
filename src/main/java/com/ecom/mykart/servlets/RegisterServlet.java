
package com.ecom.mykart.servlets;

import com.ecom.mykart.entities.User;
import com.ecom.mykart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            try {
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phnumber");
                String userAddress = request.getParameter("user_addressr");
                String userType = request.getParameter("userType");
                
                if(userName.isEmpty()) {
                    out.println("Name is empty");
                    return;
                }
                
                //creating user object to store data
                User user = new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, userType);
                
                int userId;
                try (Session hibernateSession = FactoryProvider.getFactory().openSession()) {
                    Transaction tx = hibernateSession.beginTransaction();
                    userId = (int) hibernateSession.save(user);
                    tx.commit();
                }
                
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Registration Successfull !!" + userId);
                response.sendRedirect("register.jsp");
                return;
                
            } catch(Exception e) {
                e.printStackTrace();
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
