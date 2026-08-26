<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm danh mục</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
</head>
<body>
    <div class="navbar">
        <h1>Quản Trị Danh Mục</h1>
        <div>
            <a href="<c:url value='/logout'/>" class="btn btn-danger">Đăng xuất</a>
        </div>
    </div>

    <div class="container">
        <div class="card form-container">
            <h2>Thêm danh mục mới</h2>
            
            <c:if test="${not empty error}">
                <p class="text-danger">${error}</p>
            </c:if>

            <form role="form" action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Tên danh mục:</label>
                    <input type="text" id="name" name="name" class="form-control" placeholder="Nhập tên danh mục" required />
                </div>
                
                <div class="form-group">
                    <label for="icon">Ảnh đại diện:</label>
                    <input type="file" id="icon" name="icon" class="form-control" accept="image/*" />
                </div>
                
                <div class="flex-between mt-3">
                    <div>
                        <button type="submit" class="btn btn-success">Lưu danh mục</button>
                        <button type="reset" class="btn btn-default">Hủy</button>
                    </div>
                    <a href="<c:url value='/admin/category/list'/>" class="btn btn-default">Quay lại</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
