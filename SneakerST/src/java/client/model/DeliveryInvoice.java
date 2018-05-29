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
public class DeliveryInvoice {
    private int invoiceID;
    private String dfName;
    private String dlName;
    private String dAddress;
    private String dCity;
    private String dState;
    private String dCountry;
    private String dPhone;
    private String dMethod;

    public DeliveryInvoice() {
    }

    
    public DeliveryInvoice(int invoiceID, String dfName, String dlName, String dAddress, String dCity, String dState, String dCountry, String dPhone, String dMethod) {
        this.invoiceID = invoiceID;
        this.dfName = dfName;
        this.dlName = dlName;
        this.dAddress = dAddress;
        this.dCity = dCity;
        this.dState = dState;
        this.dCountry = dCountry;
        this.dPhone = dPhone;
        this.dMethod = dMethod;
    }

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public String getDfName() {
        return dfName;
    }

    public void setDfName(String dfName) {
        this.dfName = dfName;
    }

    public String getDlName() {
        return dlName;
    }

    public void setDlName(String dlName) {
        this.dlName = dlName;
    }

    public String getdAddress() {
        return dAddress;
    }

    public void setdAddress(String dAddress) {
        this.dAddress = dAddress;
    }

    public String getdCity() {
        return dCity;
    }

    public void setdCity(String dCity) {
        this.dCity = dCity;
    }

    public String getdState() {
        return dState;
    }

    public void setdState(String dState) {
        this.dState = dState;
    }

    public String getdCountry() {
        return dCountry;
    }

    public void setdCountry(String dCountry) {
        this.dCountry = dCountry;
    }

    public String getdPhone() {
        return dPhone;
    }

    public void setdPhone(String dPhone) {
        this.dPhone = dPhone;
    }

    public String getdMethod() {
        return dMethod;
    }

    public void setdMethod(String dMethod) {
        this.dMethod = dMethod;
    }
    
    
}
