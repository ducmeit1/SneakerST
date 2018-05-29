/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client.controller;

import client.model.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class CartProcessServlet extends HttpServlet {

    public int productIsExist(ArrayList<CartItem> cartList, int id, String size) {
        for (int i = 0; i < cartList.size(); i++) {
            if (cartList.get(i).getProductID() == id && cartList.get(i).getSizeName().equalsIgnoreCase(size)) {
                return i;
            }
        }
        return -1;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sizeName = request.getParameter("size");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (session.getAttribute("shopping_cart") != null) {
            ArrayList<CartItem> cartList = (ArrayList<CartItem>) session.getAttribute("shopping_cart");
            int pos = productIsExist(cartList, id, sizeName);
            if (pos >= 0) {
                if (action.equals("remove")) {
                    cartList.remove(pos);
                    request.setAttribute("msg-client", "Removed Item");
                }
                if (action.equals("up")) {
                    cartList.get(pos).setQuantity(cartList.get(pos).getQuantity() + 1);
                    request.setAttribute("msg-client", "Updated Item");
                }
                if (action.equals("down")) {
                    cartList.get(pos).setQuantity(cartList.get(pos).getQuantity() - 1);
                    if (cartList.get(pos).getQuantity() <= 0) {
                        cartList.remove(pos);
                    }
                    request.setAttribute("msg-client", "Updated Item");
                }
                if (cartList.size() > 0) {
                    session.setAttribute("shopping_cart", cartList);
                } else {
                    session.setAttribute("shopping_cart", null);
                }
                RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
                rd.forward(request, response);
            }
        }
        response.sendRedirect(".");
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
