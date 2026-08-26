<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tạo tài khoản mới</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
</head>
<body>
    <div class="container">
        <div class="card form-container">
            <h2>Tạo tài khoản mới</h2>

            <c:if test="${alert != null}">
                <p class="text-danger">${alert}</p>
            </c:if>

            <form action="<c:url value='/register'/>" method="post">
                <div class="form-group">
                    <label for="username">Tài khoản</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Tài khoản" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Mật khẩu" required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Nhập Email" required>
                </div>

                <div class="form-group">
                    <label for="fullname">Họ tên</label>
                    <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Nhập Họ tên" required>
                </div>

                <div class="form-group">
                    <label for="phone">Số điện thoại</label>
                    <input type="text" id="phone" name="phone" class="form-control" placeholder="Số điện thoại" required>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Tạo tài khoản</button>
            </form>

            <p class="text-center mt-3">
                Nếu bạn đã có tài khoản? <a href="<c:url value='/login'/>">Đăng nhập</a>
            </p>
        </div>
    </div>
</body>
</html>