package com.poly.servlet;

import com.poly.dao.ProductDao;
import com.poly.models.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
//            out.print("vào được trang processRequest");
            String type=request.getParameter("_type");
            switch(type){
                case "DELETE":
                    deleteProduct(request, response );
                    break;
                case "UPDATE":
                    int id = Integer.parseInt(request.getParameter("productid"));
                    response.sendRedirect("tables/update_product.jsp?_type="+type+"&id="+id);
                    break;
                case "INSERT":
                    insertProduct(request, response );
                    break;
                case "EXE_UPDATE":
                    updateProduct(request, response );
                    break;
            }
        }catch(Exception ex){
            System.out.print("loi..."+ex.toString());
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
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("productid"));
            ProductDao productdao = new ProductDao();
         //   userdao.deleteUser(id);
            boolean result = productdao.deleteProduct(id);
            response.sendRedirect("tables/show_product.jsp");
        } catch (Exception ex) {
           // System.out.print("loi..." + ex.toString());
            ex.printStackTrace();

        }
        
    }
    
    private void insertProduct(HttpServletRequest request, HttpServletResponse response) {
        try{
             String name=request.getParameter("name");
             int price = Integer.parseInt(request.getParameter("price"));
             String note=request.getParameter("note");
             String image=request.getParameter("image");
             int category_id = Integer.parseInt(request.getParameter("category_id"));
            
            Product product = new Product(name,price,note,image,category_id);
            ProductDao productdao = new ProductDao();
            
            boolean result= productdao.insertProduct(product);
            response.sendRedirect("tables/show_product.jsp");
        }catch(Exception ex){
            System.out.print("loi..."+ex.toString());
            
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        try{
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            String note = request.getParameter("note");
            String image = request.getParameter("image");
            int category_id = Integer.parseInt(request.getParameter("category_id"));
            Product user = new Product(id,name,price, note, image, category_id);
            ProductDao productdao = new ProductDao();
            boolean result= productdao.updateProduct(user);
            response.sendRedirect("tables/show_product.jsp");
        }catch(Exception e){
            System.out.print("loi..."+e.toString());
            e.printStackTrace();
        }
    }
}
