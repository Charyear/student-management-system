<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>金牌打手</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to bottom, #c62828, #d32f2f); /* Red gradient */
            color: #fff; /* Default text color for body */
            min-height: 100vh;
        }
        .container.mt-4 {
             background: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
             padding: 20px;
             border-radius: 10px;
             box-shadow: 0 0 20px rgba(0,0,0,0.5);
             color: #333; /* Dark text for container */
        }
        h2 {
            color: #c62828; /* Darker red for title */
        }
        .table {
            color: #333; /* Dark text for table */
        }
        .table th {
            color: #c62828; /* Darker red for table headers */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>学生信息列表</h2>
            <div>
                <a href="add" class="btn btn-primary">
                    <i class="bi bi-plus-circle"></i> 添加学生
                </a>
                <a href="<%= request.getContextPath() %>/logout.jsp" class="btn btn-danger ms-2">
                    <i class="bi bi-box-arrow-right"></i> 退出登录
                </a>
            </div>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>专业</th>
                        <th>邮箱</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <% 
                    java.util.List studentList = (java.util.List)request.getAttribute("students");
                    if (studentList != null) {
                        for (Object obj : studentList) {
                            model.Student student = (model.Student)obj;
                %>
                    <tr>
                        <td><%= student.getStudentId() %></td>
                        <td><%= student.getName() %></td>
                        <td><%= student.getGender() %></td>
                        <td><%= student.getAge() %></td>
                        <td><%= student.getMajor() %></td>
                        <td><%= student.getEmail() %></td>
                        <td>
                            <a href="<%= request.getContextPath() %>/student/edit?id=<%= student.getStudentId() %>" class="btn btn-sm btn-warning">
                                <i class="bi bi-pencil"></i> 编辑
                            </a>
                            <a href="<%= request.getContextPath() %>/student/delete?id=<%= student.getStudentId() %>" 
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('确定要删除该学生吗？')">
                                <i class="bi bi-trash"></i> 删除
                            </a>
                        </td>
                    </tr>
                <%      }
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 