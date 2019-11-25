<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Product Management</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
</script>
</head>
<style>
.page {
	overflow: hidden;
}

.product-list table {
	padding: 20px;
	background-color: #272727;
}

.product-list th {
	padding: 10px 0;
	text-align: center;
	color: #fff;
	border-top: 1px solid #272727;
	border-bottom: 1px solid #272727;
}

.product-list td {
	padding: 10px 0;
	text-align: center;
	color: #000;
}

.product-list th {
	background-color: #272727;
	padding: 0 20px;
}

.product-list img {
	display: block;
	height: 120px;
	margin: 0 auto;
}

.button {
	margin: 0 auto;
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

.button-push{
	margin: 0 auto;
	padding: 5px 10px;
	background-color: #336666;
	color: #fff;
	outline: none;
	border-radius: 5px;
}

.button-push:hover{
	background-color: #fff;
	color: #336666;
	text-decoration: none;
}

.button-pull{
	margin: 0 auto;
	padding: 5px 10px;
	background-color: #7E3D76;
	color: #fff;
	outline: none;
	border-radius: 5px;
}

.button-pull:hover{
	background-color: #fff;
	color: #7E3D76;
	text-decoration: none;
}


</style>

<body>

	<jsp:include page="admin_header.jsp" />

	<!-- Content 區塊 -->

	<div class="container page" style="margin: 50px auto; width: 100%">
		<h1>所有商品管理</h1>
		<hr>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">照片</th>
					<th scope="col">ID</th>
					<th scope="col">編號</th>
					<th scope="col">名稱</th>
					<th scope="col">說明</th>
					<th scope="col">分類</th>
					<th scope="col">單價</th>
					<th scope="col">折扣</th>
					<th scope="col">庫存</th>
					<th scope="col">編輯</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pb" items="${showAllProduct}" begin="0" step="1" varStatus="i" >
					<tr>
						<th scope="row"><div style="text-align: center">
								<img src="<c:url value='/ProductPicture/${pb.productId}'/>"
									height="120px" />
							</div></th>
						<td>${pb.productId}</td>
						<td>${pb.productNo}</td>
						<td>${pb.productName}</td>
						<td>${pb.productDetail}</td>
						<td>${pb.category}</td>
						<td>$${pb.unitPrice}</td>
						<td>${pb.discount}</td>
						<td>${pb.stock}</td>
						<td>
							
							<c:if test="${pb.status=='0'}">
							<form method="post" class="form-group row" action="<c:url value='/pullProduct?id=${pb.productId}'/>">
									<input type="hidden" name="id" value="${pb.productId}" /> 
									<input type="submit" value="下架"  class="button-pull" onclick="return confirm('確定下架？')" />				
							</form>
							</c:if>
							<c:if test="${pb.status=='1'}">
							<form method="post" class="form-group row" action="<c:url value='pushProduct?id=${pb.productId}'/>">
								<input type="hidden" name="id" value="${pb.productId}" /> 
								<input type="submit" value="上架"  class="button-push" onclick="return confirm('確定重新上架？')"/>
							</form> 
							</c:if>
							
							

							<form method="get" class="form-group row" action="<c:url value='update?id=${pb.productId}'/>">
								<input type="hidden" name="id" value="${pb.productId}">
								<input type="submit" value="修改" class="button" />
							</form>
						</c:forEach>
						</td>
					</tr>
			
			</tbody>
		</table>
		
		<ul class="pagination justify-content-center" style="padding-bottom:20px">
				
			<c:forEach  begin="1" step="1" end="${listCount}" varStatus="i" >
				<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/showAllProduct?index=${i.index}">${i.index}</a></li>		
			</c:forEach>
			
		</ul>
	</div>

	<jsp:include page="admin_footer.jsp" />

</body>
</html>