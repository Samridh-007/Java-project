<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Amazon.in - Login</title>
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-card {
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
            width: 100%;
            max-width: 400px;
        }
        .login-card h2 {
            margin-top: 0;
            color: #111827;
            font-size: 24px;
            font-weight: 600;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #374151;
            font-size: 14px;
            font-weight: 500;
        }
        .form-group input[type="text"],
        .form-group input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            box-sizing: border-box;
            transition: border-color 0.2s;
        }
        .form-group input:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }
        .btn {
            width: 100%;
            padding: 12px;
            background-color: #f7ca00;
            color: #111;
            border: 1px solid #a88734;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.2s;
            box-shadow: 0 1px 0 rgba(255,255,255,.4) inset;
        }
        .btn:hover {
            background-color: #f4d078;
        }
        .error {
            color: #dc2626;
            margin-bottom: 15px;
            font-size: 14px;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
            font-size: 32px;
            font-weight: bold;
            color: #000;
            display: flex;
            justify-content: center;
            align-items: baseline;
        }
        .logo span {
            color: #f59e0b;
            font-size: 18px;
            margin-left: 2px;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="login-card">
    <div class="logo">amazon<span>.in</span></div>
    <h2>Sign In</h2>
    
    <% if(request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="login" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="<%= request.getAttribute("rememberedUsername") != null ? request.getAttribute("rememberedUsername") : "" %>" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <input type="checkbox" id="remember" name="remember" />
            <label for="remember" style="display:inline;">Remember me</label>
        </div>
        <button type="submit" class="btn">Login</button>
    </form>
    <p style="text-align: center; font-size: 12px; color: #6b7280; margin-top: 20px;">Use: admin / password</p>
</div>

</body>
</html>
