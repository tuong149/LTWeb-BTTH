<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - Danh sách sản phẩm/danh mục</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f8f9fa; padding: 20px; }
        .container { max-width: 1000px; margin: 0 auto; background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #333; }
        .grid-container { display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; margin-top: 30px; }
        .card { border: 1px solid #ddd; border-radius: 8px; padding: 15px; width: 250px; text-align: center; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .card img { max-width: 100%; height: 150px; object-fit: cover; border-radius: 5px; margin-bottom: 15px; }
        .card h3 { font-size: 18px; margin: 0 0 10px 0; color: #007bff; }
        .logout-btn { display: inline-block; padding: 10px 20px; background-color: #dc3545; color: white; text-decoration: none; border-radius: 5px; margin-bottom: 20px; float: right; }
        .welcome-msg { display: inline-block; font-size: 18px; margin-bottom: 20px; }
        .clearfix::after { content: ""; clear: both; display: table; }
    </style>
</head>
<body>
    <div class="container clearfix">
        <div class="welcome-msg">
            <c:if test="${not empty sessionScope.account}">
                Xin chào, <strong>${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.userName}</strong>!
            </c:if>
            <c:if test="${empty sessionScope.account}">
                Xin chào Khách! <a href="<c:url value='/login'/>">Đăng nhập ngay</a>
            </c:if>
        </div>
        
        <c:if test="${not empty sessionScope.account}">
            <a href="<c:url value='/logout'/>" class="logout-btn">Đăng xuất</a>
        </c:if>

        <div style="clear:both;"></div>
        
        <h1>Danh mục mua sắm</h1>
        
        <div class="grid-container">
            <c:forEach items="${cateList}" var="cate">
                <div class="card">
                    <c:url value="/image?fname=${cate.icon}" var="imgUrl"></c:url>
                    <c:if test="${not empty cate.icon}">
                        <img src="${imgUrl}" alt="${cate.name}"/>
                    </c:if>
                    <c:if test="${empty cate.icon}">
                        <img src="https://via.placeholder.com/200x150?text=No+Image" alt="No Image"/>
                    </c:if>
                    <h3>${cate.name}</h3>
                </div>
            </c:forEach>
            
            <c:if test="${empty cateList}">
                <p>Hiện chưa có danh mục sản phẩm nào!</p>
            </c:if>
        </div>
    </div>
</body>
</html>
