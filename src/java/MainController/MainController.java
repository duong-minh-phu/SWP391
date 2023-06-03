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

/**
 *
 * @author ROG STRIX
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "404.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("action");
        try  {
            if (action.equals("Login")){
                url = "checkLogin";
            }
             if (action.equals("logout")){
                url = "logout";
            }
             if (action.equals("signup")){
                url = "checkSignup";
            }
             if (action.equals("product")){
                url = "Shop";
            }
             if (action.equals("productdetail")){
                url = "Productdetail";
            }
             if (action.equals("listByCategory")){
                url = "ListByCategory";
            }
             if (action.equals("sortlow")){
                url = "Sortlow";
            }
             if (action.equals("sorthigh")){
                url = "Sorthigh";
            }
             if (action.equals("sorta")){
                url = "Sorta";
            }
             if (action.equals("search")){
                url = "Search";
            }
             if (action.equals("updateinfo")){
                url = "Updateinfo";
            }
             if (action.equals("updatepassword")){
                url = "Updatepassword";
            }
             if (action.equals("dashboard")){
                url = "Manager";
            }
             if (action.equals("customermanager")){
                url = "Customermanager";
            }
             if (action.equals("addToCart")){
                url = "AddToCart";
            } 
             if (action.equals("deleteFromCart")){
                url = "DeleteFromCart";
            } 
             if (action.equals("updateItemsInCart")){
                url = "UpdateItemsInCart";
            }
             if (action.equals("insert")){
                url = "productInsert.jsp";
            } 
             if (action.equals("addProduct")){
                url = "addProduct";
            }
             if (action.equals("deleteproduct")){
                url = "deleteProduct";
            }
             
        }catch(Exception ex){
            log("Error at: MainController" + ex.toString());
        }finally {
            request.getRequestDispatcher(url).forward(request, response);
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
