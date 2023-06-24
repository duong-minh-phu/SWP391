/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.ratingDAO;
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
public class checkRating extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int user_id = Integer.parseInt(request.getParameter("user_id"));
            String product_id = request.getParameter("product_id");
            int bill_id = Integer.parseInt(request.getParameter("bill_id"));
            boolean ra = new ratingDAO().checkForRating(user_id, product_id, bill_id);

            boolean ratingExists = ra;

            if (ratingExists) {
                response.getWriter().write("exists");
            } else {
                response.getWriter().write("not_exists");
            }
        }
    }
}
