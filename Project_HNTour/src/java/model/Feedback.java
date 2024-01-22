/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Feedback {
    private int id;
    private int accId;
    private int tourId;
    private int versionId;
    private String comment;
    private int rating;
    private String accName;
    
    public Feedback() {
    }

    public Feedback(int id, int accId, int tourId, int versionId, String comment, int rating, String accName) {
        this.id = id;
        this.accId = accId;
        this.tourId = tourId;
        this.versionId = versionId;
        this.comment = comment;
        this.rating = rating;
        this.accName = accName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public int getTourId() {
        return tourId;
    }

    public void setTourId(int tourId) {
        this.tourId = tourId;
    }

    public int getVersionId() {
        return versionId;
    }

    public void setVersionId(int versionId) {
        this.versionId = versionId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    @Override
    public String toString() {
        return "Feedback{" + "id=" + id + ", accId=" + accId + ", tourId=" + tourId + ", versionId=" + versionId + ", comment=" + comment + ", rating=" + rating + ", accName=" + accName + '}';
    }
  
    
 
    
}
