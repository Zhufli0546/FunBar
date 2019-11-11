<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理房型</title>

<style>
img{
width:150px;
height:70px;

}
</style>
</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />
	
	
	<div style="padding: 10px ;border:1px solid black;float:left">
	<table id="ch" class="table table-striped" style="text-align: center" >
<thead><tr>
<th>房型圖片<th>房型名稱<th>房型數量<th>房型價位<th>房型詳細資訊<th>修改<th>刪除
</tr></thead>
<tbody>
<c:forEach var="r" items="${room}">
<tr>
<td><img src="room/${r.room_id}"></td>
<td>${r.room_type}</td>
<td>${r.room_quantity}</td>
<td>${r.room_price}</td>
<td>${r.room_description}</td>
<td><a href="cancelBooking?id=${b.booking_id}&date=${b.date}&phone=${b.phone}"><button class="button" type="button" onclick="return confirm('是否刪除');">修改</button></a></td>
<td><a href="pullSingle?id=${b.booking_id}&date=${b.date}&phone=${b.phone}"><button class="button" type="button">刪除</button></a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div style="width:150px;height:300px;text-align:center">

<button type="button" onclick="location='add_form'">新增房型</button>


</div>
	
	<jsp:include page="admin_footer.jsp" />
</body>
</html>