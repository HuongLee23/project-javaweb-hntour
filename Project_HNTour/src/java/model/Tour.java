/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;

/**
 *
 * @author Admin
 */
public class Tour {

    private int id;
    private String name;
    private int imageId;
    private Time intendedTime;
    private String price;
    private String description;
    private int categoryId, version;
    private String rule;
    private int  supplierId;
    private boolean status;
    private String imgMain;

    public Tour() {
    }

    public Tour(int id, String name, int imageId, Time intendedTime, String price, String description, int categoryId, int version, String rule, int supplierId, boolean status, String imgMain) {
        this.id = id;
        this.name = name;
        this.imageId = imageId;
        this.intendedTime = intendedTime;
        this.price = price;
        this.description = description;
        this.categoryId = categoryId;
        this.version = version;
        this.rule = rule;
        this.supplierId = supplierId;
        this.status = status;
        this.imgMain = imgMain;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public Time getIntendedTime() {
        return intendedTime;
    }

    public void setIntendedTime(Time intendedTime) {
        this.intendedTime = intendedTime;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImgMain() {
        return imgMain;
    }

    public void setImgMain(String imgMain) {
        this.imgMain = imgMain;
    }

    @Override
    public String toString() {
        return "Tour{" + "id=" + id + ", name=" + name + ", imageId=" + imageId + ", intendedTime=" + intendedTime + ", price=" + price + ", description=" + description + ", categoryId=" + categoryId + ", version=" + version + ", rule=" + rule + ", supplierId=" + supplierId + ", status=" + status + ", imgMain=" + imgMain + '}';
    }

   

}
