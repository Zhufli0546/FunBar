<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link href="<c:url value="/images/icons/favicon.png" />"  rel="icon">
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
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/util.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/css/own.css"/>">
</head>

<body class="animsition">

	<!-- Header -->
	<jsp:include page="header.jsp" />



	<!-- Slide1 輪播 -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item1-slick1" style="background-image: url(images/slide1-01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
							data-appear="fadeInDown">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" data-appear="fadeInUp">
							Pato Place
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="zoomIn">
							<!-- Button1 -->
							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Look Menu
							</a>
						</div>
					</div>
				</div>

				<div class="item-slick1 item2-slick1" style="background-image: url(images/master-slides-02.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="rollIn">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37"
							data-appear="lightSpeedIn">
							Pato Place
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="slideInUp">
							<!-- Button1 -->
							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Look Menu
							</a>
						</div>
					</div>
				</div>

				<div class="item-slick1 item3-slick1" style="background-image: url(images/master-slides-01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
							data-appear="rotateInDownLeft">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37"
							data-appear="rotateInUpRight">
							Pato Place
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="rotateIn">
							<!-- Button1 -->
							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Look Menu
							</a>
						</div>
					</div>
				</div>

			</div>

			<div class="wrap-slick1-dots"></div>
		</div>
	</section>

	<!-- Blog -->
	<section class="page">
		
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/animsition/js/animsition.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/bootstrap/js/popper.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/select2/select2.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/daterangepicker/moment.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/vendor/daterangepicker/daterangepicker.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/slick/slick.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/js/slick-custom.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/parallax100/parallax100.js"/>"></script>
	<script type="text/javascript">
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/countdowntime/countdowntime.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript" src="<c:url value="/vendor/lightbox2/js/lightbox.min.js"/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value="/js/main.js"/>"></script>

</body>

</html>