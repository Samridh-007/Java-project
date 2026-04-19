<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="amazon" uri="http://amazon.clone.com/tags" %>
<html>
<head>
    <title>Amazon.in - Products</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8fafc; margin: 0; padding: 0; }
        .navbar { background-color: #131921; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; color: white; }
        .logo { font-size: 24px; font-weight: bold; color: white; text-decoration: none; display: flex; align-items: baseline;}
        .logo span { color: #f59e0b; font-size: 14px; margin-left: 2px;}
        .nav-links a { color: white; text-decoration: none; margin-left: 20px; font-weight: 500;}
        .nav-links a:hover { color: #f59e0b; text-decoration: underline; }
        
        .container { max-width: 1200px; margin: 40px auto; padding: 0 20px; }
        h1 { color: #1e293b; margin-bottom: 30px; }
        
        .product-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 30px; }
        .product-card { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1); transition: transform 0.2s, box-shadow 0.2s; display: flex; flex-direction: column;}
        .product-card:hover { transform: translateY(-5px); box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1); }
        .product-image { height: 200px; background-color: #f1f5f9; display: flex; justify-content: center; align-items: center; color: #94a3b8; font-size: 40px;}
        .product-info { padding: 20px; flex-grow: 1; display:flex; flex-direction: column;}
        .product-name { font-size: 18px; font-weight: 600; margin: 0 0 10px 0; color: #0f172a; }
        .product-desc { font-size: 14px; color: #64748b; margin-bottom: 15px; flex-grow: 1; }
        .price { font-size: 20px; font-weight: 700; color: #b91c1c; margin-bottom: 15px; }
        
        .btn-add { background-color: #ffd814; color: #0f1111; border: 1px solid #fcd200; padding: 10px; border-radius: 8px; font-weight: 500; cursor: pointer; transition: background 0.2s; width: 100%; box-shadow: 0 2px 5px rgba(213,217,217,.5);}
        .btn-add:hover { background-color: #f7ca00; }
        
        .applet-container { margin-top: 50px; background: white; padding: 20px; border-radius: 12px; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); text-align: center;}
    </style>
</head>
<body>

<div class="navbar">
    <a href="products" class="logo">amazon<span>.in</span></a>
    <div class="nav-links">
        <span>Hello, ${sessionScope.user}!</span>
        <a href="cart">Cart</a>
        <a href="login">Logout</a>
    </div>
</div>

<div class="container">
    <h1>Featured Products</h1>
    
    <div class="product-grid">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <div class="product-image" style="background-image: url('${product.imageUrl}'); background-size: cover; background-position: center; border-bottom: 1px solid #f1f5f9;"></div>
                <div class="product-info">
                    <h3 class="product-name">${product.name}</h3>
                    <p class="product-desc">${product.description}</p>
                    
                    <!-- Demonstrating Unit III: Custom Tag Library -->
                    <amazon:priceFormatter price="${product.price}" />
                    
                    <form action="cart" method="post" style="margin:0;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="btn-add">Add to Cart</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Market Insights: Simulated in HTML5 Canvas for modern browsers (Applet source is maintained in codebase for syllabus) -->
    <div class="applet-container" style="text-align: left; max-width: 600px; margin: 40px auto; padding: 30px; background: white; border-radius: 12px; border: 1px solid #e2e8f0; box-shadow: 0 4px 6px -1px rgba(0,0,0,0.05);">
        <h3 style="margin-top: 0; color: #0f1111; font-size: 20px;">Market Insights: Price Trend</h3>
        <p style="color: #565959; font-size: 14px; margin-bottom: 20px;">Historical pricing analysis across electronics category.</p>
        <canvas id="marketChart" width="540" height="150" style="width: 100%; height: auto; display: block; border-left: 2px solid #e2e8f0; border-bottom: 2px solid #e2e8f0;"></canvas>
        <script>
            const canvas = document.getElementById('marketChart');
            const ctx = canvas.getContext('2d');
            
            // Draw trend line
            ctx.beginPath();
            ctx.moveTo(0, 120);
            ctx.bezierCurveTo(100, 120, 150, 40, 200, 60);
            ctx.bezierCurveTo(300, 100, 400, 20, 540, 30);
            ctx.strokeStyle = '#007185'; // Amazon link blue
            ctx.lineWidth = 3;
            ctx.stroke();
            
            // Draw gradient fill under line
            const gradient = ctx.createLinearGradient(0, 0, 0, 150);
            gradient.addColorStop(0, 'rgba(0, 113, 133, 0.2)');
            gradient.addColorStop(1, 'rgba(0, 113, 133, 0)');
            
            ctx.lineTo(540, 150);
            ctx.lineTo(0, 150);
            ctx.fillStyle = gradient;
            ctx.fill();

            // Draw axis labels
            ctx.fillStyle = '#565959';
            ctx.font = '12px Inter';
            ctx.fillText('Jan', 10, 140);
            ctx.fillText('Feb', 130, 140);
            ctx.fillText('Mar', 260, 140);
            ctx.fillText('Apr', 400, 140);
            ctx.fillText('May', 500, 140);
        </script>
    </div>

</div>

</body>
</html>
