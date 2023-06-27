/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.BlogDAO;
import DAO.productDAO;
import Entity.Blog;
import Entity.Category;
import Entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ROG STRIX
 */
@MultipartConfig()
public class MainController extends HttpServlet {

   
    private static final String ERROR = "404.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("action");
        try {
            if (action.equals("Login")) {
                url = "checkLogin";
            }
            if (action.equals("logout")) {
                url = "logout";
            }
            if (action.equals("blogcomment")) {
                url = "Blogcomment";
            }
            if (action.equals("signup")) {
                url = "checkSignup";
            }
            if (action.equals("product")) {
                url = "Shop";
            }
            if (action.equals("productdetail")) {
                url = "Productdetail";
            }
            if (action.equals("blog")) {
                url = "Blog";
            }
            if (action.equals("updatebill")) {
                url = "Updatebill";
            }
            if (action.equals("money")) {
                url = "Money";
            }
            if (action.equals("listByCategory")) {
                url = "ListByCategory";
            }
            if (action.equals("sortlow")) {
                url = "Sortlow";
            }
                    if (action.equals("showdetail")) {
                url = "Showdetail";
            }
            if (action.equals("sorthigh")) {
                url = "Sorthigh";
            }
            if (action.equals("sorta")) {
                url = "Sorta";
            }
            if (action.equals("search")) {
                url = "Search";
            }
            if (action.equals("updateinfo")) {
                url = "Updateinfo";
            }
            if (action.equals("billmana1")) {
                url = "Billmana1";
            }
            if (action.equals("detailcancel")) {
                url = "Detailcancel";
            }        
            if (action.equals("blogdetails")) {
                url = "Blogdetails";
            }
            if (action.equals("updatepassword")) {
                url = "Updatepassword";
            }
            if (action.equals("dashboard")) {
                url = "Manager";
            }
            if (action.equals("cancelbill")) {
                url = "Cancelbill";
            }
            if (action.equals("payment")) {
                url = "PaymentBill";
            }
            if (action.equals("customermanager")) {
                url = "Customermanager";
            }
            if (action.equals("customermanager1")) {
                url = "Customermanager1";
            }
            if (action.equals("productmanager")) {
                url = "Productmanager";
            }
            if (action.equals("update")) {
                url = "Update";
            }
            if (action.equals("deleteuser")) {
                url = "Deleteuser";
            }
            if (action.equals("productdelete")){
                url = "ProductDelete";
            }
            if (action.equals("addToCart")) {
                url = "AddToCart";
            }
            if (action.equals("deleteFromCart")) {
                url = "DeleteFromCart";
            }
            if (action.equals("delivery")) {
                url = "Delivery";
            }
            if (action.equals("billmana")) {
                url = "Billmana";
            }
            if (action.equals("updateItemsInCart")) {
                url = "UpdateItemsInCart";
            }
            if (action.equals("myaccount")) {
                url = "MyAccounts";               
            }    
            if (action.equals("showdetailcus")) {
                url = "ShowdetailCus";
            }
            if (action.equals("insert")) {
                productDAO c = new productDAO();
                List<Product> product = c.getProduct();
                request.setAttribute("ProductData", product);
                List<Category> category = c.getCategory();
                request.setAttribute("CategoryData", category);
                url = "admin/productInsert.jsp";
            }
            if (action.equals("bloginsert")) {
                url = "Bloginsert";
            }
            if (action.equals("insertproduct")) {
                url = "InsertProduct";
            }
            if (action.equals("deleteproduct")){
                url = "DeleteProduct";
            }
            if (action.equals("recoverproduct")){
                url = "RecoverProduct";
            }
            if (action.equals("recoveruser")){
                url = "Recoveruser";
            }
            if (action.equals("blogmanagement")){
                url = "Blogmanagement";
            }     
            if (action.equals("bill")){
                url = "Bill";
            }
            if (action.equals("insertblog")) {
                BlogDAO b = new BlogDAO();
                List<Blog> blog = b.getBlog();
                request.setAttribute("BlogDatamana", blog);
                url = "admin/blogInsert.jsp";
            }
            if (action.equals("insertblogmana")){
                url = "InsertBlog";
            }
            
            if (action.equals("deleteblog")) {
                url = "DeleteBlog";
            }
            if (action.equals("updateblog")){
                
                url = "UpdateBlog";
            }
            if (action.equals("updateBlog")){
                String blog_id = request.getParameter("blog_id");
                BlogDAO b = new BlogDAO();
                Blog blog = b.getBlogByID2(blog_id);
                request.setAttribute("BlogIDDATA", blog);
                url = "admin/updateBlog.jsp";
            }
            
            if (action.equals("updateProduct")){
                String productId = request.getParameter("product_id");
                productDAO c = new productDAO();
                Product product = c.getProductByID2(productId);
                request.setAttribute("ProductIDDATA", product);
                List<Category> category = c.getCategory();
                request.setAttribute("CategoryData", category);
                url = "admin/updateProduct.jsp";
            }
            if (action.equals("addReview")) {
                url = "InsertReview";
            }
            if (action.equals("insertcategory")) {
                url = "InsertCategory";
            }
            if (action.equals("comment")) {
                url = "CommentManager";
            }
            if (action.equals("deletecomment")) {
                url = "DeleteComment";
            }
            if (action.equals("feedbackmanager")) {
                url = "FeedbackManagement";
            }
            if (action.equals("checkRating")) {
                url = "checkRating";
            }
            if (action.equals("updateproduct")){
                url = "UpdateProduct";
            }
            
            if (action.equals("orderconfirm")) {
                url = "OrderConfirm";
            }
            if (action.equals("orderprepared")) {
                url = "OrderPrepared";
            }
            if (action.equals("ordershipping")) {
                url = "OrderShipping";
            }
            if (action.equals("ordershipdone")) {
                url = "OrderShipDone";
            }

        } catch (Exception ex) {
            log("Error at: MainController" + ex.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
