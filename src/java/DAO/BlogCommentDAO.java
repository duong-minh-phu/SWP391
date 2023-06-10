/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import Entity.BlogComment;
import Entity.Category;
import Entity.Product;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG STRIX
 */
public class BlogCommentDAO {
      Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    
    
    public void BlogComment(int user_id, int  blog_id,String comment){
        LocalDate curDate = java.time.LocalDate.now();
        String date = curDate.toString();
            try {
                String query = "INSERT INTO dbo.bogcomment (user_id,blog_id,date,comment)\n" +
                                    "VALUES (?, ?, ?,?);";
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                
                ps.setInt(1, user_id); 
                ps.setInt(2, blog_id);
                ps.setString(3, date);
                ps.setString(4, comment);
                ps.executeUpdate();
            } catch (Exception e) {
            };
    }
    
     public List<BlogComment> getComment(String blogid) {
        List<BlogComment> list = new ArrayList<>();
        String sql = "select c.user_name,p.blog_id,p.date,p.comment\n" +
                        "from bogcomment p inner join users c on p.user_id=c.user_id and p.blog_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, blogid);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                list.add(new BlogComment(rs.getString(1), rs.getInt(2), rs.getString(3),rs.getString(4)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
