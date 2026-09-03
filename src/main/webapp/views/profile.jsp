<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cập nhật Profile</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <style>
        .profile-container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-update {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .btn-update:hover {
            background-color: #0056b3;
        }
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 4px;
        }
        .alert-success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .alert-danger { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .avatar-preview {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 2px solid #ddd;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h2 style="text-align: center; margin-bottom: 30px;">Cập Nhật Thông Tin Cá Nhân</h2>
        
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form action="<c:url value='/profile'/>" method="post" enctype="multipart/form-data">
            <div style="text-align: center;">
                <c:if test="${not empty sessionScope.account.avatar}">
                    <img src="<c:url value='/image?fname=${sessionScope.account.avatar}'/>" alt="Avatar" class="avatar-preview">
                </c:if>
                <c:if test="${empty sessionScope.account.avatar}">
                    <img src="https://via.placeholder.com/150" alt="Avatar" class="avatar-preview">
                </c:if>
            </div>

            <div class="form-group">
                <label>Tên đăng nhập (Username):</label>
                <input type="text" class="form-control" value="${sessionScope.account.userName}" disabled>
            </div>
            
            <div class="form-group">
                <label>Email:</label>
                <input type="email" class="form-control" value="${sessionScope.account.email}" disabled>
            </div>

            <div class="form-group">
                <label>Họ và Tên (Full Name):</label>
                <input type="text" name="fullname" class="form-control" value="${sessionScope.account.fullName}" required>
            </div>

            <div class="form-group">
                <label>Số điện thoại:</label>
                <input type="text" name="phone" class="form-control" value="${sessionScope.account.phone}" required>
            </div>

            <div class="form-group">
                <label>Đổi Ảnh đại diện (Avatar):</label>
                <input type="file" name="image" class="form-control" accept="image/*">
            </div>

            <div style="display: flex; gap: 10px;">
                <a href="<c:url value='/waiting'/>" class="btn-update" style="background-color: #6c757d; text-align: center; text-decoration: none; display: inline-block;">Quay lại Trang chủ</a>
                <button type="submit" class="btn-update">Cập Nhật</button>
            </div>
        </form>
    </div>
</body>
</html>
