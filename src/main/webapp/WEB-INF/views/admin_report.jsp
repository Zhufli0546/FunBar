<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Header -->
<jsp:include page="admin_header.jsp" />

<!-- content 區塊 -->
<div style="margin-top:80px; margin-bottom:120px" class="container">
	<!-- Nav tabs -->
 	<ul class="nav nav-tabs">
		<li class="nav-item">
      		<a class="nav-link active" href="#home">待處理</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="#menu1">已處理</a>
    	</li>
  	</ul>
  	
	<!-- Tab panes -->
	<div class="tab-content">
		<div id="home" class="container tab-pane active"><br>
        	<h2>home</h2>
        	<table id="reportProcess" class="table table-dark table-hover" id="demo"></table>
        	<ul id="showProcess" class="pagination"></ul>
 		</div>
	    <div id="menu1" class="container tab-pane fade"><br>
			<h2>menu1</h2>
		</div>
	</div>
	
	<table id="reportProcess" class="table table-dark table-hover" id="demo"></table>
</div>

<!-- Footer -->
<div style="display:none; " class="requestUrl">${pageContext.request.contextPath}</div>
<jsp:include page="admin_footer.jsp" />
<script src="<c:url value='/js/admin_report.js' />"></script>
</body>
</html>