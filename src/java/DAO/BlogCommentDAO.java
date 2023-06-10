/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

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
}
