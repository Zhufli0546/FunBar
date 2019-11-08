<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_blog</title>
</head>
<style>
body, title {
		font-family:"微軟正黑體";
}

td	{
	width:200px;
	height: 110px;
	overflow: hidden;
}
.overflowH { white-space: nowrap; overflow: hidden; }
</style>
<body>
<!-- Header -->
<jsp:include page="admin_header.jsp" />

<!-- content 區塊 -->
<div style="margin-top:80px;margin-bottom:120px" class="container table-responsive">
    <table class="table table-dark table-hover" id="demo"></table>
    <ul id="show" class="pagination"></ul>
</div>

<!-- Footer -->
<jsp:include page="admin_footer.jsp" />
<script src="<c:url value='/js/admin_blog.js' />"></script>
</body>
</html>