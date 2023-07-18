/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.UserContactDAO;
import Entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import javax.servlet.http.HttpSession;

public class DeleteAddressServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String address1 = request.getParameter("address");
            String addressToDelete = new String(address1.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
            String phoneToDelete = request.getParameter("phone");
            UserContactDAO userContactDAO = new UserContactDAO();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            int userId = user.getUser_id();
            userContactDAO.deleteUserContact(userId, addressToDelete, phoneToDelete);
            response.sendRedirect("Payment");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
