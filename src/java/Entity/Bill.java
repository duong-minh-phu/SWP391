
package Entity;

import java.sql.Date;

public class Bill {
    int bill_id;
    User user;
    Float total;
    String payment;
    String address;
    Date date;
    String phone;
    int user_id;

    public Bill(Float total, String payment, String address, Date date, int user_id) {
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.user_id = user_id;
    }
    public Bill() {
    }

    public Bill(int bill_id, User user, Float total, String payment, String address, Date date, String phone) {
        this.bill_id = bill_id;
        this.user = user;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.phone = phone;
    }
    
    public Bill(int bill_id,Float total,Date date) {
        this.bill_id = bill_id;
        this.total = total;
        this.date = date;
    }
    
    public Bill(int bill_id, Float total, String payment, String address, Date date, String phone) {
        this.bill_id = bill_id;
        this.total = total;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.phone = phone;
    }

    public Bill(Date date, String payment, String address, float totalMoney) {      
        this.total = totalMoney;
        this.payment = payment;
        this.address = address;
        this.date = date;
    }

    public Bill(Date date, String payment, String address, float totalMoney, int user_id) {
        this.date = date;
        this.payment = payment;
        this.address = address;
        this.user_id= user_id;
    }

    public Bill(int bill_id, Date date, String payment, String address, float totalMoney) {
        this.total = totalMoney;
        this.payment = payment;
        this.address = address;
        this.date = date;
        this.bill_id = bill_id;
    }

    public int getBill_id() {
        return bill_id;
    }

    public void setBill_id(int bill_id) {
        this.bill_id = bill_id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
 
}
