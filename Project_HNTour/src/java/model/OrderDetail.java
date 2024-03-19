
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author hello
 */
public class OrderDetail {

    private int orderId, tourId;
    private int quantity;
    private double price;
    private int versionId;
    private int voucherId;

    public OrderDetail() {
    }

    public OrderDetail(int orderId, int tourId, int quantity, double price, int versionId, int voucherId) {
        this.orderId = orderId;
        this.tourId = tourId;
        this.quantity = quantity;
        this.price = price;
        this.versionId = versionId;
        this.voucherId = voucherId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getVersionId() {
        return versionId;
    }

    public void setVersionId(int versionId) {
        this.versionId = versionId;
    }

    public int getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(int voucherId) {
        this.voucherId = voucherId;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderId=" + orderId + ", tourId=" + tourId + ", quantity=" + quantity + ", price=" + price + ", versionId=" + versionId + ", voucherId=" + voucherId + '}';
    }

}
