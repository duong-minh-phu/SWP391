/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.billDAO;
import Entity.Cart;
import Entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.nio.charset.StandardCharsets;
/**
 *
 * @author ngodi
 */
@WebServlet(name = "PaymentBill", urlPatterns = {"/PaymentBill"})
public class PaymentBill extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
           
            String payment_method = request.getParameter("payment_method");
            Cart cart = (Cart) session.getAttribute("cart");
            float total_payment = cart.getTotalMoney();
            String address1 = request.getParameter("address");
            String address=new String(address1.getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);
            String phone = request.getParameter("phone");
            String payment = null;
            if (payment_method.equals("cod")) {
                payment = "COD";
            }
            if (!isValidPhoneNumber(phone)) {
                request.setAttribute("error", "Số điện thoại không hợp lệ. Vui lòng nhập lại.");
                request.setAttribute("phoneValue", phone);
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }
            if (address.length() < 5) {
                request.setAttribute("error1", "Địa chỉ phải có ít nhất 5 ký tự.");
                request.setAttribute("total_payment", total_payment);
                request.setAttribute("addressValue", address); // Chuyển tiếp giá trị address
                request.setAttribute("phoneValue", phone);
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }
            User u = (User) session.getAttribute("user");            
            LocalDate curDate = java.time.LocalDate.now(); 
            u.setCart(cart);
            String date = curDate.toString();
            billDAO dao = new billDAO();             
            dao.addOrder(u, total_payment, payment, address,date, phone);
            dao.updatebilldely(dao.getbillid());
            session.setAttribute("deletecart", date);
            session.removeAttribute("size");
            session.removeAttribute("cart");            
            if (payment_method.equals("cod")) {
                request.setAttribute("total_payment", total_payment);
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.getRequestDispatcher("success.jsp").forward(request, response);
                session.removeAttribute("cart");
            }
        } catch(Exception e){
            response.sendRedirect("404.jsp");
        }
        
    }
    private boolean isValidPhoneNumber(String phoneNumber) {
    if (phoneNumber.length() != 10) {
        return false;
    }
    if (!phoneNumber.startsWith("0")) {
        return false;
    }
    try {
        Long.parseLong(phoneNumber);
    } catch (NumberFormatException e) {
        return false;
    }
    return true;   
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PaymentBill.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PaymentBill.class.getName()).log(Level.SEVERE, null, ex);
        }
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
