<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>金牌打手</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom, #c62828, #d32f2f); /* Red gradient */
            color: #fff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }
        .login-container {
            max-width: 400px;
            margin: auto; /* Use auto margin for centering in flex container */
            padding: 30px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white background for container */
            color: #333; /* Dark text color for container */
        }
        .login-container h2 {
            color: #c62828; /* Darker red for title */
        }
        .form-label {
            color: #555;
        }
        /* Style for the bottom links */
        .footer-links a {
            color: #ef9a9a; /* Light red color */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <h2 class="text-center mb-4">Login-登录</h2>
            
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <form action="<%= request.getContextPath() %>/login" method="post">
                <div class="mb-3">
                    <label for="studentId" class="form-label">学号</label>
                    <input type="text" class="form-control" id="studentId" name="studentId" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">密码</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">登录</button>
            </form>
            <div class="text-center mt-3">
                <a href="<%= request.getContextPath() %>/register.jsp" class="btn btn-outline-success w-100">注册</a>
            </div>
            
            <div class="text-center mt-4 footer-links">
                <a href="https://www.hnfnu.edu.cn/" target="_blank" class="text-decoration-none me-3">学校官网</a>
                <a href="https://itd.hnfnu.edu.cn/" target="_blank" class="text-decoration-none">学院官网</a>
            </div>

        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 