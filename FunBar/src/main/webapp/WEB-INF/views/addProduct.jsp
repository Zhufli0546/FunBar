<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增產品資料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<style>
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

.prodlist .prodtitle {
	height: 25px;
}

.prodlist img {
	display: block;
	width: 50%;
	height: 200px;
	margin: 0 auto;
}

.btnMargin {
	margin-top: 10px;
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
<body>

	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div class="container page">
	
	<form:form method='POST' modelAttribute="productBean" class='form-horizontal'
			enctype="multipart/form-data">
		
			<fieldset>
				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='productName'>
						商品名稱
					</label>
					<div class="col-lg-10">
						<form:input id="productName" path="productName" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-lg-2 col-lg-2" for='productDetail'>
						商品說明
					</label>
					<div class="col-lg-10">
						<form:input id="productDetail" path="productDetail" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="category">
						商品分類
					</label>
					<div class='col-lg-10'>
						<form:select path="category">
							<form:option value="無酒精類">無酒精類</form:option>
							<form:option value="酒器">酒器</form:option>
							<form:option value="下酒菜">下酒菜</form:option>	
						</form:select>
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="unitPrice">
						單價
					</label>
					<div class='col-lg-10'>
						<form:input id="unitPrice" path="unitPrice" type='text'
							class='form:input-large' />
					</div>
				</div>
				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productNo">
						商品編號
					</label>
					<div class='col-lg-10'>
						<form:input id="productNo" path="productNo" type='text'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<label class='control-label col-lg-2 col-lg-2' for="productCover">
						商品圖片
					</label>
					<div class='col-lg-10'>
						<form:input id="productCover" path="productCover" type='file'
							class='form:input-large' />
					</div>
				</div>

				<div class="form-group">
					<div class='col-lg-offset-2 col-lg-10'>
						<input id="btnAdd" type='submit' class='btn btn-primary'
							value="送出" />
					</div>
				</div>
			</fieldset>
		</form:form>
</div>
	<jsp:include page="footer.jsp" />

</body>
</html>