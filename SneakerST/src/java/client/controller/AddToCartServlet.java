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
public class AddToCartServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        CartItem c = new CartItem();
        c.setProductID(Integer.parseInt(request.getParameter("product_id")));
        c.setProductName(request.getParameter("product_name"));
        c.setCategoryName(request.getParameter("product_category"));
        c.setImageURL(request.getParameter("product_main_pic"));
        c.setProductGender(request.getParameter("product_gender"));
        c.setProductPrice(Float.parseFloat(request.getParameter("product_price")));
        c.setSizeName(request.getParameter("product_size"));
        c.setQuantity(1);
        if (session.getAttribute("shopping_cart") == null) {
            ArrayList<CartItem> cartList = new ArrayList();
            cartList.add(c);
            session.setAttribute("shopping_cart", cartList);
        } else {
            ArrayList<CartItem> cartList = (ArrayList<CartItem>) session.getAttribute("shopping_cart");
            int isExisted = productIsExist(cartList, c.getProductID(), c.getSizeName());
            if (isExisted >= 0) {
                cartList.get(isExisted).setQuantity(cartList.get(isExisted).getQuantity() + 1);
                request.setAttribute("msg-client", "Added to cart successful");
                RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
                rd.forward(request, response);
                return;
            }
            cartList.add(c);
        }
        request.setAttribute("msg-client", "Added to cart successful");
        RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
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
