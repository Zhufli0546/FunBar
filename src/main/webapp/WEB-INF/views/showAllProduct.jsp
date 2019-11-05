<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示所有商品</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/css/shoppingCarts.css" />" rel="stylesheet">
</head>
<style>
* {
	font-family: 微軟正黑體;
}

.page {overflow: hidden;}

.prodlist {
	float: left;
	width: 18%;
	min-height: 360px;
	padding: 5px;
	text-align: center;
	margin: 0 auto;
	border: 1px dashed black;
	margin: 1%;
}

.jumbotron {
	position: relative;
	padding: 20px;
}

.jumbotron .username {
	position: absolute;
	right: 10px;
	bottom: 2.5px;
}

.prodlist {
	float: left;
	width: 18%;
	min-height: 360px;
	padding: 5px;
	text-align: center;
	margin: 0 auto;
	border: 1px dashed black;
	margin: 1%;
}

.prodlist .prodtitle {
	height: 25px;
}

.prodlist img {
	display: block;
	width: 50%;
	height: 200px;
	margin: 0 auto;
}

.btnMargin {margin-top: 10px;}


</style>
<body>

<jsp:include page="admin_header.jsp" />

<!-- Content 區塊 -->

<div class="container page">
	<c:forEach var="pb" items="${all}">
<div class="prodlist">

<p>${pb.productNo}</p>
<p>${pb.productDetail}</p>
<p class="prodtitle">${pb.productName}</p>

<figure>
	<img src="<c:url value='/getPicture/${pb.productCover}'/>" />
</figure>

<figcaption>

<p>建議售價: $${pb.unitPrice}</p>
<p>折扣:${pb.discount}</p>
<p>庫存數量:${pb.stock}</p>

<div>
<p><a href="<spring:url value='pb?id=${pb.productId}'/>" class="btn btn-success btnMargin">修改</a></p>

</div>

<form method="post" class="form-group row" action="<c:url value='/deleteProduct' />" >
<input type="submit" value="刪除" clas="btn btn-success btnMargin"/>
<input type="hidden" value="${pb.productId}" name="productId"  />
</form>

</figcaption>

</div>
</c:forEach>
</div>


<jsp:include page="admin_footer.jsp" />

</body>
</html>