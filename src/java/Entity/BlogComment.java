/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author ROG STRIX
 */
public class BlogComment {
    int user_id;
    String user_name;
    int blog_id;
    String date;
    String comment;

    public BlogComment(int user_id, int blog_id, String date, String comment) {
        this.user_id = user_id;
        this.blog_id = blog_id;
        this.date = date;
        this.comment = comment;
    }

    public BlogComment(String user_name, int blog_id, String date, String comment) {
        this.user_name = user_name;
        this.blog_id = blog_id;
        this.date = date;
        this.comment = comment;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    

    public BlogComment() {
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
    
    
    
}
