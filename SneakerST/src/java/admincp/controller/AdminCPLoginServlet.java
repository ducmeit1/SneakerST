package admincp.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import admincp.dao.DatabaseContext;
import admincp.model.UserAdminCP;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DUCHTSE61924
 */
public class AdminCPLoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password");
            if (username != null && username.length() > 0 && password != null && password.length() > 0) {
                HttpSession session = request.getSession();
                DatabaseContext db = new DatabaseContext();
                if (db.authenticateLoginToAdminCP(username, password)) {
                    ArrayList<UserAdminCP> userCP = db.getUserCP();
                    session.setAttribute("userCP", userCP);
                    response.sendRedirect(".");
                } else {
                    request.setAttribute("msg-cp", "Your username or password is incorrect!");
                    request.getRequestDispatcher("").forward(request, response);
                }
            } else {
                request.setAttribute("msg-cp", "You must input username and password");
                request.getRequestDispatcher("").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminCPLoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("msg-cp", "Login Failed");
            request.getRequestDispatcher("").forward(request, response);
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
