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
<link href="<c:url value="/css/shoppingCart.css" />" rel="stylesheet">
</head>
<style>


</style>

<body>
<jsp:include page="header.jsp" />

<!-- Content 區塊 -->
<div class="row" style="float:left;margin:10px 0 0 10px">
<div class="col-md-3"  >
<div class="list-group" style="width:150px">
<a href="${pageContext.request.contextPath}/shoppingCart" class="list-group-item">所有商品</a>
<c:forEach var='category' items='${categoryList}' >
<a href="${pageContext.request.contextPath}/shoppingCart/${category}" class="list-group-item">${category}</a>
</c:forEach>
</div>
</div>
</div>


<div class="container page">
<c:forEach var="pb" items="${all}">
<div class="prodlist">
<p>${pb.productNo}</p> 
<p>${pb.productDetail}</p> 
<p class="prodtitle">${pb.productName}</p>
<figure>
	<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />
</figure>
<figcaption>
<p>建議售價: $${pb.unitPrice}</p>
<form class="form-group row" action="<c:url value='/cart' />" method="post">

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
<input type="hidden" name="productId" value="${pb.productId}">
<button type="submit" class="button-add">加入購物車</button>
</form>
</figcaption>

</div>	<!-- .prodlist -->
</c:forEach>
<a href="<c:url value='/showCart' />"><button class="btn btn-info">我的購物車</button></a>


</div> <!-- .container -->


<jsp:include page="footer.jsp" />

</body>
</html>