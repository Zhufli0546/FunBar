<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<title>線上訂位</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->


	<link href="<c:url value="/images/icons/favicon.png" />" rel="icon">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/vendor/bootstrap/css/bootstrap.min.css" />">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/fonts/themify/themify-icons.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/vendor/animate/animate.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/vendor/css-hamburgers/hamburgers.min.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/vendor/animsition/css/animsition.min.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/vendor/select2/select2.min.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/vendor/daterangepicker/daterangepicker.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/vendor/slick/slick.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/vendor/lightbox2/css/lightbox.min.css"/>">
		<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/util.css"/>"> <link rel="stylesheet" type="text/css"
		href="<c:url value="/css/main.css"/>"> <link rel="stylesheet" type="text/css"
		href="<c:url value="/css/own.css"/>">
		<!--===============================================================================================-->
	<link href="<c:url value="/css/booking.css" />" rel="stylesheet">

</head>

<body>

	<jsp:include page="header.jsp" />

	<section class="page">
		<div class="calendar">

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

		<div class="calendar1">
			選擇人數: <select id="slc" class="text">
				<option value="1">1位</option>
				<option value="2">2位</option>
				<option value="3">3位</option>
				<option value="4">4位</option>
				<option value="5">5位</option>
				<option value="6">6位</option>
				<option value="7">7位</option>
				<option value="8">8位</option>
				<option value="9">9位</option>
				<option value="10">10位</option>
				<option value="11">11位</option>
				<option value="12">12位</option>
			</select>
		</div>

		<div class="calendar1" id="time">請先選擇日期人數</div>
		<div>
			<input type="hidden" id="abc" name="date"></input>
		</div>
	</section>

	<jsp:include page="footer.jsp" />


	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>"> </script>
		<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/animsition/js/animsition.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/bootstrap/js/popper.js"/>"> </script> <script
		type="text/javascript" src="<c:url value="/vendor/bootstrap/js/bootstrap.min.js"/>"> </script>
		<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/select2/select2.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/daterangepicker/moment.min.js"/>"> </script> <script
		type="text/javascript" src="<c:url value="/vendor/daterangepicker/daterangepicker.js"/>"> </script>
		<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/slick/slick.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/slick-custom.js"/>"> </script>
		<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/parallax100/parallax100.js"/>"></script>
	<script type="text/javascript">
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/countdowntime/countdowntime.js"/>"> </script>
		<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/lightbox2/js/lightbox.min.js"/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value="/js/main.js"/>"> </script> <script src="<c:url value="/js/booking.js"/>"> </script>
		</body> </html>