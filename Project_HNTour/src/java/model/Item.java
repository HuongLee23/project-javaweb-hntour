
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hello
 */
public class Item {
    private Tour tour;
    private int quantity;
    private double price;
    private int idVoucher;
    private int discount;
    private double priceSale;
    
    public Item() {
    }

    public Item(Tour tour, int quantity, double price) {
        this.tour = tour;
        this.quantity = quantity;
        this.price = price;
    }

    public Item(Tour tour, int quantity, double price, int idVoucher, int discount, double priceSale) {
        this.tour = tour;
        this.quantity = quantity;
        this.price = price;
        this.idVoucher = idVoucher;
        this.discount = discount;
        this.priceSale = priceSale;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
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

    public int getIdVoucher() {
        return idVoucher;
    }

    public void setIdVoucher(int idVoucher) {
        this.idVoucher = idVoucher;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public double getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(double priceSale) {
        this.priceSale = priceSale;
    }

   
   
}

