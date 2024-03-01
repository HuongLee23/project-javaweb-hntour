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
public class Supplier {
    private int idAcc;
    private String fullName;
    private Date birthday;
    private String email;
    private String phoneNumber;
    private String frontCMND;
    private String backCMND;
    private String nameCompany;
    private String addressCompany;
    private String emailCompany;
    private String phoneNumberCompany;
    private String businessCode;
    private String businessRegis;
    private String taxCertificate;
    private String taxPayment;

    public Supplier() {
    }

    public Supplier(int idAcc, String fullName, Date birthday, String email, String phoneNumber, String frontCMND, String backCMND, String nameCompany, String addressCompany, String emailCompany, String phoneNumberCompany, String businessCode, String businessRegis, String taxCertificate, String taxPayment) {
        this.idAcc = idAcc;
        this.fullName = fullName;
        this.birthday = birthday;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.frontCMND = frontCMND;
        this.backCMND = backCMND;
        this.nameCompany = nameCompany;
        this.addressCompany = addressCompany;
        this.emailCompany = emailCompany;
        this.phoneNumberCompany = phoneNumberCompany;
        this.businessCode = businessCode;
        this.businessRegis = businessRegis;
        this.taxCertificate = taxCertificate;
        this.taxPayment = taxPayment;
    }

    public int getIdAcc() {
        return idAcc;
    }

    public String getFullName() {
        return fullName;
    }

    public Date getBirthday() {
        return birthday;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getFrontCMND() {
        return frontCMND;
    }

    public String getBackCMND() {
        return backCMND;
    }

    public String getNameCompany() {
        return nameCompany;
    }

    public String getAddressCompany() {
        return addressCompany;
    }

    public String getEmailCompany() {
        return emailCompany;
    }

    public String getPhoneNumberCompany() {
        return phoneNumberCompany;
    }

    public String getBusinessCode() {
        return businessCode;
    }

    public String getBusinessRegis() {
        return businessRegis;
    }

    public String getTaxCertificate() {
        return taxCertificate;
    }

    public String getTaxPayment() {
        return taxPayment;
    }

    public void setIdAcc(int idAcc) {
        this.idAcc = idAcc;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setFrontCMND(String frontCMND) {
        this.frontCMND = frontCMND;
    }

    public void setBackCMND(String backCMND) {
        this.backCMND = backCMND;
    }

    public void setNameCompany(String nameCompany) {
        this.nameCompany = nameCompany;
    }

    public void setAddressCompany(String addressCompany) {
        this.addressCompany = addressCompany;
    }

    public void setEmailCompany(String emailCompany) {
        this.emailCompany = emailCompany;
    }

    public void setPhoneNumberCompany(String phoneNumberCompany) {
        this.phoneNumberCompany = phoneNumberCompany;
    }

    public void setBusinessCode(String businessCode) {
        this.businessCode = businessCode;
    }

    public void setBusinessRegis(String businessRegis) {
        this.businessRegis = businessRegis;
    }

    public void setTaxCertificate(String taxCertificate) {
        this.taxCertificate = taxCertificate;
    }

    public void setTaxPayment(String taxPayment) {
        this.taxPayment = taxPayment;
    }
    
    
}
