<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>金牌打手</title>
</head>
<body>
<%
    // 会话失效
    session.invalidate();
    response.sendRedirect(request.getContextPath() + "/index.jsp");
%>
</body>
</html>

