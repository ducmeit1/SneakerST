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
public class InvoiceStatus {
    private int invoiceID;
    private String username;
    private int invoiceStatusID;

    public InvoiceStatus() {
    }

    public InvoiceStatus(int invoiceID, String username, int invoiceStatusID) {
        this.invoiceID = invoiceID;
        this.username = username;
        this.invoiceStatusID = invoiceStatusID;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getInvoiceStatusID() {
        return invoiceStatusID;
    }

    public void setInvoiceStatusID(int invoiceStatusID) {
        this.invoiceStatusID = invoiceStatusID;
    }
    
    
}
