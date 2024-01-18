/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hello
 */
public class Account {

    private int id;
    private String avatar;
    private String email, username, password;
    private int role;
    private String address;
    private String phoneNumber, cmnd;
    private boolean status;

    public Account() {
    }

//    public Account(int id, String email, String username, String password,
//            int role, String address, String phoneNumber, String cmnd) {
//        this.id = id;
//        this.email = email;
//        this.username = username;
//        this.password = password;
//        this.role = role;
//        this.address = address;
//        this.phoneNumber = phoneNumber;
//        this.cmnd = cmnd;
//    }
//
//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getEmail() {
//        return email;
//    }
//
//    public void setEmail(String email) {
//        this.email = email;
//    }
//
//    public String getUsername() {
//        return username;
//    }
//
//    public void setUsername(String username) {
//        this.username = username;
//    }
//
//    public String getPassword() {
//        return password;
//    }
//
//    public void setPassword(String password) {
//        this.password = password;
//    }
//
//    public int getRole() {
//        return role;
//    }
//
//    public void setRole(int role) {
//        this.role = role;
//    }
//
//    public String getAddress() {
//        return address;
//    }
//
//    public void setAddress(String address) {
//        this.address = address;
//    }
//
//    public String getPhoneNumber() {
//        return phoneNumber;
//    }
//
//    public void setPhoneNumber(String phoneNumber) {
//        this.phoneNumber = phoneNumber;
//    }
//
//    public String getCmnd() {
//        return cmnd;
//    }
//
//    public void setCmnd(String cmnd) {
//        this.cmnd = cmnd;
//    }
    public Account(int id, String avatar, String email, String username, String password, int role, String address, String phoneNumber, String cmnd, boolean status) {
        this.id = id;
        this.avatar = avatar;
        this.email = email;
        this.username = username;
        this.password = password;
        this.role = role;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.cmnd = cmnd;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getAvatar() {
        return avatar;
    }

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getRole() {
        return role;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getCmnd() {
        return cmnd;
    }

    public boolean isStatus() {
        return status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
