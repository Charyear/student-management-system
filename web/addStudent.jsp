<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>金牌打手</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom, #c62828, #d32f2f); /* Red gradient */
            color: #333; /* Default text color for body */
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
        }
        .container.mt-4 {
             background: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
             padding: 30px;
             border-radius: 10px;
             box-shadow: 0 0 20px rgba(0,0,0,0.5);
             color: #333; /* Dark text for container */
        }
        .card-header {
            background-color: rgba(198, 40, 40, 0.8); /* Darker red for card header */
            color: #fff; /* White text for card header */
        }
        .card-title {
            color: #fff; /* White text for card title */
        }
        .form-label {
            color: #555; /* Darker text for labels */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">添加学生</h3>
                    </div>
                    <div class="card-body">
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-danger">
                                <%= request.getAttribute("error") %>
                            </div>
                        <% } %>

                        <form action="<%= request.getContextPath() %>/student/add" method="post">
                            <div class="mb-3">
                                <label for="studentId" class="form-label">学号</label>
                                <input type="text" class="form-control" id="studentId" name="studentId" required>
                            </div>
                            <div class="mb-3">
                                <label for="name" class="form-label">姓名</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">密码</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="gender" class="form-label">性别</label>
                                <select class="form-select" id="gender" name="gender" required>
                                    <option value="">请选择性别</option>
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="age" class="form-label">年龄</label>
                                <input type="number" class="form-control" id="age" name="age" required min="1" max="100">
                            </div>
                            <div class="mb-3">
                                <label for="major" class="form-label">专业</label>
                                <input type="text" class="form-control" id="major" name="major" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">邮箱</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <a href="<%= request.getContextPath() %>/student/list" class="btn btn-secondary">返回列表</a>
                                <button type="submit" class="btn btn-primary">添加</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 