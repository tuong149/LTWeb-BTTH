<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục</title>
    <style>
        .form-container { width: 50%; margin: 50px auto; border: 1px solid #ccc; padding: 20px; border-radius: 5px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-control { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { padding: 10px 15px; margin-right: 10px; cursor: pointer; border: none; border-radius: 3px; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-default { background-color: #6c757d; color: white; }
        .text-danger { color: red; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Thêm danh mục mới</h2>
        
        <c:if test="${not empty error}">
            <p class="text-danger">${error}</p>
        </c:if>

        <form role="form" action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label>Tên danh mục:</label>
                <input type="text" class="form-control" placeholder="Please enter category Name" name="name" required />
            </div>
            
            <div class="form-group">
                <label>Ảnh đại diện:</label>
                <input type="file" class="form-control" name="icon" accept="image/*" />
            </div>
            
            <button type="submit" class="btn btn-primary">Thêm</button>
            <button type="reset" class="btn btn-default">Hủy</button>
            <a href="<c:url value='/admin/category/list'/>">Quay lại danh sách</a>
        </form>
    </div>
</body>
</html>
