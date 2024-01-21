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
    private int feedbackId, supplierId;
    private boolean status;
    private String imgMain;

    public Tour() {
    }

    public Tour(int id, String name, int imageId, Time intendedTime, String price, String description, int categoryId, int version, String rule, int feedbackId, int supplierId, boolean status, String imgMain) {
        this.id = id;
        this.name = name;
        this.imageId = imageId;
        this.intendedTime = intendedTime;
        this.price = price;
        this.description = description;
        this.categoryId = categoryId;
        this.version = version;
        this.rule = rule;
        this.feedbackId = feedbackId;
        this.supplierId = supplierId;
        this.status = status;
        this.imgMain = imgMain;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getImageId() {
        return imageId;
    }

    public Time getIntendedTime() {
        return intendedTime;
    }

    public String getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public int getVersion() {
        return version;
    }

    public String getRule() {
        return rule;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public boolean isStatus() {
        return status;
    }

    public String getImgMain() {
        return imgMain;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public void setIntendedTime(Time intendedTime) {
        this.intendedTime = intendedTime;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public void setRule(String rule) {
        this.rule = rule;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setImgMain(String imgMain) {
        this.imgMain = imgMain;
    }

    @Override
    public String toString() {
        return "Tour{" + "id=" + id + ", name=" + name + ", imageId=" + imageId + ", intendedTime=" + intendedTime + ", price=" + price + ", description=" + description + ", categoryId=" + categoryId + ", version=" + version + ", rule=" + rule + ", feedbackId=" + feedbackId + ", supplierId=" + supplierId + ", status=" + status + ", imgMain=" + imgMain + '}';
    }

}
