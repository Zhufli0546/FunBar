<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Site Metas -->
<title>Sign in</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">
<!-- http://www.pcnet.idv.tw/pcnet/html/17.htm 上面三個的使用方法-->

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
<!-- All core CSS -->
<link href="<c:url value="/css/bootstrap.css"/>" rel="stylesheet">
<link href="<c:url value="/css/font-awesome.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/css/all.css" />" rel="stylesheet">
<link href="<c:url value="/css/style.css" />" rel="stylesheet">
<link href="<c:url value="/css/responsive.css" />" rel="stylesheet">
<link href="<c:url value="/css/colors.css" />" rel="stylesheet">
<link href="<c:url value="/css/main.css" />" rel="stylesheet">
<style>
body{
background-color:#666666;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div style="width:500px;height:300px;align:center;background-color:white;margin-left:380px;border:3px solid #003C9D; border-radius:5px">
	<div style="width:400px;margin:50px auto">
	<form method="POST" action="check">
		<div class="form-group">
			<label for="username" style="margin-left:45%;color:black">帳號:</label> <input type="text"
				class="form-control" id="title" name="username" placeholder="">
		</div>
		<div class="form-group">
			<label for="password" style="margin-left:45%;color:black">密碼:</label> <input type="text"
				class="form-control" id="title" name="password" placeholder="">
		</div>
		<input style="margin-left:43%;color:black" type="submit" value="登入">
	</form>
	</div>
	</div>

	<!-- footer 區塊 -->
	<jsp:include page="footer.jsp" />

	<div class="dmtop">
		<i class="fa fa-long-arrow-up"></i>
	</div>

	<!-- Core JavaScript
    ================================================== -->
	<script src="<c:url value="/js/jquery.min.js" />"></script>
	<script src="<c:url value="/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/js/all.js" />"></script>
	<script src="<c:url value="/js/custom.js" />"></script>

</body>
</html>