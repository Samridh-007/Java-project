package com.amazon.servlet;

import com.amazon.model.User;
import com.amazon.util.HibernateUtil;
import org.hibernate.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // Handling HTTP GET Request
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session Tracking: Check if already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("products");
            return;
        }

        // Check Cookie for remembered username
        String rememberedUsername = "";
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("rememberedUser")) {
                    rememberedUsername = c.getValue();
                }
            }
        }
        
        request.setAttribute("rememberedUsername", rememberedUsername);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    // Handling HTTP POST Request
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");

        boolean isAuthenticated = false;
        try (Session hibernateSession = HibernateUtil.getSessionFactory().openSession()) {
            User foundUser = hibernateSession.createQuery("from User where username=:u and password=:p", User.class)
                    .setParameter("u", user)
                    .setParameter("p", pass)
                    .uniqueResult();
            
            if (foundUser != null) isAuthenticated = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (isAuthenticated) {
            // Session Tracking
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Cookies
            if ("on".equals(remember)) {
                Cookie c = new Cookie("rememberedUser", user);
                c.setMaxAge(60 * 60 * 24 * 30); // 30 days
                response.addCookie(c);
            } else {
                Cookie c = new Cookie("rememberedUser", "");
                c.setMaxAge(0);
                response.addCookie(c);
            }

            response.sendRedirect("products");
        } else {
            request.setAttribute("error", "Invalid Credentials!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
