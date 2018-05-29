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
public class ProductManagement extends Product{
    private String thumbURL;

    public ProductManagement(String thumbURL, int id, String name, String description, String detail, float price, String gender, int category, String inStock) {
        super(id, name, description, detail, price, gender, category, inStock);
        this.thumbURL = thumbURL;
    }

    public String getThumbURL() {
        return thumbURL;
    }

    public void setThumbURL(String thumbURL) {
        this.thumbURL = thumbURL;
    }

    
    

    
}
