
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
    private Supplier supplier;
    private Category category;

    public HistoryOrder() {
    }

    public HistoryOrder(Tour tour, OrderDetail orderdetail, Order order, Supplier supplier, Category category) {
        this.tour = tour;
        this.orderdetail = orderdetail;
        this.order = order;
        this.supplier = supplier;
        this.category = category;
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

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "HistoryOrder{" + "tour=" + tour + ", orderdetail=" + orderdetail + ", order=" + order + ", supplier=" + supplier + ", category=" + category + '}';
    }

}
