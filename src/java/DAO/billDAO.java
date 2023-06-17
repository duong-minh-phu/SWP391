/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import Entity.Bill;
import Entity.Cart;
import Entity.Category;
import Entity.Product;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ngodi
 */
public class billDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void addOrder(User u, double cart, String payment, String address,String date, int phone) throws Exception {
        try {
            String sql = "INSERT INTO bill (user_id, total_money, payment, address, date, phone) VALUES (?, ?, ?, ?, ?, ?)";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, u.getUser_id());
            ps.setDouble(2, cart);
            ps.setString(3, payment);
            ps.setString(4, address);
            ps.setString(5,date);
            ps.setInt(6, phone);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } 
    }
    
    
}
