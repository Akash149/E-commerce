
package com.ecom.mykart.servlets;

import com.ecom.mykart.dao.UserDao;
import com.ecom.mykart.entities.User;
import com.ecom.mykart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            //Authenticating user....................
            UserDao userdao = new UserDao(FactoryProvider.getFactory());
            User user = userdao.getUserByEmailandPassword(email, password);
            //System.out.println(user);
            HttpSession httpsession = request.getSession();
            if(user==null) {
                out.println("Invalid details");
                httpsession.setAttribute("message","Invalid deatils");
                response.sendRedirect("login.jsp");
                return;
            } else {
                out.println("Welcome " + user.getUserName());
                
                //Login.......
                httpsession.setAttribute("current-user",user);
                
                if(user.getUserType().equals("admin")) {
                    response.sendRedirect("admin.jsp");
                } else if(user.getUserType().equals("normal")){
                    response.sendRedirect("normal.jsp");
                } else {
                    out.println("We have not identified user!");
                }
                //Admin: admin.jsp.............
                
                
                //Normal: usr.jsp..........
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
    }// </editor-fold>

}
