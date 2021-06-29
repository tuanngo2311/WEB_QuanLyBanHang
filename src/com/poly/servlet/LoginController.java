/*
 * To change this license header, choose License Headers in Project Properties. * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.poly.servlet;

import com.poly.dao.UserDao;
import com.poly.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("txtName");
            String password = request.getParameter("txtPass");
            UserDao userdao = new UserDao();
            User user = userdao.checkLogin(username, password);
            if (user == null) {
            	request.getRequestDispatcher("login.jsp?message=User Invaliad").forward(request, response);
//                response.sendRedirect(request.getContextPath() + "/login.jsp?message=User Invaliad");

            } else {
                HttpSession session = request.getSession();
                session.setAttribute("userlogined", user);
               // 1 admin, 0 user
                if(user.getRole() == 1)
                response.sendRedirect(request.getContextPath() + "/tables/dashboard.jsp");
                else
                  response.sendRedirect(request.getContextPath() + "/indexKH.jsp");  
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
