<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改商品資料</title>
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


}
</style>
<body>

<jsp:include page="admin_header.jsp" />

<!-- Content 區塊 -->
<div class="container page">

<div>
<figure>
	<img src="<c:url value='/getPicture/${pb.productCover}'/>" />
</figure>
</div>	

<form method='GET' class="form-horizontal" enctype="multipart/form-data">

<div class="">
<label class='' for="productNo">商品編號</label>
<div class=''>
<input id="productNo" value="${pb.productNo}" type='text' disabled class='' />
</div>
</div>
	
<fieldset>
<div class="">
<label class="" for='productName'>商品名稱</label>
<div class="">
<input id="productName" value="${pb.productName}" type='text'  class='' />
</div>
</div>

<div class="">
<label class="" for='productDetail'>商品說明</label>
<div class="">
<input id="productDetail" value="${pb.productDetail}" type='text' class='' />
</div>
</div>

<div class="">
<label class='' for="category">商品分類</label>
<div class=''>
<select name="category">
<option>"${pb.category}"</option>
<option value="無酒精類">無酒精類</option>
<option value="酒器">酒器</option>
<option value="下酒菜">下酒菜</option>	
</select>
</div>
</div>

<div class="">
<label class='' for="unitPrice">單價</label>
<div class="">
<input id="unitPrice" value="${pb.unitPrice}" type='text' disabled class='' />
</div>
</div>

<div class="">
<label class='' for="unitPrice">折扣</label>
<div class="">
<input id="discount" value="${pb.discount}" type='text' class='' />
</div>
</div>

<div class="">
<label class='' for="unitPrice">庫存數量</label>
<div class="">
<input id="stock" value="${pb.stock}" type='text'  class='' />
</div>
</div>

<div class="">
<label class='' for="productCover">商品圖片</label>
<div class='col-lg-10'>
<form:input id="productCover" path="productCover" type='file' class='form:input-large' />
</div>
</div>

<div class="">
<div class=''><input id="btnAdd" type='submit' class='btn btn-primary' value="修改" /></div>
</div>
</fieldset>
</form>
</div>

<jsp:include page="admin_footer.jsp" />

</body>
</html>