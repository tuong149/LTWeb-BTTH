<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm sản phẩm mới</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Thêm Sản Phẩm Mới</h1>
        <a href="<c:url value='/admin/product/list'/>" class="btn" style="color: white; border: 1px solid white;">Quay lại danh sách</a>
    </div>

    <div class="container" style="margin-top: 40px;">
        <div class="form-container">
            <c:if test="${not empty error}">
                <div style="color: red; margin-bottom: 15px;">${error}</div>
            </c:if>
            
            <form action="<c:url value='/admin/product/add'/>" method="post" enctype="multipart/form-data">
                <div class="form-group" style="margin-bottom: 15px;">
                    <label for="productName" style="display: block; margin-bottom: 5px; font-weight: bold;">Tên sản phẩm</label>
                    <input type="text" id="productName" name="productName" required style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                </div>
                
                <div class="form-group" style="margin-bottom: 15px;">
                    <label for="price" style="display: block; margin-bottom: 5px; font-weight: bold;">Giá (VNĐ)</label>
                    <input type="number" id="price" name="price" step="0.01" required style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                </div>
                
                <div class="form-group" style="margin-bottom: 15px;">
                    <label for="categoryId" style="display: block; margin-bottom: 5px; font-weight: bold;">Danh mục</label>
                    <select id="categoryId" name="categoryId" required style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                        <option value="">-- Chọn danh mục --</option>
                        <c:forEach items="${categories}" var="cate">
                            <option value="${cate.categoryId}">${cate.categoryname}</option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="form-group" style="margin-bottom: 15px;">
                    <label for="description" style="display: block; margin-bottom: 5px; font-weight: bold;">Mô tả</label>
                    <textarea id="description" name="description" rows="4" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;"></textarea>
                </div>

                <div class="form-group" style="margin-bottom: 25px;">
                    <label for="image" style="display: block; margin-bottom: 5px; font-weight: bold;">Hình ảnh</label>
                    <input type="file" id="image" name="image" accept="image/*" style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                </div>

                <button type="submit" class="btn btn-success" style="width: 100%; padding: 10px; font-size: 16px;">Lưu Sản Phẩm</button>
            </form>
        </div>
    </div>
</body>
</html>
