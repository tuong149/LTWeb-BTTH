<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sitemesh" uri="http://sitemesh.org/tags-sitemesh" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><sitemesh:write property='title'/></title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <sitemesh:write property='head'/>
</head>
<body>
    <div class="navbar">
        <h1><a href="<c:url value='/home'/>" style="color:white; text-decoration:none;">Shopping App</a></h1>
        <div>
            <c:if test="${not empty sessionScope.account}">
                <span>Xin chào, <strong>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</strong></span>
                <a href="<c:url value='/profile'/>" class="btn btn-primary" style="margin-left: 20px;">Trang cá nhân</a>
                <a href="<c:url value='/logout'/>" class="btn btn-danger" style="margin-left: 10px;">Đăng xuất</a>
            </c:if>
            <c:if test="${empty sessionScope.account}">
                <span>Xin chào Khách!</span>
                <a href="<c:url value='/login'/>" class="btn btn-primary" style="margin-left: 20px; border: 1px solid white;">Đăng nhập ngay</a>
            </c:if>
        </div>
    </div>

    <!-- Nội dung của các trang con sẽ được chèn vào đây -->
    <sitemesh:write property='body'/>

    <div style="text-align: center; margin-top: 50px; padding: 20px; background: #333; color: white;">
        &copy; 2026 Shopping App. All rights reserved.
    </div>
</body>
</html>
