<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.removeBtn { 
	text-decoration:none; 
	padding: 5px; 
	background: #fff; 
	border: 1px solid black; 
	border-radius: 1px;
	}
.removeBtn:hover { 
	background: #eee;
	}
</style>
<head>
<meta charset="UTF-8">
<title>show cart</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
<script>
$(document).ready(function(){	
	
	totalPrice = 0 ;
	  for(let i = 0 ;i<$(".pd").length;i++){
	    	unitPrice = $(".unit").eq(i).text();
	    	var disc=$(".hallin").eq(i).text(); //折扣
	    	var dec = disc/10;
	    	
	    	number = $(".num").eq(i).val();
	    	
	    	subTotal = unitPrice*number*dec;
	    	$(".pd").eq(i).text(subTotal);
	    	totalPrice = totalPrice+subTotal;
	    }
	  	
	  	 $(".totalAmount").text(totalPrice.toFixed(0));
	  	
	  	
	
	
		var totalPrice ;
	
	//數量減少
	 $(".minus").click(function(){   	
	 	var index = $(this).data("product");
	  	var num=$(this).siblings(".num").val();
	  	num--;
	  	$(this).siblings(".num").val(num<1?1:num);
	  	var unitPrice=$(".unit").eq(index).text(); //單價
	  	var disc=$(".hallin").eq(index).text(); //折扣
	  	var dec = disc/10;
	  	  		  	
	  	if(num<1){
	  		alert('不要再按了！哪有人買零個的辣!');
	  		num=1;
	  	}
	  	//小計	  
	  	var smallPrice = unitPrice*num*dec;  	  	
	  	$(".pd").eq(index).text(smallPrice);
	  	
	    //總計  
        totalPrice = 0;
        for(let i = 0 ;i<$(".pd").length;i++){
	    	unitPrice = $(".unit").eq(i).text();
	    	var disc=$(".hallin").eq(i).text();
	    	var dec = disc/10;
	    	number = $(".num").eq(i).val();
	    	
	    	subTotal = unitPrice*number*dec;
	    	totalPrice = totalPrice+subTotal;
	    	
	    	var url="/FunBar/"
	   		$.ajax({
	   			url:"http://localhost:8080" + url + "changecart",
	   			data:{
	   				count:number,
	   				productId:$(".pdid").eq(i).val()
	   			},
	   			type:"POST",
	   			dataType:"JSON",
	   			success:function(){
	   			}
	   		})
	    }  	
	  	 $(".totalAmount").text(totalPrice.toFixed(0));
	  	   	
})

		//數量增加
	    $(".add").click(function(){
	    	var index = $(this).data("product");
	    	console.log(".add data-product 索引:" + index);
	    	var num = $(this).siblings(".num").val();
	        num++;
	        $(this).siblings(".num").val(num>50?50:num);
	        var unitPrice = $(".unit").eq(index).text(); 
	        var disc=$(".hallin").eq(index).text(); //折扣
	        var dec = disc/10;
	        	
	        if(num>50){
	        	alert("數量不得超過50份！");
	        }
	              
	        var smallPrice = (unitPrice*num)*dec;    
	        $(".pd").eq(index).text(smallPrice);
	        
	        
	         //總計
	         totalPrice = 0;
	        	for(let i = 0 ;i<$(".pd").length;i++){
		    	unitPrice = $(".unit").eq(i).text();
		    	var disc=$(".hallin").eq(i).text();
		    	var dec = disc/10;
		    	
		    	number = $(".num").eq(i).val();
		    	
		    	subTotal = unitPrice*number*dec;
		    	totalPrice = totalPrice+subTotal;
		  
		    	
		    	var url="/FunBar/";
			   		$.ajax({
			   			url:"http://localhost:8080" + url + "changecart",
			   			data:{
			   				count:number,
			   				productId:$(".pdid").eq(i).val(),
			   			},
			   			type:"POST",
			   			dataType:"JSON",
			   			success:function(){
			   				console.log("success");
			   			}
			   		})
		    }	  	
	        	$(".totalAmount").text(totalPrice.toFixed(0));
	    	
	    })
	
		//input欄位輸入數量
	    $(".num").blur(function(){
			var index = $(this).data("product");			
			var unitPrice = $(".unit").eq(index).text();		
			var num = $(this).val();
			var smallPrice;
			if(num>50){			
				alert("數量不得超過50份!");
			
		         totalPrice = 0;
			        for(let i = 0 ;i<$(".pd").length;i++){
				    	unitPrice = $(".unit").eq(i).text();
				    	number = $(".num").eq(i).val();
				    	var disc=$(".hallin").eq(i).text();
				    	var dec = disc/10;
				    	$(this).val(50);   //輸入的數字大於50，當下的input設為50
				    	
						smallPrice = unitPrice*50*dec;
						$(".pd").eq(index).text(smallPrice);
				    	
				    	
				    	subTotal = unitPrice*number*dec;
				    	totalPrice = totalPrice+subTotal;
				    	
				    	var url="/FunBar/"
					   		$.ajax({
					   			url:"http://localhost:8080" + url + "changecart",
					   			data:{
					   				count:number,
					   				productId:$(".pdid").eq(i).val()
					   			},
					   			type:"POST",
					   			dataType:"JSON",
					   			success:function(){
					   				console.log(number);
					   				console.log("success");
					   			}
					   		})
				    }		  	
			        $(".totalAmount").text(totalPrice.toFixed(0));
			}else if(num<1){
				
				alert("數量不得小於1!");
				
		         totalPrice = 0;
			        for(let i = 0 ;i<$(".pd").length;i++){
				    	unitPrice = $(".unit").eq(i).text();
				    	number = $(".num").eq(i).val();
				    	var disc=$(".hallin").eq(i).text();
				    	var dec = disc/10;
				    	$(this).val(1);
						smallPrice = unitPrice*1*dec;
						$(".pd").eq(index).text(smallPrice);
				    	
				    	
				    	subTotal = unitPrice*number*dec;
				    	totalPrice = totalPrice+subTotal;
				    	
				    	var url="/FunBar/"
					   		$.ajax({
					   			url:"http://localhost:8080" + url + "changecart",
					   			data:{
					   				count:number,
					   				productId:$(".pdid").eq(i).val()
					   			},
					   			type:"POST",
					   			dataType:"JSON",
					   			success:function(){
					   				console.log(number);
					   				console.log("success");
					   			}
					   		})
				    }
				  	
				  	$(".totalAmount").text(totalPrice.toFixed(0));
		}else{
		
		         totalPrice = 0;
			        for(let i = 0 ;i<$(".pd").length;i++){
				    	unitPrice = $(".unit").eq(i).text();
				    	number = $(".num").eq(i).val();
				    	var disc=$(".hallin").eq(i).text();
				    	var dec = disc/10;
				    	$(this).val();
	        	smallPrice = unitPrice*num*dec;        
	        	$(".pd").eq(index).text(smallPrice);
				    				    	
				    	subTotal = unitPrice*number*dec;
				    	totalPrice = totalPrice+subTotal;
				    	//console.log(totalPrice);
				    	console.log(subTotal);
				    	
				    	var url="/FunBar/"
					   		$.ajax({
					   			url:"http://localhost:8080" + url + "changecart",
					   			data:{
					   				count:number,
					   				productId:$(".pdid").eq(i).val()
					   			},
					   			type:"POST",
					   			dataType:"JSON",
					   			success:function(){
					   				console.log(number);
					   				console.log("success");
					   			}
					   		})
				    }
				  	
				  	$(".totalAmount").text(totalPrice.toFixed(0));
				  	console(".totalAmount");
			}
			
			
})
				
	
})


