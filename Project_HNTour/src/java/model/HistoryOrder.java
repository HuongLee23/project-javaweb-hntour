
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class HistoryOrder {
    private Tour tour;
    private OrderDetail orderdetail;
    private Order order;

    public HistoryOrder() {
    }

    public HistoryOrder(Tour tour, OrderDetail orderdetail, Order order) {
        this.tour = tour;
        this.orderdetail = orderdetail;
        this.order = order;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public OrderDetail getOrderdetail() {
        return orderdetail;
    }

    public void setOrderdetail(OrderDetail orderdetail) {
        this.orderdetail = orderdetail;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    @Override
    public String toString() {
        return "HistoryOrder{" + "tour=" + tour + ", orderdetail=" + orderdetail + ", order=" + order + '}';
    }
    
    
}

