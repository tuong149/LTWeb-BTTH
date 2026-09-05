<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản Phẩm</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <style>
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
            margin-top: 20px;
        }
        .product-card {
            border: 1px solid #eee;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            transition: transform 0.2s;
            background: #fff;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .product-img {
            max-width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 4px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            list-style: none;
            padding: 0;
        }
        .pagination li {
            margin: 0 5px;
        }
        .pagination a {
            display: block;
            padding: 8px 12px;
            border: 1px solid #ddd;
            color: #333;
            text-decoration: none;
            border-radius: 4px;
        }
        .pagination a.active {
            background-color: #0d6efd;
            color: white;
            border-color: #0d6efd;
        }
        .pagination a:hover:not(.active) {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>

    <div class="container" style="margin-top: 30px; margin-bottom: 50px;">
        <h2 style="text-align: center; margin-bottom: 30px;">Tất Cả Sản Phẩm</h2>
        
        <div class="product-grid">
            <c:forEach items="${prodList}" var="prod">
                <div class="product-card">
                    <a href="<c:url value='/product/detail?id=${prod.productId}'/>" style="text-decoration: none; color: inherit;">
                        <c:if test="${not empty prod.images}">
                            <img src="<c:url value='/image?fname=${prod.images}'/>" class="product-img" alt="${prod.productName}">
                        </c:if>
                        <c:if test="${empty prod.images}">
                            <div style="height: 200px; display: flex; align-items: center; justify-content: center; background: #f5f5f5; color: #999;">Không có ảnh</div>
                        </c:if>
                        <h4 style="margin: 15px 0 10px; font-size: 1.1rem;">${prod.productName}</h4>
                        <p style="color: #e53935; font-weight: bold; font-size: 1.2rem; margin: 0;">${prod.price} VNĐ ${prod.unit != null ? '/ ' += prod.unit : ''}</p>
                    </a>
                </div>
            </c:forEach>
        </div>

        <c:if test="${empty prodList}">
            <p style="text-align: center; margin-top: 30px; font-size: 1.2rem; color: #666;">Không có sản phẩm nào.</p>
        </c:if>

        <c:if test="${endPage > 1}">
            <ul class="pagination">
                <c:forEach begin="1" end="${endPage}" var="i">
                    <li>
                        <a href="<c:url value='/product?page=${i}'/>" class="${currentPage == i ? 'active' : ''}">${i}</a>
                    </li>
                </c:forEach>
            </ul>
        </c:if>
    </div>
</body>
</html>
