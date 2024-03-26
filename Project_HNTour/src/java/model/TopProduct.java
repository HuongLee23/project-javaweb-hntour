/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class TopProduct {

    private Account account;
    private Tour tour;
    private Order order;
    private OrderDetail orderdetail;
    private int totalquantity;

    public TopProduct() {
    }

    public TopProduct(Account account, Tour tour, Order order, OrderDetail orderdetail, int totalquantity) {
        this.account = account;
        this.tour = tour;
        this.order = order;
        this.orderdetail = orderdetail;
        this.totalquantity = totalquantity;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public OrderDetail getOrderdetail() {
        return orderdetail;
    }

    public void setOrderdetail(OrderDetail orderdetail) {
        this.orderdetail = orderdetail;
    }

    public int getTotalquantity() {
        return totalquantity;
    }

    public void setTotalquantity(int totalquantity) {
        this.totalquantity = totalquantity;
    }
}
