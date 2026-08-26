<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>Tạo tài khoản mới</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/register" method="post">
    <h2>Tạo tài khoản mới</h2>

    <c:if test="${not empty alert}">
        <h3 style="color: red">${alert}</h3>
    </c:if>

    <div><input type="text" name="fullname" placeholder="Họ tên" required></div>
    <div><input type="email" name="email" placeholder="Nhập Email" required></div>
    <div><input type="text" name="username" placeholder="Tài khoản" required></div>
    <div><input type="password" name="password" placeholder="Mật khẩu" required></div>
    <div><input type="text" name="phone" placeholder="Số điện thoại"></div>

    <button type="submit">Tạo tài khoản</button>
    <p>Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a></p>
</form>
</body>
</html>