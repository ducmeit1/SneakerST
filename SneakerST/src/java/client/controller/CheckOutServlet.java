/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import client.dao.DatabaseContextClient;
import client.model.BillingInvoice;
import client.model.CartItem;
import client.model.DeliveryInvoice;
import client.model.InvoiceStatus;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DUCHTSE61924
 */
public class CheckOutServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            if (session.getAttribute("shopping_cart") != null) {

                DatabaseContextClient dbc = new DatabaseContextClient();
                Random rand = new Random();
                String username = request.getParameter("username");
                int tmpID = rand.nextInt((100000 - 1) + 1) + 1;
                int id = tmpID;
                if (dbc.getDuplicateInvoiceID(tmpID) >= 0) {
                    id += 1;
                }
//Invoice Detail
                InvoiceStatus i = new InvoiceStatus();
                i.setInvoiceID(id);
                i.setInvoiceStatusID(1);
                i.setUsername(username);
                dbc.addInvoice(i);
//Billing

                BillingInvoice b = new BillingInvoice();
                b.setBfName(request.getParameter("firstname"));
                b.setBlName(request.getParameter("lastname"));
                b.setInvoiceID(id);
                b.setbAddress(request.getParameter("address"));
                b.setbCity(request.getParameter("city"));
                b.setbCountry(request.getParameter("country"));
                b.setbEmail(request.getParameter("email"));
                b.setbPayment(request.getParameter("payment"));
                b.setbState(request.getParameter("state"));
                b.setbPhone(request.getParameter("phone"));
                dbc.addBilling(b);
                //Delivery
                DeliveryInvoice d = new DeliveryInvoice();
                d.setDfName(request.getParameter("dfirstname"));
                d.setDlName(request.getParameter("dlastname"));
                d.setInvoiceID(id);
                d.setdAddress(request.getParameter("daddress"));
                d.setdCity(request.getParameter("dcity"));
                d.setdState(request.getParameter("dstate"));
                d.setdMethod(request.getParameter("delivery"));
                d.setdCountry(request.getParameter("dcountry"));
                d.setdPhone(request.getParameter("dphone"));
                dbc.addDelivery(d);
                //Cart Detail
                ArrayList<CartItem> c = (ArrayList<CartItem>) session.getAttribute("shopping_cart");
                dbc.cartInvoiceDetail(c, id);
                RequestDispatcher rd = request.getRequestDispatcher("viewinvoice.jsp?invoice="+id);
                session.setAttribute("shopping_cart", null);
                rd.forward(request, response);
            }
        } catch (SQLException ex) {
            request.setAttribute("msg-client", "Check out failed");
            RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
            rd.forward(request, response);
        }
        request.setAttribute("msg-client", "Check out failed");
        RequestDispatcher rd = request.getRequestDispatcher("checkout.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
