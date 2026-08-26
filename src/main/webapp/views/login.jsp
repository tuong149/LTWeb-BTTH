<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập hệ thống</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 50px; }
        .login-box { width: 350px; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }
        .alert-danger { color: red; font-weight: bold; }
        .form-group { margin-bottom: 15px; }
        input[type="text"], input[type="password"] { width: 100%; padding: 8px; box-sizing: border-box; }
        button { padding: 10px 15px; background-color: #007bff; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Đăng Nhập Vào Hệ Thống</h2>

    <!-- Hiển thị thông báo lỗi nếu có -->
    <c:if test="${not empty alert}">
        <h3 class="alert-danger">${alert}</h3>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label>Tài khoản</label>
            <input type="text" name="username" placeholder="Nhập tài khoản" required />
        </div>
        <div class="form-group">
            <label>Mật khẩu</label>
            <input type="password" name="password" placeholder="Nhập mật khẩu" required />
        </div>
        <button type="submit">Đăng nhập</button>
    </form>

    <p style="margin-top: 15px;">
        Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
    </p>
</div>
</body>
</html>