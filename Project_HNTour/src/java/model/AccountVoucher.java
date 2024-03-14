/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.function.Supplier;

/**
 *
 * @author Admin
 */
public class AccountVoucher {
    private Account account;
    private Voucher voucher;
    private Supplier supplier;

    public AccountVoucher() {
    }

    public AccountVoucher(Account account, Voucher voucher, Supplier supplier) {
        this.account = account;
        this.voucher = voucher;
        this.supplier = supplier;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Voucher getVoucher() {
        return voucher;
    }

    public void setVoucher(Voucher voucher) {
        this.voucher = voucher;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

   
    
}
