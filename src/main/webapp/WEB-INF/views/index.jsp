<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>Home</title>
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="<c:url value="/css/hotProduct.css" />" rel="stylesheet">

</head>

<body class="animsition">

	<!-- Header -->
	<jsp:include page="header.jsp" />



	<!-- Slide1 輪播 -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item1-slick1" style="background-image: url(images/slide1-01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
							data-appear="fadeInDown">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" style="font-family: 'Sarina', cursive;" data-appear="fadeInUp">
							Fun Bar
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="zoomIn">
							<!-- Button1 -->
							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Look Menu
							</a>
						</div>
					</div>
				</div>

				<div class="item-slick1 item2-slick1" style="background-image: url(images/slides-02.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="rollIn">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" style="font-family: 'Sarina', cursive;"
							data-appear="lightSpeedIn">
							Fun Bar
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="slideInUp">
							<!-- Button1 -->
							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Look Menu
							</a>
						</div>
					</div>
				</div>

				<div class="item-slick1 item3-slick1" style="background-color: black;">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
							data-appear="rotateInDownLeft">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" style="font-family: 'Sarina', cursive;"
							data-appear="rotateInUpRight">
							Fun Bar
						</h2>

						<!-- <div class="wrap-btn-slide1 animated visible-false" data-appear="rotateIn">
							Button1
							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Look Menu
							</a>
						</div> -->
					</div>
				</div>

			</div>

			<div class="wrap-slick1-dots"></div>
		</div>
	</section>

	<!-- Blog -->
	<section class="page">
	
	<h2>
	最新商品
	</h2>
	
	
		<div class="row">
			<c:forEach var="pb" items="${all}" begin="0" step="1" varStatus="i">
				<div class="prodlist">
					<p>${pb.productDetail}</p>
					<p class="prodtitle">${pb.productName}</p>
					<figure>
						<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />
					</figure>
					<figcaption>
						<p>建議售價:<span style="color:#FF44AA;font-weight:bold">$ ${pb.unitPrice}</span></p>
						<p>折扣：<span style="font-weight:bold;color:	#CE0000;">${pb.discount}</span></p>
						<div>
						<label for="selectCount" class="">購買數量:</label>
								<select class="selectCount" id="selectCount" name="count" data-product="${i.index}">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
						</div>
						
							<input class="pdid" type="hidden" name="productId" value="${pb.productId}">
							<button type="button" class="button-add" data-product="${i.index}">加入購物車</button>
							<div id="snackbar">已加入購物車</div>	
					</figcaption>

				</div>
				
			</c:forEach>
		</div>
		
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script>
	<!--購物車jQuery -->
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