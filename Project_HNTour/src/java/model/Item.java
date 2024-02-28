
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

    public Item() {
    }

    public Item(Tour tour, int quantity, double price) {
        this.tour = tour;
        this.quantity = quantity;
        this.price = price;
    }

    public Tour getTour() {
        return tour;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

   
}

