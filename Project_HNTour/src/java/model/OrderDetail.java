
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
    private String nameTour;
    private String imageTour;
    private int priceTour;
    private int accId;
    private Date dateOrder;

    public OrderDetail() {
    }

    public OrderDetail(int orderId, int tourId, int quantity, double price, int versionId, String nameTour, String imageTour, int priceTour, int accId, Date dateOrder) {
        this.orderId = orderId;
        this.tourId = tourId;
        this.quantity = quantity;
        this.price = price;
        this.versionId = versionId;
        this.nameTour = nameTour;
        this.imageTour = imageTour;
        this.priceTour = priceTour;
        this.accId = accId;
        this.dateOrder = dateOrder;
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

    public String getNameTour() {
        return nameTour;
    }

    public void setNameTour(String nameTour) {
        this.nameTour = nameTour;
    }

    public String getImageTour() {
        return imageTour;
    }

    public void setImageTour(String imageTour) {
        this.imageTour = imageTour;
    }

    public int getPriceTour() {
        return priceTour;
    }

    public void setPriceTour(int priceTour) {
        this.priceTour = priceTour;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public Date getDateOrder() {
        return dateOrder;
    }

    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "orderId=" + orderId + ", tourId=" + tourId + ", quantity=" + quantity + ", price=" + price + ", versionId=" + versionId + ", nameTour=" + nameTour + ", imageTour=" + imageTour + ", priceTour=" + priceTour + ", accId=" + accId + ", dateOrder=" + dateOrder + '}';
    }

}

