<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>顯示所有商品</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/css/shoppingCart.css" />" rel="stylesheet">
</head>



<body>

<jsp:include page="admin_header.jsp" />

<!-- Content 區塊 -->

<div class="container page">
	<c:forEach var="pb" items="${all}">
<div class="prodlist">
<p>${pb.productId}</p>
<p>${pb.productNo}</p>
<p>${pb.productDetail}</p>
<p class="prodtitle">${pb.productName}</p>

<figure>
	<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />
</figure>


<p>分類: ${pb.category}</p>
<p>建議售價: $${pb.unitPrice}</p>
<p>折扣:${pb.discount}</p>
<p>庫存數量:${pb.stock}</p>


<form method="post" class="form-group row" action="<c:url value='/deleteProduct?id=${pb.productId}'/>" >
<input type="submit" value="刪除" class="button"/>
<input type="hidden" value="${pb.productId}" name="productId"  />
</form>

<%-- <p><a href="<c:url value='/update?id=${pb.productId}'/>" class="button">修改</a></p> --%>


<form method="get" class="form-group row" action="<c:url value='update?id=${pb.productId}'/>" >
<input type="submit" value="修改" class="button" />
<input type="hidden" name="id" value="${pb.productId}" >
</form>



</div>
</c:forEach>
</div>


<jsp:include page="admin_footer.jsp" />

</body>
</html>