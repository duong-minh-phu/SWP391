package MainController;

import DAO.UserContactDAO;
import Entity.User;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "AddAddressServlet", urlPatterns = {"/AddAddressServlet"})
public class AddAddressServlet extends HttpServlet {

    private UserContactDAO userContactDAO;

    @Override
    public void init() throws ServletException {
        userContactDAO = new UserContactDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            String address1 = request.getParameter("address");
            String address=new String(address1.getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);
            String phone = request.getParameter("phone");
            if (!isValidPhoneNumber(phone)) {
                request.setAttribute("error", "Số điện thoại không hợp lệ. Vui lòng nhập lại.");
                request.setAttribute("phone", phone);
                request.getRequestDispatcher("addmoreaddress.jsp").forward(request, response);
                return;
            }
            if (address.length() < 5) {
                request.setAttribute("error1", "Địa chỉ phải có ít nhất 5 ký tự.");
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.getRequestDispatcher("addmoreaddress.jsp").forward(request, response);
                return;
            }
            try {
                if (userContactDAO.checkDuplicateContact(phone, address)) {
                    request.setAttribute("error", "Số điện thoại và địa chỉ đã tồn tại.");
                    request.setAttribute("phone", phone);
                    request.setAttribute("address", address);
                    request.getRequestDispatcher("addmoreaddress.jsp").forward(request, response);
                    return;
                }           } catch (Exception ex) {
                Logger.getLogger(AddAddressServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            user.setAddress(address);
            user.setUser_phone(phone);
            try {
                userContactDAO.addUserContact(user);
                response.sendRedirect("Payment");
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.sendRedirect("login.jsp");
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
}
