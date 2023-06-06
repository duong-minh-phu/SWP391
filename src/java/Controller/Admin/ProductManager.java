package Controller.Admin;

import DAO.productDAO;
import DAO.userDAO;
import Entity.Category;
import Entity.Product;
import Entity.User;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Administrator
 */
public class ProductManager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            String action = request.getParameter("action");
            if (user.getIsAdmin().equalsIgnoreCase("ADMIN") || user.getIsAdmin().equalsIgnoreCase("STAFF")) {
                if (action == null) {
                    productDAO p = new productDAO();
                    List<Product> products = p.getProduct();
                    List<Category> category = p.getCategory();
                    request.setAttribute("categoryList", category);
                    request.setAttribute("productList", products);
                    request.getRequestDispatcher("admin/product.jsp").forward(request, response);
                }
                if (action.equalsIgnoreCase("insert")) {
                    productDAO c = new productDAO();
                    List<Category> category = c.getCategory();
                    request.setAttribute("categoryList", category);
                    request.getRequestDispatcher("admin/productInsert.jsp").forward(request, response);
                }
                if (action.equalsIgnoreCase("addProduct")) {
                    String productId = request.getParameter("productId");
                    String productName = request.getParameter("productName");
                    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                    float productPrice = Float.parseFloat(request.getParameter("productPrice"));
                    String productDesc = request.getParameter("productDesc");
                    int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
                    String productImage = "images/" + request.getParameter("productImage");
                    productDAO c = new productDAO();

                    Product product = new Product(productId, productName, productPrice, productDesc, productQuantity, productImage);
                    Category category = new Category(categoryId);
                    product.setCate(category);

                    c.insertProduct(product);

                    request.getRequestDispatcher("productmanager?action=insert").forward(request, response);
                }
                if (action.equalsIgnoreCase("deleteproduct")) {
                    String product_id = request.getParameter("product_id");
                    productDAO dao = new productDAO();
                    dao.deleteProduct(product_id);

                    request.getRequestDispatcher("admin/product.jsp").forward(request, response);
                }
                if (action.equalsIgnoreCase("updateproduct")) {
                    String productId = request.getParameter("product_id");
                    String productName = request.getParameter("product_name");
                    int categoryId = Integer.parseInt(request.getParameter("category_id"));
                    float productPrice = Float.parseFloat(request.getParameter("product_price"));
                    String productDesc = request.getParameter("product_describe");
                    int productQuantity = Integer.parseInt(request.getParameter("product_quantity"));
                    String productImage = "images/" + request.getParameter("img");
                    productDAO c = new productDAO();

                    Product product = new Product(productId, productName, productPrice, productDesc, productQuantity, productImage);
                    Category category = new Category(categoryId);
                    product.setCate(category);

                    c.updateProduct(product);
                    response.sendRedirect("Productmanager");

                } else {
                    response.sendRedirect("404.jsp");
                }
            } else {
                response.sendRedirect("user?action=login");
            }

        } catch (Exception e) {
            response.sendRedirect("404.jsp");
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