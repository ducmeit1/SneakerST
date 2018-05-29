/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admincp.controller;

import admincp.dao.DatabaseContext;
import admincp.model.Category;
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
public class CategoryProcessServlet extends HttpServlet {

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
        if (session.getAttribute("userCP") == null) {
            response.sendRedirect("/sneakerst/admincp");
            return;
        }
        String URL = "/admincp/categorymanagement.jsp";
        try {

            String action = request.getParameter("action");
            DatabaseContext db = new DatabaseContext();
            switch (action) {
                case "view":
                    int id = Integer.parseInt(request.getParameter("id"));
                    ArrayList<Category> categoryResult = db.getCategoryByID(id);
                    request.setAttribute("categoryResult", categoryResult);
                    URL = "/admincp/category.jsp";
                    break;
                case "update":
                    id = Integer.parseInt(request.getParameter("category_id"));
                    String name = request.getParameter("category_name");
                    db.categoryProcess("update", id, name);
                    request.setAttribute("cp-msg", "Updated Category");
                    URL = "/admincp/category?action=view&id=" + id;
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    name = request.getParameter("name");
                    db.categoryProcess("delete", id, name);
                    request.setAttribute("cp-msg", "Deleted Category");
                    URL = "/admincp/categorymanagement.jsp";
                    break;
                case "add":
                    id = Integer.parseInt(request.getParameter("category_id"));
                    name = request.getParameter("category_name");
                    db.categoryProcess("add", id, name);
                    request.setAttribute("cp-msg", "Added Category");
                    URL = "/admincp/categorymanagement.jsp";
                    break;
            }
            RequestDispatcher rd = request.getRequestDispatcher(URL);
            rd.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryProcessServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("cp-msg", "Action Error");
            RequestDispatcher rd = request.getRequestDispatcher(URL);
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
