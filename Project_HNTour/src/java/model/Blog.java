

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Blog {
    private int bid;
    private String title;
    private String content;
    private String image;
    private Date publishDate;
    private int accountId;
    private String accountName;
    private int status;

    public Blog() {
    }

    public Blog(int bid, String title, String content, String image, Date publishDate, int accountId, String accountName, int status) {
        this.bid = bid;
        this.title = title;
        this.content = content;
        this.image = image;
        this.publishDate = publishDate;
        this.accountId = accountId;
        this.accountName = accountName;
        this.status = status;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Blog{" + "bid=" + bid + ", title=" + title + ", content=" + content + ", image=" + image + ", publishDate=" + publishDate + ", accountId=" + accountId + ", accountName=" + accountName + ", status=" + status + '}';
    }

   

}

