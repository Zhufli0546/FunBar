<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有商品管理</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
.page {
	overflow:hidden;
}

.product-list table{
	padding: 20px;
}

.product-list th, td{
	padding: 10px 0;
	text-align: center;
	border-top:1px solid #ebebeb;
    border-bottom: 1px solid #ebebeb;
}

.product-list th{
	background-color: #ebebeb;
	padding: 0 20px;
}

.product-list img {
	display: block;
	width: 100px;
	height: 120px;
	margin: 0 auto;
}

.button {
	margin: 0 auto;
	padding:5px 10px;
	background-color: #01B468;
	color: #fff;
	outline: none;
	border-radius: 5px;	
	
}

.button:hover{
		background-color:#fff;
		color:#019858;
		text-decoration:none;
}

</style>

<body>

<jsp:include page="admin_header.jsp" />

<!-- Content 區塊 -->

<div class="container page" style="margin:50px auto; width:100%">
<h1>所有商品管理</h1>
<hr>
<table class="product-list">
<tr>
<th>照片<th>ID<th>編號<th>名稱<th>說明<th>分類<th>單價<th>折扣<th>庫存<th>編輯
<c:forEach var="pb" items="${all}">
<tr>
<td> <img src="<c:url value='/ProductPicture/${pb.productId}'/>"  /> 
<td>${pb.productId}
<td>${pb.productNo}
<td>${pb.productName}
<td>${pb.productDetail}
<td>${pb.category}
<td>$${pb.unitPrice}
<td>${pb.discount}
<td>${pb.stock}
<td>
<form method="post" class="form-group row" action="<c:url value='/deleteProduct?id=${pb.productId}'/>" >
<input type="submit" value="刪除" class="button"/>
<input type="hidden" value="${pb.productId}" name="productId"  />
</form>

<form method="get" class="form-group row" action="<c:url value='update?id=${pb.productId}'/>" >
<input type="submit" value="修改" class="button" />
<input type="hidden" name="id" value="${pb.productId}" >
</form>

</c:forEach>
</table>
</div>

<jsp:include page="admin_footer.jsp" />

</body>
</html>