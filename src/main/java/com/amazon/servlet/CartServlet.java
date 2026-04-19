package com.amazon.servlet;

import com.amazon.ejb.ProductCatalogBean;
import com.amazon.ejb.ShoppingCartBean;
import com.amazon.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private ProductCatalogBean productCatalog = new ProductCatalogBean();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        // Retrieve or Create Stateful Session Bean for Shopping Cart
        ShoppingCartBean cart = (ShoppingCartBean) session.getAttribute("cart");
        if (cart == null) {
            cart = new ShoppingCartBean();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            Long productId = Long.parseLong(request.getParameter("productId"));
            Product p = productCatalog.getProductById(productId);
            if (p != null) {
                cart.addItem(p, 1);
            }
        } else if ("remove".equals(action)) {
            Long productId = Long.parseLong(request.getParameter("productId"));
            cart.removeItem(productId);
        }

        // Redirect back to cart view
        response.sendRedirect("cart");
    }
}
