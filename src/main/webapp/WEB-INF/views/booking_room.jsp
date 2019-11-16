<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>線上訂房</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/css/booking_room.css" />" rel="stylesheet">


<style>


.shortselect{  
    background:#fafdfe;  
    height:28px;  
    width:180px;  
    line-height:28px;  
    border:1px solid #9bc0dd;  
    -moz-border-radius:2px;  
    -webkit-border-radius:2px;  
    border-radius:2px;  
}  


</style>

</head>

<body>

	<jsp:include page="header.jsp" />
	

	<section class="page animsition" style="background-color:#E0E0E0;height:500px;">
		<div class="calendar"
			style="border: 1px solid #66B3FF; border-radius: 5px">

			選擇入住日期:
			<div class="title">
				<h1 class="pink" id="calendar-title">Month</h1>
				<h2 class="pink" id="calendar-year">Year</h2>
				<a href="" id="pre">◀</a> <a href="" id="next">▶</a>
			</div>
			<div class="body">
				<div class="lightgrey body-list" style="margin-top: 30px">
					<ul>
						<li>日</li>
						<li>一</li>
						<li>二</li>
						<li>三</li>
						<li>四</li>
						<li>五</li>
						<li>六</li>
					</ul>
				</div>

				<div class="darkgrey body-list">
					<ul id="days"></ul>
				</div>
			</div>
		</div>

		<div class="calendar1" style="background-color:#E0E0E0;color:black">
					<form method="POST" action="chooseRoom">
				入住天數: 
				<select name="stay" id="slc" class="text" style="text-align:center">
				<option value="1" selected = "selected">1天</option>
				<option value="2">2天</option>
				<option value="3">3天</option>
				<option value="4">4天</option>
				<option value="5">5天</option>
				<option value="6">6天</option>
				<option value="7">7天</option>
				</select><br>
				客房數 :
				<select name="rooms" id="rooms" class="text" style="text-align:center">
				<option value="1" selected = "selected">1間</option>
				<option value="2">2間</option>
				<option value="3">3間</option>
				<option value="4">4間</option>
				<option value="5">5間</option>
				</select>
				<hr style="border:none;margin-bottom:110px">
				<br>
				<input id="date" type="hidden" name="date"> <input type="submit" style="height:50px;background-color:white;border-radius:15px;color:black;width:100%;font-size:22px;border:2px solid #66B3FF; "
					value="選擇房型      >>">
			</form>
		</div>
		<div>

		</div>

	</section>

	<jsp:include page="footer.jsp" />

	<script src="<c:url value="/js/booking_room.js"/>"></script>


</body>
</html>