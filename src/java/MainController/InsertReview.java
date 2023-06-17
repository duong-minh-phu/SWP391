package MainController;

import DAO.ratingDAO;
import Entity.Rating;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
public class InsertReview extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String productId = request.getParameter("product_review_id");
        if (productId == null || productId.isEmpty()) {
            // handle the error condition here
            throw new ServletException("Invalid product ID.");
        }
        int userId = Integer.parseInt(request.getParameter("user_id"));
        int rate = Integer.parseInt(request.getParameter("rating"));
        String reviewText = request.getParameter("review");
        String dateString = request.getParameter("review_date");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date reviewDate = null;
        try {
            reviewDate = dateFormat.parse(dateString);
        } catch (ParseException ex) {
            // handle the error condition here
            throw new ServletException("Invalid date format.");
        }
        java.sql.Date sqlReviewDate = new java.sql.Date(reviewDate.getTime());

        ratingDAO r = new ratingDAO();
        Rating rating = new Rating(userId, productId, rate, reviewText, sqlReviewDate);
        r.insertRating(rating);

       response.sendRedirect("MainController?action=productdetail&product_id=" + productId + "&success=true");

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
