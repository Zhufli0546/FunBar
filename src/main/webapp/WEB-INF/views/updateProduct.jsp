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
.context {
 	overflow: hidden;		
}  

 img { 
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

<jsp:include page="admin_header.jsp" />

<jsp:useBean id="pb" scope="request" class="tw.FunBar.model.ProductBean" />

<!-- Content 區塊 -->
<div class="context">

<!--  <div>  -->
<!-- <figure> -->
<%-- 	<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />  --%>
<!-- </figure>  -->
<!--  </div>	  -->

<form method='POST' enctype="multipart/form-data" action="updateProduct">


<div>
<label for="productId">商品ID</label>
</div>
<div>
<input name="productId" value="${pb.productId}" type='text' disabled />
<input type="hidden" name="id" value="${pb.productId}" />
</div>


<div>
<label for="productNo">商品編號</label>
<div>
<input id="productNo" name="productNo" value="${pb.productNo}" type='text' disabled />
<input type="hidden" name="productNo" value="${pb.productNo}" />
</div>
</div>
	
<fieldset>
<div>
<label  for='productDetail'>商品說明</label>
<div>
<input autocomplete="off" name="productDetail" id="productDetail" value="${pb.productDetail}" type='text' />
</div>
</div>

<div>
<label for='productName'>商品名稱</label>
<div>
<input autocomplete="off" name="productName" id="productName" value="${pb.productName}" type='text'  />
</div>
</div>

<div>
<label  for="category">商品分類</label>
<div>
<select name="category">
<option>${pb.category}</option>
<option value="無酒精類">無酒精類</option>
<option value="酒器/酒杯">酒器/酒杯</option>
<option value="調酒器具">調酒器具</option>
<option value="下酒菜">下酒菜</option>	
</select>
</div>
</div>

<div>
<label for="unitPrice">單價</label>
<div>
<input autocomplete="off"  name="unitPrice" id="unitPrice" value="${pb.unitPrice}" type='text' disabled />
</div>
</div>

<div>
<label  for="unitPrice">折扣</label>
<div>
<input autocomplete="off" name="discount"  id="discount" value="${pb.discount}" type='text' />
</div>
</div>

<div>
<label  for="unitPrice">庫存數量</label>
<div>
<input autocomplete="off" name="stock"  id="stock" value="${pb.stock}" type='text' />

</div>
</div>


<div>
<label  for="productCover">商品圖片</label>
<div>
<input name="image"  value="${pb.productId}" type='file' />
</div>
</div>


<div>
<input type='submit' class='btn btn-primary' value="送出" />
</div>

</fieldset>
</form>
</div>

<jsp:include page="admin_footer.jsp" />

</body>
</html>