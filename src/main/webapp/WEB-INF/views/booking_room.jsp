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



</head>

<body>

	<jsp:include page="header.jsp" />

	<section class="page" style="background-color:black">
		<div class="calendar" style="border:1px solid #66B3FF;border-radius:5px">

			選擇訂位日期:
			<div class="title">
				<h1 class="pink" id="calendar-title">Month</h1>
				<h2 class="pink" id="calendar-year">Year</h2>
				<a href="" id="pre">◀</a> <a href="" id="next">▶</a>
			</div>
			<div class="body">
				<div class="lightgrey body-list" style="margin-top:30px">
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

	</section>

	<jsp:include page="footer.jsp" />
	
	<script src="<c:url value="/js/booking_room.js"/>"></script>


		</body> </html>