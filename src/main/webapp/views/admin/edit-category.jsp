<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cập nhật danh mục</title>
    <style>
        .form-container { width: 50%; margin: 50px auto; border: 1px solid #ccc; padding: 20px; border-radius: 5px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-control { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { padding: 10px 15px; margin-right: 10px; cursor: pointer; border: none; border-radius: 3px; }
        .btn-primary { background-color: #007bff; color: white; }
        .btn-default { background-color: #6c757d; color: white; }
        .text-danger { color: red; }
        .img-responsive { max-width: 150px; height: auto; display: block; margin-top: 10px; }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Cập nhật danh mục</h2>
        
        <c:if test="${not empty error}">
            <p class="text-danger">${error}</p>
        </c:if>

        <form role="form" action="<c:url value='/admin/category/edit'/>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${category.id}" />
            
            <div class="form-group">
                <label>Tên danh mục:</label>
                <input type="text" class="form-control" name="name" value="${category.name}" required />
            </div>
            
            <div class="form-group">
                <label>Ảnh đại diện hiện tại:</label>
                <c:if test="${not empty category.icon}">
                    <c:url value="/image?fname=${category.icon}" var="imgUrl"></c:url>
                    <img src="${imgUrl}" class="img-responsive" alt="icon"/>
                </c:if>
                <c:if test="${empty category.icon}">
                    <p>Chưa có ảnh</p>
                </c:if>
            </div>

            <div class="form-group">
                <label>Chọn ảnh mới (Bỏ trống nếu không muốn đổi):</label>
                <input type="file" class="form-control" name="icon" accept="image/*" />
            </div>
            
            <button type="submit" class="btn btn-primary">Cập nhật</button>
            <button type="reset" class="btn btn-default">Reset form</button>
            <a href="<c:url value='/admin/category/list'/>">Quay lại danh sách</a>
        </form>
    </div>
</body>
</html>
