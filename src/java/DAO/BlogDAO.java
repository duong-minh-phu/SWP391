/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Context.DBContext;
import Entity.Blog;
import Entity.Category;
import Entity.Product;
import Entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ROG STRIX
 */
public class BlogDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Blog> getBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "select p.blog_id,c.user_name,p.blog_name,p.blog_describe,p.img,p.date\n"
                + "                        from blog p inner join users c on p.user_id=c.user_id order by p.date desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                list.add(new Blog(rs.getInt(1), rs.getString(2), rs.getString(5), rs.getString(3), rs.getString(4), rs.getDate(6)));
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Blog> getListByPageblog(List<Blog> list,
            int start, int end) {
        ArrayList<Blog> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public Blog getBlogByID(String product_id) {
        List<Product> list = new ArrayList<>();
        String sql = "select p.blog_id,c.user_name,p.blog_name,p.blog_describe,p.img,p.date\n"
                + "                       from blog p inner join users c on p.user_id=c.user_id and blog_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            while (rs.next()) {

                return (new Blog(rs.getInt(1), rs.getString(2), rs.getString(5), rs.getString(3), rs.getString(4), rs.getDate(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean insertBlog(Blog blog) {
        String sql = "insert into blog (blog_id, blog_name, user, blog_describe, img, date) values(?, ?, ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, blog.getBlog_id());
            ps.setString(2, blog.getBlog_name());
            ps.setString(3, blog.getUser());
            ps.setString(4, blog.getBlog_describe());
            ps.setString(5, blog.getImg());
            ps.setDate(6, blog.getDate());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public void deleteblog(int blog_id) {
        String sql = "delete from blog where blog_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, blog_id);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void updateBlog(Blog blog) {
        String sq4 = "update product set blog_name=?, blog_describe=?, img=? where blog_id=?";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sq4);
            ps.setString(1, blog.getBlog_name());
            ps.setString(2, blog.getBlog_describe());
            ps.setString(3, blog.getImg());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
