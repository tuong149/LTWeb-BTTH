<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <link href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/css/style.css'/>" rel="stylesheet">
</head>
<body>
    <main>
        <div class="container">
            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Đặt lại mật khẩu</h5>
                                        <p class="text-center small">Nhập mã OTP và mật khẩu mới của bạn</p>
                                    </div>
                                    
                                    <c:if test="${not empty alert}">
                                        <div class="alert alert-danger" role="alert">
                                            ${alert}
                                        </div>
                                    </c:if>

                                    <form class="row g-3 needs-validation" action="<c:url value='/reset-password'/>" method="post" novalidate>
                                        <input type="hidden" name="email" value="${email}" />
                                        
                                        <div class="col-12">
                                            <label for="otp" class="form-label">Mã OTP</label>
                                            <input type="text" name="otp" class="form-control" id="otp" required>
                                            <div class="invalid-feedback">Vui lòng nhập mã OTP.</div>
                                        </div>
                                        
                                        <div class="col-12">
                                            <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                            <input type="password" name="newPassword" class="form-control" id="newPassword" required>
                                            <div class="invalid-feedback">Vui lòng nhập mật khẩu mới.</div>
                                        </div>

                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">Cập nhật mật khẩu</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>
</body>
</html>
