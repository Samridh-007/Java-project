<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.amazon.util.CurrencyFetcher" %>
<%@ taglib prefix="amazon" uri="http://amazon.clone.com/tags" %>
<html>
<head>
    <title>Checkout</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f3f4f6; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .checkout-box { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); width: 100%; max-width: 400px; }
        h2 { margin-top: 0; color: #111827; }
        .amount { font-size: 24px; font-weight: 700; color: #1e293b; margin-bottom: 20px;}
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; margin-bottom: 8px; color: #374151; font-weight: 500; font-size: 14px;}
        .form-group input { width: 100%; padding: 12px; border: 1px solid #d1d5db; border-radius: 6px; box-sizing: border-box; }
        .btn { width: 100%; padding: 12px; background-color: #ffd814; color: #0f1111; border: 1px solid #fcd200; border-radius: 8px; font-size: 16px; font-weight: 500; cursor: pointer; box-shadow: 0 2px 5px rgba(213,217,217,.5); }
        .btn:hover { background-color: #f7ca00; }
        .error { color: #dc2626; margin-bottom: 15px; font-size: 14px; }
        .currency { font-size: 12px; color: #6b7280; margin-top: 10px; }
    </style>
</head>
<body>

<div class="checkout-box">
    <div style="text-align:center; font-size: 32px; font-weight: bold; margin-bottom: 20px;">amazon<span style="color:#f59e0b; font-size:18px;">.in</span></div>
    <h2>Complete Payment</h2>
    
    <% if(request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <div class="amount">
        Total to split: <amazon:priceFormatter price="${sessionScope.cart.totalAmount}" />
    </div>

    <form action="checkout" method="post">
        <div class="form-group">
            <label>Credit Card Number (must be > 8 chars for mock success)</label>
            <input type="text" name="cardNumber" required placeholder="123456789">
        </div>
        <button type="submit" class="btn">Pay Now</button>
    </form>
    
    <div class="currency">
        <!-- Demonstrating URL Connection to get live data -->
        Estimated EUR conversion rate: <%= CurrencyFetcher.getMockExchangeRate() %>
    </div>
    
    <a href="cart" style="display:block; text-align:center; margin-top: 15px; text-decoration:none; color:#3b82f6; font-size: 14px;">Back to Cart</a>
</div>

</body>
</html>
