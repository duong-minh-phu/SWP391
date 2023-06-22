/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.billDAO;
import DAO.userDAO;
import Entity.Email;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.codegen.Emitter;

/**
 *
 * @author ROG STRIX
 */
@WebServlet(name = "Cancelbill", urlPatterns = {"/Cancelbill"})
public class Cancelbill extends HttpServlet {

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
            String billid=request.getParameter("bill_id");
            String status = request.getParameter("permission1");
            int id = Integer.parseInt(billid);
            billDAO dao=new billDAO();
            dao.cancelbill(id, status);
            dao.updatebillcancel(id, status);
            int a=dao.getuseridbybill(id);
            System.out.println(a);
            userDAO u=new userDAO();
            User user=u.checkmailbyid(a);
            Email e=new Email();            
            if(e.sendEmail(user.getUser_email(),"Thông báo hủy đơn từ BMOS", "Xin lỗi đã hủy đơn hàng của bạn chúng tôi thành thật xin lỗi nếu có vấn dề thì hãy liên hệ lại chúng tôi!!"))
            response.sendRedirect("MainController?action=billmana");
            
        }catch(Exception ex){
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
