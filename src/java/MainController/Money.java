/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.billDAO;
import Entity.Bill;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
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
@WebServlet(name = "Money", urlPatterns = {"/Money"})
public class Money extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            billDAO dao1=new billDAO();
            Calendar calendar = Calendar.getInstance();
            int month = calendar.get(Calendar.MONTH) + 1; 
            int a=dao1.getbillid();
            System.out.println(a);
            request.setAttribute("monney1", dao1.moneymonth(1));
            request.setAttribute("monney2", dao1.moneymonth(2));
            request.setAttribute("monney3", dao1.moneymonth(3));
            request.setAttribute("monney4", dao1.moneymonth(4));
            request.setAttribute("monney5", dao1.moneymonth(5));
            request.setAttribute("monney6", dao1.moneymonth(6));
            request.setAttribute("monney7", dao1.moneymonth(7));
            request.setAttribute("monney8", dao1.moneymonth(8));
            request.setAttribute("monney9", dao1.moneymonth(9));
            request.setAttribute("monney10", dao1.moneymonth(10));
            request.setAttribute("monney11", dao1.moneymonth(11));
            request.setAttribute("monney12", dao1.moneymonth(12));
            request.getRequestDispatcher("/admin/money.jsp").forward(request, response);
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
