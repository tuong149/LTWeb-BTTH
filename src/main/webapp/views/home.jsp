<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Danh sách sản phẩm/danh mục</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
</head>
<body>
    <div class="navbar">
        <h1>Shopping App</h1>
        <div>
            <c:if test="${not empty sessionScope.account}">
                <span>Xin chào, <strong>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</strong></span>
                <a href="<c:url value='/logout'/>" class="btn btn-danger" style="margin-left: 20px;">Đăng xuất</a>
            </c:if>
            <c:if test="${empty sessionScope.account}">
                <span>Xin chào Khách!</span>
                <a href="<c:url value='/login'/>" class="btn btn-primary" style="margin-left: 20px; border: 1px solid white;">Đăng nhập ngay</a>
            </c:if>
        </div>
    </div>

    <div class="container">
        <h2 style="margin-top: 20px;">Danh mục mua sắm</h2>
        
        <div class="grid-container">
            <c:forEach items="${cateList}" var="cate">
                <div class="grid-card">
                    <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                    <c:if test="${not empty cate.images}">
                        <img src="${imgUrl}" alt="${cate.categoryname}"/>
                    </c:if>
                    <c:if test="${empty cate.images}">
                        <img src="https://via.placeholder.com/200x150?text=No+Image" alt="No Image"/>
                    </c:if>
                    <h3>${cate.categoryname}</h3>
                </div>
            </c:forEach>
            
            <c:if test="${empty cateList}">
                <p class="text-center" style="grid-column: 1 / -1;">Hiện chưa có danh mục sản phẩm nào!</p>
            </c:if>
        </div>
    </div>
</body>
</html>
