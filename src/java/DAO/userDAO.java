
package DAO;

import Context.DBContext;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class userDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public User checkUser(String user_email, String user_pass) {
        try {
            String query = "select * from users where user_email = ? and user_pass = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user_email);
            ps.setString(2, user_pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6));
                return user;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void updateUser(int user_id, String user_name, String user_pass,String user_phone) {
      String sql = "update users set user_name =? , user_pass = ?,user_phone=? where user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user_name);
            ps.setString(2, user_pass);
            ps.setString(3, user_phone);
            ps.setInt(4, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
        public void updateUserpass(int user_id, String user_pass) {
      String sql = "update users set  user_pass = ? where user_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);            
            ps.setString(1, user_pass);            
            ps.setInt(2, user_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public User checkAcc(String user_email){
            try {
                String query = "select * from users where user_email = ?";
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, user_email);
                rs = ps.executeQuery();
                while(rs.next()){
                   User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6));
                   return a;
                }
            } catch (Exception e) {
            }
        return null;
    }
    
    public User checkPass(String pass,int user_id){
            try {
                String query = "select * from users where user_pass = ? and user_id=?";
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, pass);
                ps.setInt(2, user_id);
                rs = ps.executeQuery();
                while(rs.next()){
                   User a = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6));
                   return a;
                }
            } catch (Exception e) {
            }
        return null;
    }
    
    public void signup(String user_email, String user_pass){
            try {
                String query = "insert into users values(?,?,?,?,?)";
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, "");
                ps.setString(2, user_email); 
                ps.setString(3, user_pass);
                ps.setString(4, "CUS");
                ps.setString(5, "");
                ps.executeUpdate();
            } catch (Exception e) {
            };
    }
    
    public List<User> getUser() {
        List<User> list = new ArrayList<>();
        String sql = "select * from users";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void setAdmin(int user_id, String isAdmin){
        String sql = "update users set role= ? where user_id = ?";
        try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(sql);
        ps.setInt(2, user_id);
        ps.setString(1, isAdmin.toUpperCase());
        ps.executeUpdate();
        } catch (Exception e) {
        }
        
    }
    public void deleteuser(int user_id){
        String sql = "delete from users where user_id=?";
        try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(sql);
        ps.setInt(1, user_id);        
        ps.executeUpdate();
        } catch (Exception e) {
        }
        
    }

}
