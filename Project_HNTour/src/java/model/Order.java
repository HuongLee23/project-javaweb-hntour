

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

    private int id,
            accountId,
            idInforAcc;
    private String date;
    private double totalPrice;

    public Order() {
    }

    public Order(int id, int accountId, int idInforAcc, String date, double totalPrice) {
        this.id = id;
        this.accountId = accountId;
        this.idInforAcc = idInforAcc;
        this.date = date;
        this.totalPrice = totalPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getIdInforAcc() {
        return idInforAcc;
    }

    public void setIdInforAcc(int idInforAcc) {
        this.idInforAcc = idInforAcc;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    

}
