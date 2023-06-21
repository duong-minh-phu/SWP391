/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.productDAO;
import DAO.ratingDAO;
import Entity.Rating;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ROG STRIX
 */
@WebServlet(name = "Productdetail", urlPatterns = {"/Productdetail"})
public class Productdetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try  {
            String product_id = request.getParameter("product_id");
            ratingDAO rate = new ratingDAO();
            productDAO c = new productDAO();
            List<Rating> rating = rate.getRatingsByProductID(product_id);
            Entity.Product product = c.getProductByID(product_id);
            int category_id = product.getCate().getCategory_id();
            if(product.getQuantity()==0){
                 request.setAttribute("detail", "Mặt hàng này đã hết xin chọn loại khác!!!");
            }
            List<Entity.Product> productByCategory = c.getProductByCategory(category_id);
            request.setAttribute("ReviewData", rating);
            request.setAttribute("ProductData", product);
            request.setAttribute("ProductByCategory", productByCategory);
            request.getRequestDispatcher("product-details.jsp").forward(request, response);
        }catch(Exception ex){
            
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
