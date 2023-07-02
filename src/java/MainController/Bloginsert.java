/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;

import DAO.BlogDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.nio.charset.StandardCharsets;
/**
 *
 * @author ROG STRIX
 */
@MultipartConfig()
@WebServlet(name = "Bloginsert", urlPatterns = {"/Bloginsert"})
public class Bloginsert extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
              String name = request.getParameter("name");
              System.out.println(name);
                String blog_describe1 = request.getParameter("describe");
                
                String blog_describe=new String(blog_describe1.getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);
//        Part img = request.getPart("img");
//            System.out.println(img);
//        String fileimg = img.getSubmittedFileName();
//            System.out.println(fileimg);
//        String imagePath = getServletContext().getRealPath("/") + "images/" + fileimg;
//            System.out.println(imagePath);
//        img.write(imagePath);
        
        
        
        
        Part filePart = request.getPart("img");
            System.out.println(filePart);
        String realPath = request.getServletContext().getRealPath("/images/");
            System.out.println(realPath);
        String fileName = filePart.getSubmittedFileName(); // Lấy tên tệp ảnh gốc
            System.out.println(fileName);
            
        if(fileName!=null){    
	String destinationPath = realPath + fileName;
            System.out.println(destinationPath);
            
                filePart.write(destinationPath);

            String imagePath = "images/" + fileName;
            System.out.println(imagePath);
            
            HttpSession session = request.getSession();
            Entity.User user = (Entity.User) session.getAttribute("user");
            
            BlogDAO dao=new BlogDAO();
            dao.Bloginsert(user.getUser_id(), imagePath, name, blog_describe);
        request.getRequestDispatcher("MainController?action=insertblog").forward(request, response);}
        if(fileName==null){
            response.sendRedirect("404.jsp");
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
