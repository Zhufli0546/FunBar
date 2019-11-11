<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
a.orderBtn { text-decoration:none; padding: 5px; background: #fff; border: 1px solid black; border-radius: 1px;}
.orderBtn:hover { background: #eee;}
</style>
<head>
<meta charset="UTF-8">
<title>show cart</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
<script>
$(document).ready(function(){	
	//數量減少
	 $(".minus").click(function(){   	
	 	let index = $(this).data("product");
	  	var num=$(this).siblings(".num").val();
	  	num--;
	  	$(this).siblings(".num").val(num<1?1:num);
	  	let unitPrice = $(".price").eq(index).val();
	        
	 	 if(num<1){
	       num = 1;
	  	}
	   	let total = unitPrice*num;
	   	console.log(unitPrice);
	   	$(".pd").eq(index).text(total);
	   	$(".totalAmount")
	   	
})

		//數量增加
	    $(".add").click(function(){
	    	let index = $(this).data("product");
	    	console.log(".add data-product 索引:" + index);

	    	let num = $(this).siblings(".num").val();
	        num++;
	        $(this).siblings(".num").val(num>50?50:num);
	        
	        // 單價
	        let unitPrice = $(".price").eq(index).val();
	        let total = unitPrice*num;
	        
	        $(".pd").eq(index).text(total);
	    })
	
		//input欄位輸入數量
	    $('input').blur(function(){
			let index = $(this).data("product");			
			let unitPrice = $(".price").eq(index).val();		
			var num = $(this).val();
			var total;
			if(num>50){
				alert("數量不得超過50份!");
				$(this).val(50);   //當下的input
				total = unitPrice*50;
				$(".pd").eq(index).text(total);
			}else if(num<1){
				alert("數量不得小於1!");
				$(this).val(1);
				total = unitPrice*1;
				$(".pd").eq(index).text(total);
			}else{
				$(this).val();
	        	total = unitPrice*num;        
	        	$(".pd").eq(index).text(total);
	        
			}
	  })
	
	
	
// 	 function AllPrice(){
// 	    var all_price=0;

	   	   
// 	    //取得總計
// 	    var len=sp.parents("tr").find(".smallPrice").html().length;
// 	        all_price += parseFloat(sp.parents("tr").find(".smallPrice").html().substr(1,len));
// 	   }
	   
// 	    $(".totalAmount").html( all_price.toFixed(2));
// 	} 
			
	
})


</script>
</head>

<body>
<jsp:include page="header.jsp" />

<!-- Content 區塊 -->
<div class="container page">


<c:if test="${cart.cartItems ==null}">
<div>
<h1>沒東西</h1>
</div>
</c:if>



<c:if test="${cart.cartItems !=null }">
	<div class="row">
		<div class="col-sm-offset-10 col-sm-2">
			<a class="orderBtn" href="<c:url value='/deleteCartItem' />">清空購物車</a>
		</div>
	</div>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>產品示意圖</th>
					<th>產品名稱</th>
					<th>單價</th>
					<th>數量</th>
					<th>小計</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ci" items="${cart.cartItems}" begin="0" step="1" varStatus="i">
				<tr>
					<td>
						<img src="<c:url value='/ProductPictures/${ci.product.productId}' />" width="50px" height="100px">
					</td>
					<td>${ci.product.productName}</td>
					<td>${ci.product.unitPrice}</td>
					<td><button type="button"  class="minus" data-product="${i.index}">⬇</button>
						<input id="n" type="text" value="${ci.count}" size="2" class="num" data-product="${i.index}"  /> 
						<button type="button" class="add" data-product="${i.index}"> ⬆</button>
					</td>
					<td class="smallPrice pd">${ci.subtotal}</td>
 						
					<td>
						<input type="hidden" class="price" value="${ci.subtotal}"> 
						<a class="removeBtn"  href=" <c:url value='/removeCartItem?productId=${ci.product.productId}' />">刪除</a>
					</td>

				</tr>
				</c:forEach>
				<tr>
					<td align="right" colspan="6" class="totalAmount">總計:${cart.total}</td>
				</tr>
				<tr>
					<td align="right" colspan="6">
						<form action="<c:url value='/shoppingcart/InsertOrderServlet' />" method="post">
							<label for="address" class="col-sm-4 col-xs-12">地址:</label>
							<div class="col-sm-4 col-xs-12">
								<input type="text" class="form-control" id="address" name="address" placeholder="請輸入地址" required>
							</div>
							<div class="col-sm-4 col-xs-12">
								
								<button type="submit" class="btn btn-success">結帳去</button>
							</div>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</c:if>
</div>

<jsp:include page="footer.jsp" />


</body>

</html>