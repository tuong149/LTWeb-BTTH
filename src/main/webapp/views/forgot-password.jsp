<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <!-- Template Main CSS File -->
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
                                        <h5 class="card-title text-center pb-0 fs-4">Quên mật khẩu</h5>
                                        <p class="text-center small">Nhập email để nhận mã xác thực (OTP)</p>
                                    </div>
                                    
                                    <c:if test="${not empty alert}">
                                        <div class="alert alert-danger" role="alert">
                                            ${alert}
                                        </div>
                                    </c:if>

                                    <form class="row g-3 needs-validation" action="<c:url value='/forgot-password'/>" method="post" novalidate>
                                        <div class="col-12">
                                            <label for="email" class="form-label">Email</label>
                                            <input type="email" name="email" class="form-control" id="email" required>
                                            <div class="invalid-feedback">Vui lòng nhập email hợp lệ.</div>
                                        </div>

                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">Gửi mã OTP</button>
                                        </div>
                                        <div class="col-12">
                                            <p class="small mb-0">Quay lại <a href="<c:url value='/login'/>">Đăng nhập</a></p>
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
