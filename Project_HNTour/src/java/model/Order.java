/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hello
 */
public class Order {

    private int id, accountId;
    private String totalPrice;
    private int voucherId;

    public Order() {
    }

    public Order(int id, int accountId, String totalPrice, int voucherId) {
        this.id = id;
        this.accountId = accountId;
        this.totalPrice = totalPrice;
        this.voucherId = voucherId;
    }

    public int getId() {
        return id;
    }

    public int getAccountId() {
        return accountId;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

}
