<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交易結果</title>
<style>
.form-control[readonly] {
	background: white;
	opacity: 0.6;
}

.ui-widget-header {
	background-color: white;
}

p {
	margin: 0.5% 2%;
}
</style>

</head>


<body>


<jsp:include page="header.jsp" />

<div style="margin-top:80px;margin-bottom:120px" class="container table-responsive">
	<c:forEach var="o" items="${orders}"  begin="0" step="1" end="${fn:length(orders)}" varStatus="i">
	<div style="border:1px solid black;">
	<c:forEach var="oi" items="${o.orderItem}" begin="0" step="1" end="${fn:length(o.orderItem)}" varStatus="a">
	<div style="border:1px solid black;width:350px; height:150px;margin-bottom:30px;">
		<span>${sessionScope.allProduct[i.index][a.index].productName}</span><br>
		<span>${oi.quantity}</span><br>
		<span>${oi.subTotal}</span>
		
		</div>
		</c:forEach>
	</div>
	</c:forEach>
</div>

		<!-- Footer -->
<jsp:include page="footer.jsp" />
	

	<!-- Scripts -->
<%-- 	<script src="<c:url value='/assets/js/jquery.min.js'/>"></script> --%>
	<script src="<c:url value='/assets/js/jquery.dropotron.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.scrolly.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.scrollex.min.js'/>"></script>
	<script src="<c:url value='/assets/js/browser.min.js'/>"></script>
	<script src="<c:url value='/assets/js/breakpoints.min.js'/>"></script>
	<script src="<c:url value='/assets/js/util.js'/>"></script>
	<script src="<c:url value='/assets/js/main.js'/>"></script>
</body>
</html>