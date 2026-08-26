<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập hệ thống</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
</head>
<body>
    <div class="container">
        <div class="card form-container">
            <h2>Đăng Nhập Vào Hệ Thống</h2>

            <!-- Hiển thị thông báo lỗi nếu có -->
            <c:if test="${not empty alert}">
                <p class="text-danger">${alert}</p>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label for="username">Tài khoản</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Nhập tài khoản" required />
                </div>
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu" required />
                </div>
                
                <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
            </form>

            <p class="text-center mt-3">
                Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a>
            </p>
        </div>
    </div>
</body>
</html>