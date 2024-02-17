/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author hello
 */
public class OrderDetail {
    private int orderId, tourId;
    private String date;
    private int quantity;
    private double price;
    private int versionId;

    public OrderDetail() {
    }

    public OrderDetail(int orderId, int tourId, String date, int quantity, double price, int versionId) {
        this.orderId = orderId;
        this.tourId = tourId;
        this.date = date;
        this.quantity = quantity;
        this.price = price;
        this.versionId = versionId;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getTourId() {
        return tourId;
    }

    public String getDate() {
        return date;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    public int getVersionId() {
        return versionId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setVersionId(int versionId) {
        this.versionId = versionId;
    }

    
    
}
