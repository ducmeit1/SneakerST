/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admincp.model;

/**
 *
 * @author DUCHTSE61924
 */
public class StockProduct {
    private int sizeID;
    private String sizeName;
    private int productID;
    private int sizeQuantity;

    public StockProduct(int sizeID, String sizeName, int productID, int sizeQuantity) {
        this.sizeID = sizeID;
        this.sizeName = sizeName;
        this.productID = productID;
        this.sizeQuantity = sizeQuantity;
    }
    
    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public String getSizeName() {
        return sizeName;
    }

    public void setSizeName(String sizeName) {
        this.sizeName = sizeName;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getSizeQuantity() {
        return sizeQuantity;
    }

    public void setSizeQuantity(int sizeQuantity) {
        this.sizeQuantity = sizeQuantity;
    }

    
}
