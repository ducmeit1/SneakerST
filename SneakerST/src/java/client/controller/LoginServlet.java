/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import admincp.model.UserAdminCP;
import client.dao.DatabaseContextClient;
import client.model.ClientLogin;
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
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("userCustomer") != null) {
            response.sendRedirect(".");
            return;
        }
        if (session.getAttribute("userCP") != null) {
            response.sendRedirect("./admincp");
            return;
        }
        try {
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password");
            DatabaseContextClient db = new DatabaseContextClient();
            if (username.length() > 0 && username != null) {
                if (db.authenticateLogin(username, password)) {
                    ArrayList<ClientLogin> user = db.getUserClient();
                    for (ClientLogin s : user) {
                        if (!s.getGroupName().equalsIgnoreCase("Customer")) {
                            UserAdminCP userCP = new UserAdminCP(s.getUsername(), s.getPassword(), s.getFirstname(), s.getGroupName());
                            session.setAttribute("userCP", userCP);
                            response.sendRedirect("./admincp");
                        } else {
                            session.setAttribute("userCustomer", user);
                            response.sendRedirect(".");
                        }
                    }
                } else {
                    request.setAttribute("msg-client", "Login Failed");
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
                }
            } else {
                request.setAttribute("msg-client", "You must input username and password");
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    rd.forward(request, response);
            }
        } catch (SQLException ex) {
            request.setAttribute("msg-client", "Login Failed");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.forward(request, response);
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
