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
public class BillDetail {
        int detail_id;
        int bill_id;
        Product product;
        String product_id;
        String product_name;
        String img;
        int quantity;
        Float price;
        int trangthai;
        
    public BillDetail() {
    }

    public BillDetail(int detail_id, int bill_id, Product product, int quantity, Float price, int trangthai) {
        this.detail_id = detail_id;
        this.bill_id = bill_id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.trangthai = trangthai;
    }

    public BillDetail(int aInt, Product p, int aInt0, float aFloat) {
        this.detail_id = detail_id;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public BillDetail(int detail_id, String product_id, String product_name, String img, int quantity, Float price) {
        this.detail_id = detail_id;
        this.product_id = product_id;
        this.product_name = product_name;
        this.img = img;
        this.quantity = quantity;
        this.price = price;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    

    public void setDetail_id(int detail_id) {
        this.detail_id = detail_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public void setTrangthai(int trangthai) {
        this.trangthai = trangthai;
    }

    public int getDetail_id() {
        return detail_id;
    }

    public int getBill_id() {
        return bill_id;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public Float getPrice() {
        return price;
    }

    public int getTrangthai() {
        return trangthai;
    }
}
