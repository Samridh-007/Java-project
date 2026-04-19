package com.amazon.servlet;

import com.amazon.ejb.ShoppingCartBean;
import com.amazon.rmi.PaymentGateway;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        ShoppingCartBean cart = (ShoppingCartBean) session.getAttribute("cart");
        if (cart == null || cart.getCartItems().isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        String cardNumber = request.getParameter("cardNumber");
        double amount = cart.getTotalAmount();

        boolean paymentSuccess = false;
        try {
            // RMI Client implementation
            Registry registry = LocateRegistry.getRegistry("localhost", 1099);
            PaymentGateway gateway = (PaymentGateway) registry.lookup("PaymentGateway");
            
            paymentSuccess = gateway.processPayment(cardNumber, amount);
        } catch (Exception e) {
            System.err.println("RMI Setup exception: " + e.toString());
            // Fail gracefully if RMI server isn't running
            request.setAttribute("error", "Payment Gateway Offline (RMI Server not started).");
        }

        if (paymentSuccess) {
            cart.clearCart(); // Clear stateful session bean
            request.getRequestDispatcher("checkout_success.jsp").forward(request, response);
        } else {
            if (request.getAttribute("error") == null) {
                request.setAttribute("error", "Payment Rejected! Invalid Card.");
            }
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }
}
