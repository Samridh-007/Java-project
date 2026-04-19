<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="amazon" uri="http://amazon.clone.com/tags" %>
<%@ page import="com.amazon.ejb.ShoppingCartBean" %>
<html>
<head>
    <title>Your Shopping Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8fafc; margin: 0; padding: 0; }
        .navbar { background-color: #131921; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; color: white; }
        .logo { font-size: 24px; font-weight: bold; color: white; text-decoration: none; display: flex; align-items: baseline;}
        .logo span { color: #f59e0b; font-size: 14px; margin-left: 2px;}
        .nav-links a { color: white; text-decoration: none; margin-left: 20px; font-weight: 500;}
        .nav-links a:hover { color: #f59e0b; text-decoration: underline;}
        
        .container { max-width: 800px; margin: 40px auto; padding: 0 20px; }
        .cart-box { background: white; border-radius: 12px; padding: 30px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1); }
        h1 { color: #1e293b; margin-top: 0; border-bottom: 1px solid #e2e8f0; padding-bottom: 15px;}
        
        .cart-item { display: flex; justify-content: space-between; align-items: center; padding: 15px 0; border-bottom: 1px solid #f1f5f9; }
        .item-details { flex-grow: 1; }
        .item-name { font-size: 18px; font-weight: 600; color: #0f172a; margin: 0 0 5px 0; }
        .item-qty { font-size: 14px; color: #64748b; }
        
        .btn-remove { background: #ef4444; color: white; border: none; padding: 6px 12px; border-radius: 4px; cursor: pointer; font-size: 12px; }
        .btn-remove:hover { background: #dc2626; }
        
        .total-box { text-align: right; margin-top: 30px; font-size: 20px; font-weight: 700; color: #1e293b; }
        .btn-checkout { background-color: #ffd814; color: #0f1111; border: 1px solid #fcd200; padding: 12px 24px; border-radius: 8px; font-weight: 500; cursor: pointer; display: inline-block; margin-top: 15px; text-decoration: none; font-size: 16px; box-shadow: 0 2px 5px rgba(213,217,217,.5);}
        .btn-checkout:hover { background-color: #f7ca00; }
    </style>
</head>
<body>

<div class="navbar">
    <a href="products" class="logo">amazon<span>.in</span></a>
    <div class="nav-links">
        <a href="products">Products</a>
        <a href="login">Logout</a>
    </div>
</div>

<div class="container">
    <div class="cart-box">
        <h1>Shopping Cart</h1>
        
        <!-- Unit III: Using JSTL and interacting with Stateful Session Bean (Cart) -->
        <c:set var="cart" value="${sessionScope.cart}" />
        <c:choose>
            <c:when test="${empty cart or empty cart.cartItems}">
                <p>Your Amazon Cart is empty.</p>
            </c:when>
            <c:otherwise>
                <c:forEach var="item" items="${cart.cartItems}">
                    <div class="cart-item">
                        <div class="item-details">
                            <h3 class="item-name">${item.product.name}</h3>
                            <div class="item-qty">Quantity: ${item.quantity}</div>
                        </div>
                        <div>
                            <span style="font-weight:600; margin-right: 20px;">
                                <amazon:priceFormatter price="${item.totalPrice}" />
                            </span>
                            <form action="cart" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="remove">
                                <input type="hidden" name="productId" value="${item.product.id}">
                                <button type="submit" class="btn-remove">Remove</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
                
                <div class="total-box">
                    Subtotal: <amazon:priceFormatter price="${cart.totalAmount}" />
                    <br>
                    <a href="checkout.jsp" class="btn-checkout">Proceed to Checkout</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>
