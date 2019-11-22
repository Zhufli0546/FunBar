<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Center</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/shoppingCart.css" />">
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div class="container" style="margin-top: 150px">
		<div class="row" style="float: left">
			<div class="col-md-3">
				<div class="list-group" style="width: 150px">
					<a href="${pageContext.request.contextPath}/shoppingCart"
						class="list-group-item">All Products</a>
					<c:forEach var='category' items='${categoryList}'>
						<a
							href="${pageContext.request.contextPath}/shoppingCart/${category}"
							class="list-group-item">${category}</a>
					</c:forEach>
				</div>
				<div style="margin-top: 5px">
					<a href="<c:url value='/showCart' />"><button
							class="btn btn-info">My Cart</button></a>
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<c:forEach var="pb" items="${all}" begin="0" step="1" varStatus="i">
			<div class="prodlist">
				<p>${pb.productDetail}</p>
				<p class="prodtitle">${pb.productName}</p>
				<figure>
					<a href="<c:url value='/product?id=${pb.productId}' />""> <img
						src="<c:url value='/ProductPicture/${pb.productId}'/>" />
					</a>
				</figure>
				<p>
					Unit Price:<span style="color: #FF44AA; font-weight: bold">$
						${pb.unitPrice}</span>
				</p>
				<p>
					discount：<span style="font-weight: bold; color: #CE0000;">${pb.discount}</span>
				</p>
			</div>
			<!-- .prodlist -->
		</c:forEach>
	</div>
	<!-- .container -->


	<jsp:include page="footer.jsp" />

</body>
</html>