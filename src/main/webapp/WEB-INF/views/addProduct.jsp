<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品上架</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="js/addProduct.js"></script> 


<style>
.page {
	overflow: hidden;
	padding: 30px 20px;
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

.button {
	margin: 10px 15px;
	padding: 5px 10px;
	background-color: #272727;
	color: #fff;
	outline: none;
	border-radius: 5px;
}

.button:hover {
	background-color: #fff;
	color: #272727;
	text-decoration: none;
}

@media ( max-width : 960px) {
	.prodlist {
		width: 31%;
	}
}

@media ( max-width : 600px) {
	.prodlist {
		width: 48%;
	}
}
</style>
</head>

<body>


	<jsp:include page="admin_header.jsp" />

	<!-- Content 區塊 -->

	<div class="container page" style="margin: 20px">
		<h1>新增商品</h1>
		<hr>
		<form:form method='POST' modelAttribute="productBean"
			class='form-horizontal' enctype="multipart/form-data">
			<fieldset>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productNo">商品編號</label>
					<form:input autocomplete="off" id="productNo" path="productNo" type='text' class='form:input-large' />
					<span id="msgNo"></span>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='productName'>商品名稱</label>
					<form:input autocomplete="off" id="productName" path="productName" type='text' class='form:input-large' />
					<span id="msgName"></span>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='productDetail'>商品說明</label>
					<form:input autocomplete="off" id="productDetail" path="productDetail" type='text' class='form:input-large' />
					<span id="msgDetail"></span>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">商品分類</label>
					<form:select path="category">
						<form:option value="下酒菜">下酒菜</form:option>
						<form:option value="啤酒與低酒精">啤酒與低酒精</form:option>
						<form:option value="威士忌">威士忌</form:option>
						<form:option value="無酒精">無酒精</form:option>
						<form:option value="蘭姆酒">蘭姆酒</form:option>
						<form:option value="清酒與燒酒">清酒與燒酒</form:option>
						<form:option value="葡萄酒">葡萄酒</form:option>
						<form:option value="調酒器具">調酒器具</form:option>
						<form:option value="酒器與酒杯">酒器與酒杯</form:option>
					</form:select>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="unitPrice">單價</label>
					<form:input autocomplete="off" id="unitPrice" path="unitPrice" type='text' class='form:input-large' />
					<span id="msgPrice"></span>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="discount">折扣</label>
					<form:input autocomplete="off" id="discount" path="discount" type='text' class='form:input-large' />
					<span id="msgDisc"></span>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="discount">庫存數量</label>
					<form:input autocomplete="off" id="stock" path="stock" type='text' class='form:input-large' />
					<span id="msgStock"></span>
				</div>


				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productCover">商品圖片</label>
					<form:input id="productCover" path="productCover" type='file' class='form:input-large' />
				</div>

				<div class="form-group">
					<input type='submit' class='button' value="送出" />
				</div>
			</fieldset>
		</form:form>
	</div>

	<jsp:include page="admin_footer.jsp" />

</body>
</html>