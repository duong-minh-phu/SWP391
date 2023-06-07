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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {

    private Map<Product, Integer> items;

    public Map<Product, Integer> getItems() {
        return items;
    }

    public void setItems(Map<Product, Integer> items) {
        this.items = items;
    }

    public Cart(Map<Product, Integer> items) {
        this.items = items;
    }

    public Cart() {
        items = new HashMap<>();
    }
    
    public void addItem(Product key, int value){
       Integer currentValue = items.get(key);
       if (currentValue == null){
           items.put(key, value);
       } else {
           items.put(key, currentValue + value);
       }
    }
    
    public void deleteFromCart(Product key){
        items.remove(key);
    }
    
        public int size(){
        return items.size();
    }
    
    public int getTotalMoney(){
        int result = 0;
        for (Product product : items.keySet()){
            result += product.getProduct_price()*items.get(product);
        }
        return result;
    }

}
