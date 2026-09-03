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
                <a href="<c:url value='/profile'/>" class="btn btn-primary" style="margin-left: 20px;">Trang cá nhân</a>
                <a href="<c:url value='/logout'/>" class="btn btn-danger" style="margin-left: 10px;">Đăng xuất</a>
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

        <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 40px; margin-bottom: 20px;">
            <h2>Top 10 Sản Phẩm Mới Nhất</h2>
            <a href="<c:url value='/product'/>" class="btn btn-primary" style="background-color: #f8f9fa; color: #333; border: 1px solid #ddd;">Xem tất cả ></a>
        </div>
        
        <div class="grid-container" style="margin-bottom: 50px;">
            <c:forEach items="${topProducts}" var="prod">
                <div class="grid-card" style="padding: 15px; border-radius: 8px;">
                    <a href="<c:url value='/product/detail?id=${prod.productId}'/>" style="text-decoration: none; color: inherit;">
                        <c:url value="/image?fname=${prod.images}" var="prodImgUrl"></c:url>
                        <c:if test="${not empty prod.images}">
                            <img src="${prodImgUrl}" alt="${prod.productName}" style="height: 150px; object-fit: cover; border-radius: 4px;"/>
                        </c:if>
                        <c:if test="${empty prod.images}">
                            <div style="height: 150px; display: flex; align-items: center; justify-content: center; background: #f5f5f5; color: #999;">Không có ảnh</div>
                        </c:if>
                        <h4 style="margin: 10px 0; font-size: 1.1rem; text-align: center;">${prod.productName}</h4>
                        <p style="color: #e53935; font-weight: bold; text-align: center;">${prod.price} VNĐ ${prod.unit != null ? '/ ' += prod.unit : ''}</p>
                    </a>
                </div>
            </c:forEach>
            
            <c:if test="${empty topProducts}">
                <p class="text-center" style="grid-column: 1 / -1;">Hiện chưa có sản phẩm nào!</p>
            </c:if>
        </div>
    </div>
</body>
</html>
