<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>分類商品</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value="/css/shoppingCart.css" />" rel="stylesheet">
</head>


<body>
 <jsp:include page="header.jsp" />

 <!-- Content 區塊 -->
 <div class="container" style="margin-top: 150px">
  <div class="row" style="float: left">
   <div class="col-md-3">
    <div class="list-group" style="width: 150px">
     <a href="${pageContext.request.contextPath}/shoppingCart"
      class="list-group-item">所有商品</a>
     <c:forEach var='category' items='${categoryList}'>
      <a
       href="${pageContext.request.contextPath}/shoppingCart/${category}"
       class="list-group-item">${category}</a>
     </c:forEach>
    </div>
   </div>
  </div>


  <div class="row">
   <c:forEach var="pb" items="${category}">
   <div class="prodlist">
					<p>${pb.productDetail}</p>
					<p class="prodtitle">${pb.productName}</p>
					<figure>
					<a href="<c:url value='/product?id=${pb.productId}' />" ">
						<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />
					</a>						
					</figure>
						<p>建議售價:<span style="color:#FF44AA;font-weight:bold">$ ${pb.unitPrice}</span></p>
						<p>折扣：<span style="font-weight:bold;color:	#CE0000;">${pb.discount}</span></p>				
				</div> 
    <!-- .prodlist -->
   </c:forEach>

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
   myFunction();

   var url = "/FunBar/";
   $.ajax({
    url : "http://localhost:8080" + url + "cart",
    data : {
     count : $(".selectCount").eq(index).val(),
     productId : $(".pdid").eq(index).val()
    },
    type : "POST",
    dataType : "JSON",
    success : function(data) {
     console.log("success");
    }
   })
  })
 </script>

</body>
</html>