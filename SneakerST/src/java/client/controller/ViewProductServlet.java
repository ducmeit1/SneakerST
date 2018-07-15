/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import admincp.dao.DatabaseContext;
import client.dao.DatabaseContextClient;
import admincp.model.ImageProduct;
import admincp.model.Product;
import admincp.model.StockProduct;
import client.model.CategoryProduct;
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

/**
 *
 * @author DUCHTSE61924
 */
public class ViewProductServlet extends HttpServlet {

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
        String tmpID = request.getParameter("id").trim().replaceAll("\\s", "");
        if (tmpID == null || tmpID.equals("")) {
            response.sendRedirect(".");
            return;
        }
        try {
            int id = Integer.parseInt(tmpID);
            DatabaseContext db = new DatabaseContext();
            DatabaseContextClient dbc = new DatabaseContextClient();
            ArrayList<ImageProduct> imagesList = db.getImageURLByProductID(id);
            ArrayList<Product> productInfo = db.getProductByID(id);
            ArrayList<StockProduct> stockInfo = db.getSizeByProductID(id);
            ArrayList<CategoryProduct> categoryInfo = dbc.getFullInfoCategoryByID(id);
            request.setAttribute("imagesList", imagesList);
            request.setAttribute("stockInfo", stockInfo);
            request.setAttribute("productInfo", productInfo);
            request.setAttribute("categoryInfo", categoryInfo);
            RequestDispatcher rd = request.getRequestDispatcher("product.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewProductServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(".");
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
