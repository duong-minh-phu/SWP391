package DAO;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ROG STRIX
 */
public class gmailDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public void signupGmail(String mail){
            try {
                String query = "insert into Gmail values ?";
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);                
                ps.setString(1, mail);                                                 
                ps.executeUpdate();
            } catch (Exception e) {
            };
    }
}
