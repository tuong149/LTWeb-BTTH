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

            <form action="<c:url value='/register'/>" method="post" class="needs-validation" novalidate>
                <div class="form-group mb-3">
                    <label for="username" class="form-label">Tài khoản</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Tài khoản" minlength="4" required>
                    <div class="invalid-feedback">Vui lòng nhập tài khoản (tối thiểu 4 ký tự).</div>
                </div>
                
                <div class="form-group mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Mật khẩu" minlength="6" required>
                    <div class="invalid-feedback">Vui lòng nhập mật khẩu (tối thiểu 6 ký tự).</div>
                </div>

                <div class="form-group mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Nhập Email" required>
                    <div class="invalid-feedback">Vui lòng nhập email hợp lệ.</div>
                </div>

                <div class="form-group mb-3">
                    <label for="fullname" class="form-label">Họ tên</label>
                    <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Nhập Họ tên" required>
                    <div class="invalid-feedback">Vui lòng nhập họ tên.</div>
                </div>

                <div class="form-group mb-3">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="tel" id="phone" name="phone" class="form-control" placeholder="Số điện thoại" pattern="[0-9]{10,11}" required>
                    <div class="invalid-feedback">Vui lòng nhập số điện thoại hợp lệ (10-11 số).</div>
                </div>

                <button type="submit" class="btn btn-primary w-100 mt-2">Tạo tài khoản</button>
            </form>

            <p class="text-center mt-3">
                Nếu bạn đã có tài khoản? <a href="<c:url value='/login'/>">Đăng nhập</a>
            </p>
        </div>
    </div>
</body>
</html>