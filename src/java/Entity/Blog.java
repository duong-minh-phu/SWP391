/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author ROG STRIX
 */
public class Blog {
    int blog_id;
    User user;
    String img;
    String blog_name;
    String blog_describe;

    public Blog() {
    }

    public Blog(int blog_id, User user, String img, String blog_name, String blog_describe) {
        this.blog_id = blog_id;
        this.user = user;
        this.img = img;
        this.blog_name = blog_name;
        this.blog_describe = blog_describe;
    }

    public Blog(int blog_id, String img, String blog_name, String blog_describe) {
        this.blog_id = blog_id;
        this.img = img;
        this.blog_name = blog_name;
        this.blog_describe = blog_describe;
    }

    public int getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(int blog_id) {
        this.blog_id = blog_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getBlog_name() {
        return blog_name;
    }

    public void setBlog_name(String blog_name) {
        this.blog_name = blog_name;
    }

    public String getBlog_describe() {
        return blog_describe;
    }

    public void setBlog_describe(String blog_describe) {
        this.blog_describe = blog_describe;
    }
    
    
    
}
