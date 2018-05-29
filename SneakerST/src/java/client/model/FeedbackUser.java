/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.model;

import java.sql.Date;

/**
 *
 * @author DUCHTSE61924
 */
public class FeedbackUser {

    private String name;
    private String address;
    private String phone;
    private String productID;
    private String productName;
    private Date datebuy;
    private String Comment;
    private String status;

    public FeedbackUser() {
    }

    public FeedbackUser(String name, String address, String phone, String productID, String productName, Date datebuy, String Comment, String status) {
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.productID = productID;
        this.productName = productName;
        this.datebuy = datebuy;
        this.Comment = Comment;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Date getDatebuy() {
        return datebuy;
    }

    public void setDatebuy(Date datebuy) {
        this.datebuy = datebuy;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
