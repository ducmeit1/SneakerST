/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import client.dao.DatabaseContextClient;
import client.model.Customer;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("userCustomer") != null) {
            response.sendRedirect(".");
            return;
        }
        ArrayList<Customer> c;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fName = request.getParameter("firstname");
            String lName = request.getParameter("lastname");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String postC = request.getParameter("postcode");
            String country = request.getParameter("country");
            DatabaseContextClient db = new DatabaseContextClient();
            if (!db.getDuplicateUsername(username)) {
                request.setAttribute("msg-client", "Username is exists!");
                RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
                rd.forward(request, response);
                return;
            }
            db.registerUser(new Customer(username, password, fName, lName, email, address, city, state, postC, country));
            c = new ArrayList();
            c.add(new Customer(username, password, fName, lName, email, address, city, state, postC, country));
            response.sendRedirect("login?username="+username+"&password="+password);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("msg-client", "Register failed");
            RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
            rd.forward(request, response);
        }
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
