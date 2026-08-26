<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách danh mục</title>
    <!-- Add some basic styling or bootstrap link if needed -->
    <style>
        table { border-collapse: collapse; width: 80%; margin: 20px auto; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
        th { background-color: #f2f2f2; }
        img { max-width: 100px; height: auto; }
        .center { display: inline-block; margin: 0 5px; text-decoration: none; padding: 5px 10px; background-color: #007bff; color: white; border-radius: 3px;}
        .center.delete { background-color: #dc3545; }
        .add-btn { display: block; width: 150px; text-align: center; margin: 20px auto; padding: 10px; background-color: #28a745; color: white; text-decoration: none; border-radius: 5px;}
    </style>
</head>
<body>
    <h2 style="text-align:center;">Danh sách danh mục</h2>
    <a href="<c:url value='/admin/category/add'/>" class="add-btn">Thêm mới</a>
    
    <table>
        <thead>
            <tr>
                <th>STT</th>
                <th>Hình ảnh</th>
                <th>Tên danh mục</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${cateList}" var="cate" varStatus="STT">
                <tr>
                    <td>${STT.index + 1}</td>
                    <td>
                        <c:url value="/image?fname=${cate.icon}" var="imgUrl"></c:url>
                        <c:if test="${not empty cate.icon}">
                            <img src="${imgUrl}" alt="icon"/>
                        </c:if>
                    </td>
                    <td>${cate.name}</td>
                    <td>
                        <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>" class="center">Sửa</a>
                        <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>" class="center delete" onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
