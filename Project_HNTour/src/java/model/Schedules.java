/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Time;

/**
 *
 * @author admin
 */
public class Schedules {

    private int id;
    private int tourId;
    private int versionId;
    private String location;
    private Time date;
    private String descriptionSchedules;

    public Schedules() {
    }

    public Schedules(int id, int tourId, int versionId, String location, Time date, String descriptionSchedules) {
        this.id = id;
        this.tourId = tourId;
        this.versionId = versionId;
        this.location = location;
        this.date = date;
        this.descriptionSchedules = descriptionSchedules;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Time getDate() {
        return date;
    }

    public void setDate(Time date) {
        this.date = date;
    }

    public String getDescriptionSchedules() {
        return descriptionSchedules;
    }

    public void setDescriptionSchedules(String descriptionSchedules) {
        this.descriptionSchedules = descriptionSchedules;
    }

}
