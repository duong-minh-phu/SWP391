package DAO;

import Context.DBContext;
import Entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserContactDAO {

    Connection conn = null;
    PreparedStatement ps = null;

    public void addUserContact(User userContact) throws Exception {
        try {
            String sql = "INSERT INTO user_contact (user_id, address, phone_number) VALUES (?, ?, ?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userContact.getUser_id());
            ps.setString(2, userContact.getAddress());
            ps.setString(3, userContact.getUser_phone());
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }

    public List<User> getAddressPhoneList(int user_id) throws Exception {
        List<User> addressPhoneList = new ArrayList<>();

        try {
            String sql = "SELECT address, phone_number FROM user_contact WHERE user_id = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String address = rs.getString("address");
                String phone = rs.getString("phone_number");

                User user = new User();
                user.setAddress(address);
                user.setUser_phone(phone);
                addressPhoneList.add(user);
            }

            rs.close();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return addressPhoneList;
    }

    public boolean checkDuplicateContact(String phone, String address) throws SQLException, Exception {
        try {
            String sql = "SELECT COUNT(*) FROM user_contact WHERE phone_number = ? AND address = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, address);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }

    public void deleteUserContact(int user_id, String address, String phone) throws Exception {
        try {
            String sql = "DELETE FROM user_contact WHERE user_id = ? AND address = ? AND phone_number = ?";           
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.executeUpdate();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
