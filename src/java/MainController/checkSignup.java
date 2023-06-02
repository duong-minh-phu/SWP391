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

/**
 *
 * @author ROG STRIX
 */
@WebServlet(name = "checkSignup", urlPatterns = {"/checkSignup"})
public class checkSignup extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try  {
           String user_email = request.getParameter("user_email");
            String user_pass = request.getParameter("user_pass");
            String re_pass = request.getParameter("re_pass");
            if(user_pass.length()==0||user_email.length()==0 ){
                request.setAttribute("error_pass", "Xin hãy nhập thông tin!!!!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if(user_pass.length()<7){
                request.setAttribute("error_pass1", "Xin hãy nhập mật khẩu ít nhất 8 kí tự!!!!!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if (!user_pass.equals(re_pass)) {
                request.setAttribute("error_pass", "Mật khẩu không trùng khớp. Hãy nhập lại...");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                userDAO dao = new userDAO();
                Entity.User a = dao.checkAcc(user_email);
                if (a == null) {
                    dao.signup(user_email, user_pass);
                    request.setAttribute("done", "Đăng ký thành công");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("emailavailable", "Email đã tồn tại!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        }catch(Exception ex){
            request.getRequestDispatcher("404.jsp").forward(request, response);
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
