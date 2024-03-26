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
public class BlogComment {
    private int pid;
    private int idblog;
    private int accBlog;
    private String comment;
    private Date commentDate;
    private String accName;
    private String accAvatar;

    public BlogComment() {
    }

    public BlogComment(int pid, int idblog, int accBlog, String comment, Date commentDate, String accName, String accAvatar) {
        this.pid = pid;
        this.idblog = idblog;
        this.accBlog = accBlog;
        this.comment = comment;
        this.commentDate = commentDate;
        this.accName = accName;
        this.accAvatar = accAvatar;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getIdblog() {
        return idblog;
    }

    public void setIdblog(int idblog) {
        this.idblog = idblog;
    }

    public int getAccBlog() {
        return accBlog;
    }

    public void setAccBlog(int accBlog) {
        this.accBlog = accBlog;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    public String getAccAvatar() {
        return accAvatar;
    }

    public void setAccAvatar(String accAvatar) {
        this.accAvatar = accAvatar;
    }

    @Override
    public String toString() {
        return "BlogComment{" + "pid=" + pid + ", idblog=" + idblog + ", accBlog=" + accBlog + ", comment=" + comment + ", commentDate=" + commentDate + ", accName=" + accName + ", accAvatar=" + accAvatar + '}';
    }

    
    
}
