<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cập nhật danh mục</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <style>
        .current-img-box {
            background-color: var(--bg-light);
            border: 1px dashed var(--border-color);
            padding: 10px;
            border-radius: 4px;
            text-align: center;
            margin-bottom: 15px;
        }
        .current-img-box img {
            max-height: 120px;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card form-container">
            <h2>Cập nhật danh mục</h2>
            
            <c:if test="${not empty error}">
                <p class="text-danger">${error}</p>
            </c:if>

            <form role="form" action="<c:url value='/admin/category/edit'/>" method="post" enctype="multipart/form-data">
                <input type="hidden" name="id" value="${category.categoryId}" />
                
                <div class="form-group">
                    <label for="name">Tên danh mục:</label>
                    <input type="text" id="name" name="name" class="form-control" value="${category.categoryname}" required />
                </div>
                
                <div class="form-group">
                    <label>Ảnh đại diện hiện tại:</label>
                    <div class="current-img-box">
                        <c:if test="${not empty category.images}">
                            <c:url value="/image?fname=${category.images}" var="imgUrl"></c:url>
                            <img src="${imgUrl}" class="img-responsive" alt="icon"/>
                        </c:if>
                        <c:if test="${empty category.images}">
                            <p style="margin: 0; color: #888;">Chưa có ảnh</p>
                        </c:if>
                    </div>
                </div>

                <div class="form-group">
                    <label for="icon">Chọn ảnh mới (Bỏ trống nếu giữ nguyên):</label>
                    <input type="file" id="icon" name="icon" class="form-control" accept="image/*" />
                </div>
                
                <div class="flex-between mt-3">
                    <div>
                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                    </div>
                    <a href="<c:url value='/admin/category/list'/>" class="btn btn-default">Quay lại</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
