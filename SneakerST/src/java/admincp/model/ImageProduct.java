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
public class ImageProduct {
    private int id;
    private String url;
    private int product_id;

    public ImageProduct(int id, String url, int product_id) {
        this.id = id;
        this.url = url;
        this.product_id = product_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    } 
}
