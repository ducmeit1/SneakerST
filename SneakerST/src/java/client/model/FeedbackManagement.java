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
public class FeedbackManagement {

    private String user;
    private int id;
    private String name;
    private String gender;
    private String address;
    private String email;
    private String phone;
    private String productID;
    private String productName;
    private Date datebuy;
    private String Comment;
    private String status;

    public FeedbackManagement() {
    }

    public FeedbackManagement(String user, int id, String name, String gender, String address, String email, String phone, String productID, String productName, Date datebuy, String Comment, String status) {
        this.user = user;
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.productID = productID;
        this.productName = productName;
        this.datebuy = datebuy;
        this.Comment = Comment;
        this.status = status;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
