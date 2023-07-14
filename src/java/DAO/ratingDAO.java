/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import Entity.Category;
import Entity.Product;
import Entity.Rating;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class ratingDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Rating> getRating() {
        List<Rating> list = new ArrayList<>();
        String sql = "SELECT u.user_name, p.product_name ,r.rate, r.comment, r.date\n"
                + "FROM Rating r\n"
                + "INNER JOIN product p ON r.product_id = p.product_id\n"
                + "INNER JOIN users u ON r.user_id = u.user_id";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String userName = rs.getString("user_name");
                String productName = rs.getString("product_name");
                int rate = rs.getInt("rate");
                String comment = rs.getString("comment");
                Date date = rs.getDate("date");

                Rating rating = new Rating(userName, productName, rate, comment, date);
                list.add(rating);

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Rating> getRatingsByProductID(String product_id) {
        List<Rating> list = new ArrayList<>();
        String sql = "SELECT u.user_name, p.product_name ,r.rate, r.comment, r.date\n"
                + "FROM Rating r\n"
                + "INNER JOIN product p ON r.product_id = p.product_id\n"
                + "INNER JOIN users u ON r.user_id = u.user_id\n"
                + "WHERE r.product_id = ?\n"
                + "ORDER BY r.date DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                String userName = rs.getString("user_name");
                String productName = rs.getString("product_name");
                int rate = rs.getInt("rate");
                String comment = rs.getString("comment");
                Timestamp timestamp = rs.getTimestamp("date");
                Calendar calendar = Calendar.getInstance();
                calendar.setTimeInMillis(timestamp.getTime());
                calendar.add(Calendar.DATE, 2);
                Date date = new Date(calendar.getTimeInMillis());

                Rating rating = new Rating(userName, productName, rate, comment, date);
                list.add(rating);
                System.out.println(list);

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public double calculateAverageRating(String product_id) {
        String sql = "SELECT rate FROM dbo.rating WHERE product_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();

            int count = 0;
            double totalRate = 0;

            while (rs.next()) {
                double rate = rs.getDouble("rate");
                totalRate += rate;
                count++;
            }

            if (count > 0) {
                return totalRate / count;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close connections and resources
        }

        return 0; // Trả về 0 nếu không tìm thấy đánh giá hoặc xảy ra lỗi
    }

    public int countRatingsByProductId(String product_id) {
        String sql = "SELECT COUNT(*) AS count FROM dbo.rating WHERE product_id = ?";
        int count = 0;

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            Logger.getLogger(ratingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    public boolean insertRating(Rating rating) {
        String sql = "insert into dbo.rating(user_id,product_id,rate,comment,date,bill_id) values(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, rating.getUser_id());
            ps.setString(2, rating.getProduct_id());
            ps.setInt(3, rating.getRate());
            ps.setString(4, rating.getComment());
            ps.setDate(5, new java.sql.Date(rating.getDate().getTime()));
            ps.setInt(6, rating.getBill_id());

            int rowsAffected = ps.executeUpdate(); // thực hiện câu lệnh SQL

            return rowsAffected > 0; // kiểm tra xem có dòng nào được thêm vào không
        } catch (Exception e) {
            return false;
        } finally {
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                conn.close();
            } catch (Exception e) {
            }
        }
    }

    public boolean checkForRating(int user_id, String product_id, int bill_id) {
        String sql = "select count(*) as count from dbo.Rating where user_id=? and product_id=? and bill_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, user_id);
            ps.setString(2, product_id);
            ps.setInt(3, bill_id);

            rs = ps.executeQuery(); // thực hiện câu lệnh SQL

            if (rs.next()) {
                int count = rs.getInt("count");
                return (count > 0);
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        } finally {
            try {
                rs.close();
            } catch (Exception e) {
            }
            try {
                ps.close();
            } catch (Exception e) {
            }
            try {
                conn.close();
            } catch (Exception e) {
            }
        }
    }
}
