<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/></title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <sitemesh:write property='head'/>
</head>
<body>
    <nav class="navbar navbar-expand-lg" style="background-color: var(--primary-navy); box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
        <div class="container-fluid">
            <a class="navbar-brand" href="<c:url value='/admin'/>" style="color: var(--accent-blue); font-weight: bold; font-size: 20px;">UTEMall Admin</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" style="border-color: rgba(255,255,255,0.1);">
                <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-center">
                    <c:if test="${not empty sessionScope.account}">
                        <li class="nav-item">
                            <a class="btn" style="color: var(--text-white); margin-right: 10px;" onmouseover="this.style.color='var(--accent-blue)'" onmouseout="this.style.color='var(--text-white)'" href="<c:url value='/admin/category/list'/>">QL Danh mục</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn" style="color: var(--text-white); margin-right: 10px;" onmouseover="this.style.color='var(--accent-blue)'" onmouseout="this.style.color='var(--text-white)'" href="<c:url value='/admin/product/list'/>">QL Sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <span class="nav-link" style="color: var(--text-white); margin-right: 15px; border-left: 1px solid rgba(255,255,255,0.2); padding-left: 20px;">Xin chào, <strong>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</strong></span>
                        </li>
                        <li class="nav-item">
                            <a class="btn" style="color: var(--text-white); margin-right: 10px; border: 1px solid rgba(255,255,255,0.3);" onmouseover="this.style.backgroundColor='rgba(255,255,255,0.1)'" onmouseout="this.style.backgroundColor='transparent'" href="<c:url value='/profile'/>">Trang cá nhân</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-danger text-white px-3 py-2" style="font-weight: 500;" href="<c:url value='/logout'/>">Đăng xuất</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <sitemesh:write property='body'/>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-5">
        &copy; 2026 UTEMall Admin. All rights reserved.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</body>
</html>
