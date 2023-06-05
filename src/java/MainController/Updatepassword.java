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
@WebServlet(name = "Updatepassword", urlPatterns = {"/Updatepassword"})
public class Updatepassword extends HttpServlet {

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
        try  {
            HttpSession session = request.getSession();
            Entity.User user = (Entity.User) session.getAttribute("user");
            String pass1=request.getParameter("oldpassword");
            String pass2=request.getParameter("newpass");
            String pass3=request.getParameter("pass");
            int user_id = user.getUser_id();
            
            if(!pass2.equals(pass3)){
                request.setAttribute("error_pass1", "Mật khẩu không trùng khớp. Hãy nhập lại...");
                request.getRequestDispatcher("my-account.jsp").forward(request, response);
            }else{
                userDAO dao = new userDAO();
                Entity.User a = dao.checkPass(pass1,user_id);
                if(a!=null&&pass1.equals(pass2)){
                    request.setAttribute("error_pass1", "Mật khẩu cũ giống mật khẩu mới(không cập nhật)!!!");
                    request.getRequestDispatcher("my-account.jsp").forward(request, response);
                }
                if(a==null){
                    request.setAttribute("error_pass1", "Mật Khẩu cũ không chính xác");
                    request.getRequestDispatcher("my-account.jsp").forward(request, response);
                }else{
                    dao.updateUserpass(user_id, pass3);                    
                    session.removeAttribute("user");
                    request.setAttribute("error", "Cập nhật Mật Khẩu mới thành công.Xin đăng nhập lại!!!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
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
