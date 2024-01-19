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
    private int price;
    private String description;
    private int categoryId,versionId,ruleId,feedbackId,supplierId;
    private String imgMain;

    public Tour() {
    }

    public Tour(int id, String name, int imageId, Time intendedTime, int price, String description, int categoryId, int versionId, int ruleId, int feedbackId, int supplierId, String imgMain) {
        this.id = id;
        this.name = name;
        this.imageId = imageId;
        this.intendedTime = intendedTime;
        this.price = price;
        this.description = description;
        this.categoryId = categoryId;
        this.versionId = versionId;
        this.ruleId = ruleId;
        this.feedbackId = feedbackId;
        this.supplierId = supplierId;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
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

    public int getVersionId() {
        return versionId;
    }

    public void setVersionId(int versionId) {
        this.versionId = versionId;
    }

    public int getRuleId() {
        return ruleId;
    }

    public void setRuleId(int ruleId) {
        this.ruleId = ruleId;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public String getImgMain() {
        return imgMain;
    }

    public void setImgMain(String imgMain) {
        this.imgMain = imgMain;
    }

    @Override
    public String toString() {
        return "Tour{" + "id=" + id + ", name=" + name + ", imageId=" + imageId + ", intendedTime=" + intendedTime + ", price=" + price + ", description=" + description + ", categoryId=" + categoryId + ", versionId=" + versionId + ", ruleId=" + ruleId + ", feedbackId=" + feedbackId + ", supplierId=" + supplierId + ", imgMain=" + imgMain + '}';
    }
    
    
    

    

    

    
    
    
    
}
