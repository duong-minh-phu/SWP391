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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class UpdateProduct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the form data
        String productId = request.getParameter("product_id");
        int categoryId = Integer.parseInt(request.getParameter("category_id"));
        String productName = request.getParameter("product_name");
        float productPrice = Float.parseFloat(request.getParameter("product_price"));
        String productDescribe = request.getParameter("product_describe");
        int quantity = Integer.parseInt(request.getParameter("product_quantity"));
        String img = request.getParameter("product_img");
        Category cate = new Category(categoryId);
        productDAO dao = new productDAO();
        // Create a new Product object with the form data
        Product product = new Product(productId , productName, productPrice, productDescribe, quantity, img);

        // Call the DAO to update the product in the database
        product.setCate(cate);
        dao.updateProduct(product);
        
        // Redirect back to the product list page
        response.sendRedirect("Productmanager");
    }
    }
