/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class Rating {
    int user_id;
    String user_name;
    String product_id;
    int rate;
    String comment;
    Date date;
    int bill_id;

    public Rating() {
    }

    public Rating(int user_id, String product_id, int rate, String comment, Date date) {
        this.user_id = user_id;
        this.product_id = product_id;
        this.rate = rate;
        this.comment = comment;
        this.date = date;
    }

    public Rating(String user_name, String product_id, int rate, String comment, Date date) {
        this.user_name = user_name;
        this.product_id = product_id;
        this.rate = rate;
        this.comment = comment;
        this.date = date;
    }
    
    

    public Rating(int user_id, String user_name, String product_id, int rate, String comment, Date date) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.product_id = product_id;
        this.rate = rate;
        this.comment = comment;
        this.date = date;
    }

    public Rating(int user_id, String user_name, String product_id, int rate, String comment, Date date, int bill_id) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.product_id = product_id;
        this.rate = rate;
        this.comment = comment;
        this.date = date;
        this.bill_id = bill_id;
    }
    

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }
    

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    
    

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