</script>
</head>

<body>
<jsp:include page="header.jsp" />

<!-- Content 區塊 -->
<div class="container page">
	<div class="row">
		<div class="col-sm-offset-10 col-sm-3">
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
					<th>折扣</th>
					<th>小計</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="ci" items="${cart.cartItems}" begin="0" step="1" varStatus="i">
				<tr>
					<td>
						<img src="<c:url value='/ProductPictures/${ci.product.productId}' />" width="80px" height="120px">
					</td>
					<td>${ci.product.productName}</td>
					<td class="unit" data-product="${i.index}">${ci.product.unitPrice}</td>
					<td><button type="button"  class="minus" data-product="${i.index}">⬇</button>
						<input id="count" type="text" maxlength="2" value="${ci.count}" size="2" class="num" data-product="${i.index}"  /> 
						<input class="pdid" type="hidden" value="${ci.product.productId}" data-product="${i.index}">
						<button type="button" class="add" data-product="${i.index}">⬆</button>
					</td>
					<td class="hallin" data-product="${i.index}">${ci.product.discount}</td>
					<td class="smallPrice pd">${ci.subtotal}</td>
											
					<td>
						<input type="hidden" id="all">
						<input type="hidden" class="price" value="${ci.subtotal}"> 
						<a class="removeBtn"  href=" <c:url value='/removeCartItem?productId=${ci.product.productId}' />">刪除</a>
					</td>

				</tr>
				</c:forEach>
				<tr style="text-align:right">
					<td align="right" colspan="8" >總計:<span class="totalAmount" style="padding:0 10px;color:#FF0088;font-size:18px" >${cart.total}</span></td>
				</tr>
				<tr>
					<td align="right" colspan="8">
						<form action="<c:url value='/shoppingcart/InsertOrderServlet' />" method="post">
							<label for="address" class="col-sm-4 col-xs-12">地址:</label>
							<div class="col-sm-4 col-xs-12">
								<input type="text" class="form-control" id="address" name="address" placeholder="請輸入地址" required>
							</div>
							<div class="col-sm-4 col-xs-12">
								
								<button type="submit" class="btn btn-success" style="margin:10px 0">結帳去</button>
							</div>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="footer.jsp" />


</body>

</html>