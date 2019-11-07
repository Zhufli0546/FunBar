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


<body>
<jsp:include page="header.jsp" />

<!-- Content 區塊 -->

<div class="container page">

<div class="row" style="float:right">
<div class="col-lg-3">

<a href="${pageContext.request.contextPath}/shoppingCart" class="list-group-item">所有商品</a>
<c:forEach var='category' items='${categoryList}' >
<a href="${pageContext.request.contextPath}/shoppingCart/${category}" class="list-group-item">${category}</a>
</c:forEach>

</div>
</div>


<c:forEach var="pb" items="${all}">
<div class="prodlist">
<p>${pb.productNo}</p> 
<p>${pb.category}</p>
<p>${pb.productDetail}</p> 
<p class="prodtitle">${pb.productName}</p>
<figure>
	<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />
</figure>
<figcaption>
<p>建議售價: $${pb.unitPrice}</p>
<form class="form-group row" action="<c:url value='' />" method="post">
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

<button type="submit" class="button-add">加入購物車</button>
</figcaption>

</div>	<!-- .prodlist -->
</c:forEach>
<button type="submit" class="button-confirm">確認訂單</button>
</form>
</div> <!-- .container -->


<jsp:include page="footer.jsp" />

</body>
</html>