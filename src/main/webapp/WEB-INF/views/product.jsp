<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Product Info</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/product.css" />">

</head>
<body>
	<jsp:include page="header.jsp" />


	<!-- content區塊 -->
	<div class="page">
		<div class="row" style="float: left; margin: 50px">
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
			</div>
		</div>

		<div class="prodBlock">
			<div class="prodImg" style="width:250px;height:300px">
				<img style="display:block;height:300px;margin:auto;"
					src="<c:url value='/ProductPicture/${pb.productId}'/>" />
			</div>

			<div class="intro">

				<div>
					<p style="font-size: 18px; padding: 10px 5px; color: #000">商品名稱:
						${pb.productName}</p>
				</div>
				<div>
					<p style="font-size: 18px; padding: 10px 5px; color: #000">商品說明:
						${pb.productDetail}</p>
				</div>
				<div>
					<p style="font-size: 18px; padding: 10px 5px; color: #000">
						建議售價: <span style="color: #FF44AA; font-weight: bold">$
							${pb.unitPrice}</span>
					</p>
				</div>
				<div>
					<p style="font-size: 18px; padding: 10px 5px; color: #000">
						折扣: <span style="font-weight: bold; color: #CE0000;">${pb.discount}</span>
					</p>
				</div>
				<div>
					<p style="font-size: 18px; padding: 10px 5px; color: #000">庫存:
						${pb.stock}</p>
				</div>

				<div>
					<label for="selectCount"
						style="font-size: 18px; padding: 10px 5px; color: #000">購買數量:</label>
					<select class="selectCount" id="selectCount" name="count"
						data-product="${i.index}">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select> 
					<input class="pdid" type="hidden" name="productId" value="${pb.productId}">
					<div style="float:right;margin-right:10px">
<button type="button" class="btn button-add" data-product="${i.index}" style="margin:10px 0;padding:5px 10px;background-color:#019858;color: #fff;border-radius:5px;"
>Add to Cart</button></div>
				</div>

				<div id="snackbar">已加入購物車</div>


			</div>
			<!-- .intro -->
		</div>
		<!-- .prodBlock -->

		<div align="center" colspan="8">
			<a href="<c:url value='/shoppingCart' />"><button class="btn-back">Back to shop</button></a>
 			<a href="<c:url value='/showCart' />"><button class="btn btn-info">Go to pay</button></a>
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
			// 加入購物車失敗 /cart 會回傳 1
			let check = 0;
			if(data.status!=null) {
				console.log(data.status);
				console.log(data.status[1]);
				check = data.status[1];
			} else if(data.redirect!=null) {
				window.location.href = "http://localhost:8080/FunBar/signin"; 
			}
			
			if(check) {
				alert("加入購物車失敗");
			} else {
				myFunction();
			}
		}
	})
})
</script>

</body>
</html>