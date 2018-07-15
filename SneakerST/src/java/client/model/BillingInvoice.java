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
public class BillingInvoice {
    private int invoiceID;
    private String bfName;
    private String blName;
    private String bEmail;
    private String bAddress;
    private String bCity;
    private String bState;
    private String bCountry;
    private String bPayment;
    private String bPhone;

    public BillingInvoice() {
    }
    
    public BillingInvoice(int invoiceID, String bfName, String blName, String bEmail, String bAddress, String bCity, String bState, String bCountry, String bPayment, String bPhone) {
        this.invoiceID = invoiceID;
        this.bfName = bfName;
        this.blName = blName;
        this.bEmail = bEmail;
        this.bAddress = bAddress;
        this.bCity = bCity;
        this.bState = bState;
        this.bCountry = bCountry;
        this.bPayment = bPayment;
        this.bPhone = bPhone;
    }

    public String getbPhone() {
        return bPhone;
    }

    public void setbPhone(String bPhone) {
        this.bPhone = bPhone;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public String getBfName() {
        return bfName;
    }

    public void setBfName(String bfName) {
        this.bfName = bfName;
    }

    public String getBlName() {
        return blName;
    }

    public void setBlName(String blName) {
        this.blName = blName;
    }

    public String getbEmail() {
        return bEmail;
    }

    public void setbEmail(String bEmail) {
        this.bEmail = bEmail;
    }

    public String getbAddress() {
        return bAddress;
    }

    public void setbAddress(String bAddress) {
        this.bAddress = bAddress;
    }

    public String getbCity() {
        return bCity;
    }

    public void setbCity(String bCity) {
        this.bCity = bCity;
    }

    public String getbState() {
        return bState;
    }

    public void setbState(String bState) {
        this.bState = bState;
    }

    public String getbCountry() {
        return bCountry;
    }

    public void setbCountry(String bCountry) {
        this.bCountry = bCountry;
    }

    public String getbPayment() {
        return bPayment;
    }

    public void setbPayment(String bPayment) {
        this.bPayment = bPayment;
    }

    
}
