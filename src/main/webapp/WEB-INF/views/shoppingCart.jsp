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

<body>

	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->

	<div class="container page">
		 		<c:forEach var="t" items="${all}">
		<div class="prodlist">
			<p class="prodtitle">${t.productName}</p>
			<figure>
				<img src="<c:url value='/${t.productImage}'/>" />
			</figure>
			<figcaption>
				<p>建議售價: $${t.unitPrice}</p>
				<form class="form-group row"
					action="<c:url value='/shoppingcart/InsertCartItemServlet' />"
					method="post">
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
					<input type="hidden" name="prod_id" >
					<button type="submit" class="btn btn-success btnMargin">加入購物車</button>
				</form>
			</figcaption>

		</div>
		</c:forEach>
	</div>


	<jsp:include page="footer.jsp" />

</body>
</html>