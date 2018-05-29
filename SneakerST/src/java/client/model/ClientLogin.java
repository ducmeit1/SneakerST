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
public class ClientLogin extends Customer{
    private String groupName;

    public ClientLogin(String username, String password, String firstname, String lastname, String email, String address, String city, String state, String postcode, String country, String groupName) {
        super(username, password, firstname, lastname, email, address, city, state, postcode, country);
        this.groupName = groupName;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    
    
}
