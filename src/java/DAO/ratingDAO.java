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
                + "INNER JOIN users u ON r.user_id = u.user_id\n"
                + "INNER JOIN product p ON r.product_id = p.product_id";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("user_name");
                String productName = rs.getString("product_name");
                int rate = rs.getInt("rate");
                String comment = rs.getString("comment");
                Date date = rs.getDate("date");

                Rating rating = new Rating(username, productName, rate, comment, date);
                list.add(rating);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
