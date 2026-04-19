<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Amazon.in - Order Success</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body { background-color: #f0fdf4; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; font-family: 'Inter', sans-serif;}
        .card { background: white; padding: 40px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.05); text-align: center; max-width: 400px; }
        .icon { font-size: 60px; margin-bottom: 20px; }
        h2 { color: #166534; margin-top:0; }
        p { color: #4b5563; font-size: 16px; margin-bottom: 30px;}
        .btn { background-color: #ffd814; color: #0f1111; border: 1px solid #fcd200; padding: 12px 24px; border-radius: 8px; font-weight: 500; text-decoration: none; box-shadow: 0 2px 5px rgba(213,217,217,.5);}
        .btn:hover { background-color: #f7ca00; }
    </style>
</head>
<body>

<div class="card">
    <div class="icon">✅</div>
    <h2>Order Confirmed!</h2>
    <p>Your mock payment was successfully processed via RMI. Thank you for shopping at Amazon.in.</p>
    <a href="products" class="btn">Continue Shopping</a>
</div>

</body>
</html>
