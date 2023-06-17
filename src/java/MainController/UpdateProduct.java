/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.productDAO;
import Entity.Category;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Administrator
 */
@MultipartConfig()
public class UpdateProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String category_id = request.getParameter("category_id");
            String productId = request.getParameter("product_id");
            String product_name = request.getParameter("product_name");
            String product_price = request.getParameter("price");
            String product_quantity = request.getParameter("quantity");
            String product_describe = request.getParameter("describe");
            int quantity = Integer.parseInt(product_quantity);
            Float price = Float.parseFloat(product_price);
            int cid = Integer.parseInt(category_id);
            productDAO dao = new productDAO();
            Category cate = new Category(cid);

            Part filePart = request.getPart("product_img");
            System.out.println(filePart);
            String realPath = request.getServletContext().getRealPath("/images/");
            System.out.println(realPath);
            String fileName = filePart.getSubmittedFileName(); // Lấy tên tệp ảnh gốc
            System.out.println(fileName);

            if (fileName != null) {
                String destinationPath = realPath + fileName;
                System.out.println(destinationPath);

                filePart.write(destinationPath);

                String imagePath = "images/" + fileName;
                System.out.println(imagePath);

                Product product = new Product(product_name, price, product_describe, quantity, imagePath);

                dao.updateProduct(product);

                // Chuyển hướng người dùng đến trang danh sách sản phẩm
                request.getRequestDispatcher("MainController?action=productmanager").forward(request, response);
            }
            if (fileName == null) {
                response.sendRedirect("404.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/404.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
