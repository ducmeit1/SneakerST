/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.model;

/**
 *
 * @author DUCHTSE61924
 */
public class NewArrivals {
    private int productId;
    private String imageUrl;
    private String productName;
    private float unitPrice;
    private String gender;

    public NewArrivals() {
    }

    public NewArrivals(int productId, String imageUrl, String productName, float unitPrice, String gender) {
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.productName = productName;
        this.unitPrice = unitPrice;
        this.gender = gender;
    }
    
    

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    

    
}
