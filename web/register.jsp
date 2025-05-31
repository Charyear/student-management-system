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
        .register-container {
            background: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.5);
            max-width: 800px; /* Further increased max-width */
            width: 90%; /* Set width to a percentage of its container */
            margin: auto; /* Use auto margin for centering in flex container */
            padding: 40px 50px; /* Increased padding */
            border: 2px solid rgba(255, 255, 255, 0.5);
            color: #333; /* Dark text for container */
        }
        .register-title {
            font-size: 2rem;
            font-weight: bold;
            text-align: center;
            margin-bottom: 30px;
            color: #c62828; /* Darker red for title */
            letter-spacing: 2px;
        }
        .form-label {
            font-weight: bold;
            color: #555;
        }
        .btn-submit {
            width: 48%;
        }
        /* Style for the bottom links */
        .footer-links a {
            color: #ef9a9a; /* Light red color */
        }

        /* Style for form inputs to make them wider */
        .register-container .mb-3 .form-control,
        .register-container .mb-3 .form-select {
            width: 100% !important; /* Make inputs fill their container, override with !important */
        }

        /* Ensure form takes full width of container */
        .register-container form {
            width: 100%;
        }

        /* Ensure mb-3 divs within the form take full width */
        .register-container form .mb-3 {
            width: 100%;
        }

    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-title">学生信息注册</div>
        <form action="<%= request.getContextPath() %>/register" method="post">
            <div class="mb-3">
                <label class="form-label">学号：</label>
                <input type="text" class="form-control" name="studentId" placeholder="请输入学号" required>
            </div>
            <div class="mb-3">
                <label class="form-label">姓名：</label>
                <input type="text" class="form-control" name="name" placeholder="请输入姓名" required>
            </div>
            <div class="mb-3">
                <label class="form-label">密码：</label>
                <input type="password" class="form-control" name="password" placeholder="请输入密码" minlength="6" required>
            </div>
            <div class="mb-3">
                <label class="form-label">性别：</label>
                <div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="男" required>
                        <label class="form-check-label" for="male">男</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="女">
                        <label class="form-check-label" for="female">女</label>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">年龄：</label>
                <input type="number" class="form-control" name="age" min="1" max="100" required>
            </div>
            <div class="mb-3">
                <label class="form-label">专业：</label>
                <input type="text" class="form-control" name="major" placeholder="请输入专业" required>
            </div>
            <div class="mb-3">
                <label class="form-label">邮箱：</label>
                <input type="email" class="form-control" name="email" placeholder="请输入邮箱" required>
            </div>
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-primary btn-submit">提交</button>
                <a href="<%= request.getContextPath() %>/login.jsp" class="btn btn-secondary btn-submit">取消</a>
            </div>
        </form>

        <%-- Move links div inside register-container --%>
        <div class="text-center mt-4 footer-links">
            <a href="https://www.hnfnu.edu.cn/" target="_blank" class="text-decoration-none me-3">学校官网</a>
            <a href="https://itd.hnfnu.edu.cn/" target="_blank" class="text-decoration-none">学院官网</a>
        </div>

    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 