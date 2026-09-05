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

    <div class="container mt-4">
        <div class="card shadow p-4 mx-auto" style="max-width: 600px;">
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            
            <form action="<c:url value='/admin/product/add'/>" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                <div class="mb-3">
                    <label for="productName" class="form-label fw-bold">Tên sản phẩm</label>
                    <input type="text" id="productName" name="productName" class="form-control" required>
                    <div class="invalid-feedback">Vui lòng nhập tên sản phẩm.</div>
                </div>
                
                <div class="mb-3">
                    <label for="price" class="form-label fw-bold">Giá (VNĐ)</label>
                    <input type="number" id="price" name="price" step="0.01" class="form-control" required>
                    <div class="invalid-feedback">Vui lòng nhập giá hợp lệ.</div>
                </div>

                <div class="mb-3">
                    <label for="unit" class="form-label fw-bold">Đơn vị tính</label>
                    <input type="text" id="unit" name="unit" placeholder="Ví dụ: Cái, Hộp, Kg..." class="form-control" required>
                    <div class="invalid-feedback">Vui lòng nhập đơn vị tính.</div>
                </div>
                
                <div class="mb-3">
                    <label for="categoryId" class="form-label fw-bold">Danh mục</label>
                    <select id="categoryId" name="categoryId" class="form-select" required>
                        <option value="">-- Chọn danh mục --</option>
                        <c:forEach items="${categories}" var="cate">
                            <option value="${cate.categoryId}">${cate.categoryname}</option>
                        </c:forEach>
                    </select>
                    <div class="invalid-feedback">Vui lòng chọn danh mục.</div>
                </div>
                
                <div class="mb-3">
                    <label for="description" class="form-label fw-bold">Mô tả</label>
                    <textarea id="description" name="description" rows="4" class="form-control"></textarea>
                </div>

                <div class="mb-4">
                    <label for="image" class="form-label fw-bold">Hình ảnh</label>
                    <input type="file" id="image" name="image" accept="image/*" class="form-control" required>
                    <div class="invalid-feedback">Vui lòng chọn hình ảnh.</div>
                </div>

                <button type="submit" class="btn btn-success w-100 fs-5">Lưu Sản Phẩm</button>
            </form>
        </div>
    </div>
</body>
</html>
