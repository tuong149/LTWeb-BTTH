<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>">
    <style>
        .icon-img {
            max-width: 80px;
            height: auto;
            border-radius: 4px;
        }
        .action-links a {
            margin: 0 5px;
            font-size: 14px;
            padding: 6px 12px;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h1>Quản Trị Sản Phẩm</h1>
        <div>
            <c:if test="${not empty sessionScope.account}">
                <span>Admin: <strong>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</strong></span>
            </c:if>
            <a href="<c:url value='/admin/category/list'/>" class="btn" style="margin-left: 20px; color: white; border: 1px solid white;">QL Danh mục</a>
            <a href="<c:url value='/logout'/>" class="btn btn-danger" style="margin-left: 10px;">Đăng xuất</a>
        </div>
    </div>

    <div class="container">
        <div class="flex-between" style="margin-top: 20px;">
            <h2>Danh sách sản phẩm</h2>
            <a href="<c:url value='/admin/product/add'/>" class="btn btn-success">+ Thêm mới</a>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th width="5%">STT</th>
                    <th width="15%">Hình ảnh</th>
                    <th width="25%">Tên sản phẩm</th>
                    <th width="15%">Giá</th>
                    <th width="15%">Danh mục</th>
                    <th width="25%">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${prodList}" var="prod" varStatus="STT">
                    <tr>
                        <td>${STT.index + 1}</td>
                        <td>
                            <c:url value="/image?fname=${prod.images}" var="imgUrl"></c:url>
                            <c:if test="${not empty prod.images}">
                                <img src="${imgUrl}" alt="icon" class="icon-img"/>
                            </c:if>
                            <c:if test="${empty prod.images}">
                                <span style="color: #999; font-style: italic;">Chưa có ảnh</span>
                            </c:if>
                        </td>
                        <td style="font-weight: 500;">${prod.productName}</td>
                        <td>${prod.price} ${prod.unit != null ? prod.unit : ''}</td>
                        <td>${prod.category != null ? prod.category.categoryname : 'N/A'}</td>
                        <td class="action-links">
                            <a href="<c:url value='/admin/product/edit?id=${prod.productId}'/>" class="btn btn-primary">Sửa</a>
                            <a href="<c:url value='/admin/product/delete?id=${prod.productId}'/>" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?');">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
                
                <c:if test="${empty prodList}">
                    <tr>
                        <td colspan="6" class="text-center">Chưa có sản phẩm nào. Hãy thêm mới!</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>
