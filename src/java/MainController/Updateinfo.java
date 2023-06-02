/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.userDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ROG STRIX
 */
@WebServlet(name = "Updateinfo", urlPatterns = {"/Updateinfo"})
public class Updateinfo extends HttpServlet {

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
        try {
                HttpSession session = request.getSession();
                Entity.User user = (Entity.User) session.getAttribute("user");
                if (user != null) {
                    String user_name = request.getParameter("user_name");
                    String user_pass = request.getParameter("user_pass");
                    String user_phone = request.getParameter("user_phone");
                    int user_id = user.getUser_id();
                    userDAO dao = new userDAO();
                    dao.updateUser(user_id, user_name, user.getUser_pass(),user_phone);
                    Entity.User user1 = new Entity.User(user.getUser_id(), user_name, user.getUser_email(), user.getUser_pass(), user.getIsAdmin(),user_phone);
                    session.setAttribute("user", user1);
                    response.sendRedirect("my-account.jsp");
                } else {
                    response.sendRedirect("login.jsp");
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
