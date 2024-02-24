/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Voucher {
    private int id;
    private String code;
    private int discount;
    private boolean status;
    private int supplierId;

    public Voucher() {
    }

    public Voucher(int id, String code, int discount, boolean status, int supplierId) {
        this.id = id;
        this.code = code;
        this.discount = discount;
        this.status = status;
        this.supplierId = supplierId;
    }

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public int getDiscount() {
        return discount;
    }

    public boolean isStatus() {
        return status;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }
    
}

