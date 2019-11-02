<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購物區</title>
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
	font-weight:bold;
	color:#000;
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

<jsp:include page="header.jsp" />

<!-- Content 區塊 -->

<div class="container page">
	<c:forEach var="pb" items="${all}">
<div class="prodlist">

<p>${pb.productNo}</p> 
<p>${pb.productDetail}</p> <!--商品說明 -->
<p class="prodtitle">${pb.productName}</p>

<figure>
	<img src="<c:url value='/getPicture/${pb.productCover}'/>" />
</figure>

<figcaption>
<p>建議售價: $${pb.unitPrice}</p>
<form class="form-group row" action="<c:url value='/shoppingcart/InsertCartItemServlet' />" method="post">
<label for="selectCount" class="col-sm-6 col-xs-12">購買數量:</label>
<div class="col-sm-6 col-xs-12">

<select class="form-control" id="selectCount" name="count">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
</select>
</div>

<button type="submit" class="btn btn-success btnMargin">加入購物車</button>
</form>
</figcaption>

</div>
</c:forEach>
</div>


<jsp:include page="footer.jsp" />

</body>
</html>