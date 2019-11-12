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
#snackbar {
	visibility: hidden;
	min-width: 250px;
	margin-left: -125px;
	background-color: #333;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	padding: 16px;
	position: fixed;
	z-index: 1;
	left: 50%;
	bottom: 30px;
	font-size: 17px;
}

#snackbar.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@
-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>



<body>
	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div class="container" style="margin-top: 150px">
		<div class="row" style="float: left">
			<div class="col-md-3">
				<div class="list-group" style="width: 150px">
					<a href="${pageContext.request.contextPath}/shoppingCart"
						class="list-group-item">所有商品</a>
					<c:forEach var='category' items='${categoryList}'>
						<a
							href="${pageContext.request.contextPath}/shoppingCart/${category}"
							class="list-group-item">${category}</a>
					</c:forEach>
				</div>
			</div>
		</div>


		<div class="row">
			<c:forEach var="pb" items="${all}" begin="0" step="1" varStatus="i">
				<div class="prodlist">
					<p>${pb.productNo}</p>
					<p>${pb.productDetail}</p>
					<p class="prodtitle">${pb.productName}</p>
					<figure>
						<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />
					</figure>
					<figcaption>
						<p>建議售價: $${pb.unitPrice}</p>
						

							<label for="selectCount" class="col-sm-6 col-xs-12">購買數量:</label>
							<div class="col-sm-6 col-xs-12">
								<select class="form-control selectCount" name="count">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
							<input class="pdid" type="hidden" name="productId"
								value="${pb.productId}">
							<button type="button" class="button-add" data-product="${i.index}" >加入購物車</button>
							<div id="snackbar">已加入購物車</div>


					
					</figcaption>

				</div>
				<!-- .prodlist -->
			</c:forEach>
			<a href="<c:url value='/showCart' />"><button
					class="btn btn-info">我的購物車</button></a>


		</div>
	</div>
	<!-- .container -->


	<jsp:include page="footer.jsp" />
	<script>
	function myFunction() {
		var x = document.getElementById("snackbar");
			x.className = "show";
			setTimeout(function() {
				x.className = x.className.replace("show", "");
			}, 1000);
 		}
	
		// Test For Click Event
		$(".button-add").click(function() {
			let index = $(this).data("product");
			console.log("btn index:" + index);
			myFunction();
			
			var url = "/FunBar/";
			$.ajax({
				url : "http://localhost:8080" + url + "cart",
				data:{
					count:$(".selectCount").eq(index).val(),
					productId:$(".pdid").eq(index).val()
				},
				type:"POST",
				dataType:"JSON",
				success:function(data){
					console.log("success");
				}
			})
		})
	</script>
</body>
</html>