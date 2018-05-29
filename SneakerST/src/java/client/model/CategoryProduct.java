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
public class CategoryProduct {
    private int id;
    private String name;
    private String urlImage;
    private String urlLink;

    public CategoryProduct(int id, String name, String urlImage, String urlLink) {
        this.id = id;
        this.name = name;
        this.urlImage = urlImage;
        this.urlLink = urlLink;
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

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public String getUrlLink() {
        return urlLink;
    }

    public void setUrlLink(String urlLink) {
        this.urlLink = urlLink;
    }
    
    
}
