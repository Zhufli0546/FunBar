<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.orderBtn, .removeBtn {
	font-size: 18px;
	text-decoration: none;
	padding: 5px;
	background: #fff;
	border: 1px solid black;
	border-radius: 1px;
}

.removeBtn:hover {
	background: #eee;
}

.orderBtn:hover {
	background: #eee;
}

.add, .minus {
	padding: 0 5px;
	font-size: 18px;
	font-weight: bold;
	background-color: #02C874;
	border-radius: 2.5px;
	color: #fff;
}

.add:hover {
	background-color: #019858;
}

.minus:hover {
	background-color: #019858;
}

input{
outline:none;
}

</style>
<head>
<meta charset="UTF-8">
<title>show cart</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src=js/showCart.js></script>
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div class="container page">
		<div align="right" colspan="8" style="margin:1px 60px 0 0">
  		<a class="orderBtn" href="<c:url value='/deleteCartItem' />">清空購物車</a>
  		</div>
		<div class="table-responsive">
			<table class="table" style="margin: 20px 0">
				<thead>
					<tr>
						<th>商品示意圖</th>
						<th>商品名稱</th>
						<th>單價</th>
						<th>庫存</th>
						<th>數量</th>
						<th>折扣</th>
						<th>小計</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ci" items="${sessionScope.Cart.cartItems}"
						begin="0" step="1" varStatus="i">
						<tr>
							<td><img
								src="<c:url value='/ProductPictures/${ci.product.productId}' />"
								width="80px" height="120px"></td>
							<td>${ci.product.productName}</td>
							<td class="unit" data-product="${i.index}">${ci.product.unitPrice}</td>
							<td align="left" class="theStock" data-product="${i.index}" >${ci.product.stock}</td>
			
							<td>
								<button type="button" class="minus" data-product="${i.index}">-</button>
								<input id="count" type="text" maxlength="2" value="${ci.count}"
								size="2" class="num" data-product="${i.index}" /> <input
								class="pdid" type="hidden" value="${ci.product.productId}"
								data-product="${i.index}">
								<button type="button" class="add" data-product="${i.index}">+</button>
							</td>
							<td class="hallin" data-product="${i.index}">${ci.product.discount}</td>
							
					   		<td class="smallPrice pd"></td>
							<td>
							<input type="hidden" class="price" value="${ci.subtotal}"> 
							<a class="removeBtn" href=" <c:url value='/removeCartItem?productId=${ci.product.productId}' />">刪除</a>
							</td>

						</tr>
					</c:forEach>
					<tr style="text-align: right">
						<td align="right" colspan="8">總計:<span class="totalAmount"
							style="padding: 0 10px; color: #FF0088; font-size: 18px">${sessionScope.Cart.total}</span></td>
					</tr>
					<tr>
						<td align="right" colspan="8">
							<div class="col-sm-4 col-xs-12">
								<button id="buy" type="button" class="btn btn-info page-btn"
									data-toggle="modal" data-target="#createForm">結帳去</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>


	<!-- model -->
	<div class="modal fade" id="createForm"
		role="dialog" aria-labelledby="myModalLabel1" style="background:rgba(0,0,0,0.8)">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="padding:10px">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body" id="createForm">
					<div class="container page" style="margin-top:20px">								
							<table class="table" style="margin: 5px 0;">
								<thead>
									<tr>
										<th>商品名稱</th>
										<th>單價</th>
										<th>數量</th>
										<th>折扣</th>
										<th>小計</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ci" items="${sessionScope.Cart.cartItems}" begin="0" step="1" varStatus="i">
										<tr>
											<td class="pn"></td>
											<td class="pp"></td>
											<td class="pc" style="text-align:center;"></td>
											<td class="pddd"></td>
											<td class="st"></td>
										</tr>
									</c:forEach>
								</tbody>
								<tr>
									<td class="ta" align="right" colspan="8" style="color:#FF60AF;"></td>
								</tr>
							</table>
						  
						</div>
					</div>
						<form method="post" action="orderSetUp" style="padding:0 10px">
							<div><p>請填寫以下聯絡資料</p></div>
							<div>
								<label>姓名</label> 
								<input type="text" name="memberName" value="${sessionScope.member.memberName}"  class="orderN"/> 
							</div>
							<div>
								<label>手機</label>
								<input type="text" name="memberPhone" value="${sessionScope.member.memberPhone}" /> 
							</div>
							<div>
								<label>地址</label> 
								<input type="text" name="shippingAddress" value="${sessionScope.member.memberAddress}" />
							</div>
							<div>
								<label>備註</label>
								<input type="text" name="remark" placeholder="請填寫注意事項" />
							</div>
							<input type="submit" value="確認結帳"  class="btn btn-success pay" style="float:right"/>
							
						</form> 						
				</div>
				
			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->

<jsp:include page="footer.jsp" />
<script>
	$(document).ready(function() {
			$('#createForm').on('shown.bs.modal', function() {
				$(document).off('focusin.modal');
		});

		let todata;
		$("#buy").click(function() {
		  $.ajax({
			    url : "http://localhost:8080/FunBar/buyCartJson",
				method : "POST",
				dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(res) {
				let data = res;
				let totalAmount = 0;
				for (let i = 0; i < data.length; i++) {

				let productName = data[i].product.productName;
				$(".pn").eq(i).text(productName);
				console.log(productName);
				
				let unitPrice = data[i].product.unitPrice;
				let count = data[i].count;
				let discount = data[i].product.discount;
				$(".pp").eq(i).text(unitPrice);
				$(".pc").eq(i).text(count);
				$(".pddd").eq(i).text(discount);
				let subTotal = parseInt(unitPrice* count* discount/ 10);
				$(".st").eq(i).text(subTotal);
				console.log(subTotal);
				totalAmount += subTotal;
		}
				$(".ta").text("$"+ totalAmount);

		}
	})
		})
})
	</script>

</body>

</html>