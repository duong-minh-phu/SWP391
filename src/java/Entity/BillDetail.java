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
