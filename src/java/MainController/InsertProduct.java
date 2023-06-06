package MainController;

import DAO.productDAO;
import Entity.Category;
import Entity.Product;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "InsertProduct", urlPatterns = "/InsertProduct")
public class InsertProduct extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String category_id = request.getParameter("category_id");
            String product_name = request.getParameter("product_name");
            String product_price = request.getParameter("price");
            String product_quantity = request.getParameter("quantity");
            String product_img = "images/" + request.getParameter("product_img");
            String product_describe = request.getParameter("describe");
            int quantity = Integer.parseInt(product_quantity);
            Float price = Float.parseFloat(product_price);
            int cid = Integer.parseInt(category_id);
            productDAO dao = new productDAO();
            Category cate = new Category(cid);

            Product product = new Product(product_name, price, product_describe, quantity, product_img);
            product.setCate(cate);

            dao.insertProduct(product);

            // Chuyển hướng người dùng đến trang danh sách sản phẩm
            response.sendRedirect(request.getContextPath() + "admin/product.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
