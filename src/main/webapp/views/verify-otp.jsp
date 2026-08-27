<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Xác thực OTP</title>
    <!-- Favicons -->
    <link href="<c:url value='/assets/img/favicon.png'/>" rel="icon">
    <link href="<c:url value='/assets/img/apple-touch-icon.png'/>" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="<c:url value='/assets/vendor/aos/aos.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/glightbox/css/glightbox.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/remixicon/remixicon.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/vendor/swiper/swiper-bundle.min.css'/>" rel="stylesheet">

    <!-- Template Main CSS File -->
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
                                        <h5 class="card-title text-center pb-0 fs-4">Xác thực tài khoản</h5>
                                        <p class="text-center small">Nhập mã OTP đã được gửi đến email của bạn</p>
                                    </div>
                                    
                                    <c:if test="${not empty alert}">
                                        <div class="alert alert-danger" role="alert">
                                            ${alert}
                                        </div>
                                    </c:if>

                                    <form class="row g-3 needs-validation" action="<c:url value='/verify-otp'/>" method="post" novalidate>
                                        <input type="hidden" name="username" value="${username}" />
                                        
                                        <div class="col-12">
                                            <label for="otp" class="form-label">Mã OTP</label>
                                            <input type="text" name="otp" class="form-control" id="otp" required>
                                            <div class="invalid-feedback">Vui lòng nhập mã OTP.</div>
                                        </div>

                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">Xác thực</button>
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

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="<c:url value='/assets/vendor/purecounter/purecounter_vanilla.js'/>"></script>
    <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
    <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
    <script src="<c:url value='/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>
    <script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>
    <script src="<c:url value='/assets/vendor/php-email-form/validate.js'/>"></script>

    <!-- Template Main JS File -->
    <script src="<c:url value='/assets/js/main.js'/>"></script>
</body>
</html>
