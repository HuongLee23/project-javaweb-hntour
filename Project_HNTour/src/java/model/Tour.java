/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Tour {

    private int id;
    private String name;
    private String imageMain;
    private List<String> imageAlbum;
    private Time intendedTime;
    private String price;
    private String description;
    private int categoryId, version;
    private String rule;
    private int supplierId;
    private boolean status;
 

    public Tour() {
    }

    public Tour(int id, String name, String imageMain, List<String> imageAlbum, Time intendedTime, String price, String description, int categoryId, int version, String rule, int supplierId, boolean status) {
        this.id = id;
        this.name = name;
        this.imageMain = imageMain;
        this.imageAlbum = imageAlbum;
        this.intendedTime = intendedTime;
        this.price = price;
        this.description = description;
        this.categoryId = categoryId;
        this.version = version;
        this.rule = rule;
        this.supplierId = supplierId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getImageMain() {
        return imageMain;
    }

    public List<String> getImageAlbum() {
        return imageAlbum;
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

    public int getSupplierId() {
        return supplierId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImageMain(String imageMain) {
        this.imageMain = imageMain;
    }

    public void setImageAlbum(List<String> imageAlbum) {
        this.imageAlbum = imageAlbum;
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

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    

}
