/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admincp.controller;

import admincp.dao.DatabaseContext;
import admincp.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class AddProductServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("userCP") == null) {
            response.sendRedirect("/sneakerst/admincp");
            return;
        }
        try {
            Product p = new Product();
            p.setId(Integer.parseInt(request.getParameter("product_id")));
            p.setName(request.getParameter("product_name"));
            p.setDescription(request.getParameter("product_description"));
            p.setDetail(request.getParameter("product_detail"));
            p.setPrice(Float.parseFloat(request.getParameter("product_price")));
            p.setCategory(Integer.parseInt(request.getParameter("product_category")));
            p.setInStock(request.getParameter("product_instock"));
            p.setGender(request.getParameter("product_gender"));
            String[] product_image_url = request.getParameterValues("product_image_url");
            String[] product_size = request.getParameterValues("product_size");
            DatabaseContext db = new DatabaseContext();
            db.addProduct(p);
            db.addImageURL(p, product_image_url);
            db.addSize(p, product_size);
            request.setAttribute("cp-msg", "Added Product");
            RequestDispatcher rd = request.getRequestDispatcher("/admincp/addproduct.jsp");
            rd.forward(request, response);
        } catch (SQLException ex) {
            request.setAttribute("cp-msg", "Add Product Failed");
            Logger.getLogger(AddProductServlet.class.getName()).log(Level.SEVERE, null, ex);
            RequestDispatcher rd = request.getRequestDispatcher("/admincp/addproduct.jsp");
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
