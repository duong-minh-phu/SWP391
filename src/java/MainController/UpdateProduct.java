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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category_id = request.getParameter("category_id");
        String product_name = request.getParameter("product_name");
        float product_price = Float.parseFloat(request.getParameter("product_price"));
        String product_describe = request.getParameter("product_describe");
        int quantity = Integer.parseInt(request.getParameter("product_quantity"));
        String img = request.getParameter("product_img");
        int cid = Integer.parseInt(category_id);
        Category cate = new Category(cid);

        // Tạo đối tượng Product mới
        Product product = new Product(product_name, product_price, product_describe, quantity, img);
        product.setCate(cate);

        // Gọi phương thức updateProduct trong lớp DAO để thực hiện cập nhật
        productDAO dao = new productDAO();
        dao.updateProduct(product);

        // Chuyển hướng về trang danh sách sản phẩm
        response.sendRedirect("Productmanager");
    }
}
