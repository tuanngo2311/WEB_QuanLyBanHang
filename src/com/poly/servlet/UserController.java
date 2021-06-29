package com.poly.servlet;

import com.poly.dao.UserDao;
import com.poly.models.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String type=request.getParameter("_type");
             switch(type){
                case "DELETE":
                    System.out.println("do dk tra");
                    deleteUser(request, response );
                    break;
                case "UPDATE":
                    //http://localhost:27297/demo-asm-jv4/admin/update_user.jsp?_type=UPDATE&id=1
                    int id = Integer.parseInt(request.getParameter("userid"));//
                    response.sendRedirect("tables/update_user.jsp?_type="+type+"&id="+id);//
                    break;
                case "INSERT":
                    insertUser(request, response );
                    break;
                case "REGISTER":
                	insertRegister(request, response );
                    break;
                case "EXE_UPDATE":
                    updateUser(request, response );
                    break;
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
    void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("userid"));
            UserDao userdao = new UserDao();
         //   userdao.deleteUser(id);
            boolean result = userdao.deleteUser(id);
            response.sendRedirect("tables/show_user.jsp");
            
        } catch (Exception ex) {
           // System.out.print("loi..." + ex.toString());
            ex.printStackTrace();
        }
        
    }

    void insertUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int role = Integer.parseInt(request.getParameter("role"));
            User user = new User(username, password, fullname, email, phone, role);
            UserDao userdao = new UserDao();

            boolean result = userdao.insertUser(user);
            response.sendRedirect("tables/show_user.jsp");
        } catch (Exception ex) {
            System.out.print("loi..."+ex.toString());
//            ex.printStackTrace();
        }
    }
    
    void insertRegister(HttpServletRequest request, HttpServletResponse response) {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int role = Integer.parseInt(request.getParameter("role"));
            User user = new User(username, password, fullname, email, phone, role);
            UserDao userdao = new UserDao();

            boolean result = userdao.insertUser(user);
            response.sendRedirect("register.jsp");
        } catch (Exception ex) {
            System.out.print("loi..."+ex.toString());
//            ex.printStackTrace();
        }
    }
    
    void updateUser(HttpServletRequest request, HttpServletResponse response){
        try{
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int role = Integer.parseInt(request.getParameter("role"));
            User user = new User(id,username,password, fullname, email, phone, role);
            UserDao userdao = new UserDao();
            boolean result= userdao.updateUser(user);
            response.sendRedirect("tables/show_user.jsp");
        }catch(Exception ex){
            System.out.print("loi..."+ex.toString());
            
        }
    }
}
