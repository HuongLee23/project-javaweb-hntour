/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class ImageAlbum {
    private int id;
    private String imgMain;
    private String img1;
    private String img2;
    private String img3;
    private String img4;

    public ImageAlbum() {
    }

    public ImageAlbum(int id, String imgMain, String img1, String img2, String img3, String img4) {
        this.id = id;
        this.imgMain = imgMain;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImgMain() {
        return imgMain;
    }

    public void setImgMain(String imgMain) {
        this.imgMain = imgMain;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    @Override
    public String toString() {
        return "ImageAlbum{" + "id=" + id + ", imgMain=" + imgMain + ", img1=" + img1 + ", img2=" + img2 + ", img3=" + img3 + ", img4=" + img4 + '}';
    }
    
    
}
