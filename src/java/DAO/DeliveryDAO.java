/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import Entity.Blog;
import Entity.Delivery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG STRIX
 */
public class DeliveryDAO {
     Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    
    
    public List<Delivery> getDelivery(int bill_id) {
        List<Delivery> list = new ArrayList<>();

        String sql = "select*from billstatus d where  d.bill_id=?";
             try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bill_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Delivery(rs.getInt(1), rs.getString(2), rs.getDate(3)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Delivery> getDeliverycancel(int bill_id) {
        List<Delivery> list = new ArrayList<>();

        String sql = "select*from cancelbill d where  d.bill_id=?";
             try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bill_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Delivery(rs.getInt(1), rs.getString(2), rs.getDate(3)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
