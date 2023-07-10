/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MainController;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Entity.Blog;
import DAO.BlogDAO;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import java.nio.charset.StandardCharsets;
/**
 *
 * @author luong
 */
@WebServlet(name = "UpdateBlog", urlPatterns = "/UpdateBlog")
@MultipartConfig()
public class UpdateBlog extends HttpServlet {

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
        // Get the blog data from the request
            try{
                int blog_id = Integer.parseInt(request.getParameter("blog_id"));
                String blog_name = request.getParameter("update_name");
                String blog_describe1 = request.getParameter("update_describe");
                String blog_describe=new String(blog_describe1.getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);
                BlogDAO dao = new BlogDAO();
                System.out.println(blog_describe);
            Part filePart = request.getPart("updatess_img");
            System.out.println(filePart);
            String realPath = request.getServletContext().getRealPath("/images/");
            System.out.println(realPath);
            String fileName = filePart.getSubmittedFileName(); // Lấy tên tệp ảnh gốc
            System.out.println(fileName);

            if (fileName == "") {
                Blog blog = new Blog(blog_id, blog_name, blog_describe);
                dao.updateBlog2(blog);
                // Chuyển hướng người dùng đến trang danh sách sản phẩm
                request.getRequestDispatcher("MainController?action=blogmanagement").forward(request, response);
            } else {
                String destinationPath = realPath + fileName;
                System.out.println(destinationPath);

                filePart.write(destinationPath);

                String imagePath = "images/" + fileName;
                System.out.println(imagePath);

                Blog blog = new Blog(blog_id, imagePath, blog_name, blog_describe);

                dao.updateBlog(blog);

                // Chuyển hướng người dùng đến trang danh sách sản phẩm
                request.getRequestDispatcher("MainController?action=blogmanagement").forward(request, response);
            }
            if (fileName == null) {
                response.sendRedirect("404.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/404.jsp");
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
