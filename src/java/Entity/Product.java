/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.Objects;

/**
 *
 * @author ROG STRIX
 */
public class Product {
    Category cate;
    String product_id;
    String product_name;
    Float product_price;
    String product_describe;
    int quantity;
    String img;
    

    public Product() {
    }

    public Product(Category cate, String product_id, String product_name, Float product_price, String product_describe, int quantity, String img) {
        this.cate = cate;
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_describe = product_describe;
        this.quantity = quantity;
        this.img = img;
    }

    public Product(String product_id, String product_name, Float product_price, String product_describe, int quantity, String img) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_describe = product_describe;
        this.quantity = quantity;
        this.img = img;
    }

    public Product(String product_id, String product_name, String img) {
        this.product_id = product_id;
        this.product_name = product_name;
        this.img = img;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.product_id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Product other = (Product) obj;
        if (!Objects.equals(this.product_id, other.product_id)) {
            return false;
        }
        return true;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public Float getProduct_price() {
        return product_price;
    }

    public void setProduct_price(Float product_price) {
        this.product_price = product_price;
    }

    public String getProduct_describe() {
        return product_describe;
    }

    public void setProduct_describe(String product_describe) {
        this.product_describe = product_describe;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
}
