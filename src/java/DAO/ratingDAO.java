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
import java.util.ArrayList;
import java.util.List;

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
        String sql = "SELECT r.user_id, p.product_name ,r.rate, r.comment, r.date\n"
                + "FROM Rating r\n"
                + "INNER JOIN product p ON r.product_id = p.product_id\n"
                + "WHERE r.product_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("user_id");
                String productName = rs.getString("product_name");
                int rate = rs.getInt("rate");
                String comment = rs.getString("comment");
                Date date = rs.getDate("date");

                Rating rating = new Rating(userId, productName, rate, comment, date);
                list.add(rating);

            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean insertRating(Rating rating) {
        String sql = "insert into dbo.rating(user_id,product_id,rate,comment,date) values(?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, rating.getUser_id());
            ps.setString(2, rating.getProduct_id());
            ps.setInt(3, rating.getRate());
            ps.setString(4, rating.getComment());
            ps.setDate(5, new java.sql.Date(rating.getDate().getTime()));

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

}
