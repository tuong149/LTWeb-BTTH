<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sản phẩm - ${product.productName}</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <style>
        .product-detail-container {
            display: flex;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 900px;
            margin: 40px auto;
        }
        .product-image-section {
            flex: 1;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f9f9f9;
        }
        .product-image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }
        .product-info-section {
            flex: 1;
            padding: 40px;
        }
        .product-title {
            font-size: 2rem;
            margin-bottom: 15px;
            color: #333;
        }
        .product-price {
            font-size: 1.8rem;
            color: #e53935;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .product-category {
            font-size: 1rem;
            color: #666;
            margin-bottom: 20px;
            display: inline-block;
            background: #eee;
            padding: 4px 12px;
            border-radius: 15px;
        }
        .product-desc {
            font-size: 1rem;
            line-height: 1.6;
            color: #555;
            margin-bottom: 30px;
        }
        .btn-buy {
            display: block;
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            text-align: center;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .btn-buy:hover {
            background: #218838;
        }
    </style>
</head>
<body>

    <div class="container">
        <c:if test="${product != null}">
            <div class="product-detail-container">
                <div class="product-image-section">
                    <c:if test="${not empty product.images}">
                        <img src="<c:url value='/image?fname=${product.images}'/>" alt="${product.productName}">
                    </c:if>
                    <c:if test="${empty product.images}">
                        <div style="color: #999; font-size: 1.2rem;">Sản phẩm chưa có ảnh</div>
                    </c:if>
                </div>
                <div class="product-info-section">
                    <div class="product-category">
                        ${product.category != null ? product.category.categoryname : 'Danh mục chung'}
                    </div>
                    <h1 class="product-title">${product.productName}</h1>
                    <div class="product-price">${product.price} VNĐ ${product.unit != null ? '/ ' += product.unit : ''}</div>
                    <div class="product-desc">
                        ${not empty product.description ? product.description : 'Chưa có mô tả cho sản phẩm này.'}
                    </div>
                    <button class="btn-buy" onclick="alert('Chức năng mua hàng đang được phát triển!')">Thêm vào giỏ hàng</button>
                </div>
            </div>
        </c:if>
        <c:if test="${product == null}">
            <div style="text-align: center; margin-top: 50px;">
                <h2 style="color: #e53935;">Không tìm thấy sản phẩm!</h2>
                <a href="<c:url value='/product'/>" class="btn btn-primary" style="margin-top: 20px;">Quay lại danh sách sản phẩm</a>
            </div>
        </c:if>
    </div>
</body>
</html>
