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
public class Product {
    private int id;
    private String name;
    private String description;
    private String detail;
    private float price;
    private String gender;
    private int category;
    private String inStock;

    public Product() {
    }

    public Product(int id, String name, String description, String detail, float price, String gender, int category, String inStock) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.detail = detail;
        this.price = price;
        this.gender = gender;
        this.category = category;
        this.inStock = inStock;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }

    public String getInStock() {
        return inStock;
    }

    public void setInStock(String inStock) {
        this.inStock = inStock;
    }
    
    
    
}
