<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢訂單</title>
<style>

.qb{
width:140px;
height:30px;
}
</style>

</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />
	<div style="padding: 10px ;border:1px solid black;float:left">
	<table class="table table-striped" >
<thead><tr>
<th>訂單編號<th>訂位人<th>性別<th>訂位日期<th>訂位時間<th>訂位人數<th>手機<th>取消訂位<th>更改訂位
</tr></thead>
<tbody>
<c:forEach var="b" items="${All}">
<tr>
<td>${b.booking_id}</td>
<td>${b.name}</td>
<td>${b.sex}</td>
<td>${b.date}</td>
<td>${b.time}</td>
<td>${b.people}</td>
<td>${b.phone}</td>
<td><a href="cancelBooking?id=${b.booking_id}"><button class="button" type="button" onclick="">取消訂位</button></a></td>
<td><a href="QuerySBooking?id=${b.booking_id}"><button class="button" type="button">更改訂位</button></a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div style="width:150px;height:300px;text-align:center">
<span style="color:blue">日期:</span>
<br>
<input class="qb" id="ymd" type="text">
<br>
<button class="qb" id="D" type="button">查詢</button>
<span style="color:blue">手機:</span>
<br>
<input class="qb" id="tel" type="text">
<br><button class="qb" id="P" type="button">查詢</button>

</div>
	<jsp:include page="admin_footer.jsp" />
</body>
</html>