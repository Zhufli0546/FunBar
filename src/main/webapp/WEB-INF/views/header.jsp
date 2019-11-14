<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link href="<c:url value="/images/icons/favicon.png" />" rel="icon">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/bootstrap/css/bootstrap.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/fonts/themify/themify-icons.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/animate/animate.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/css-hamburgers/hamburgers.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/animsition/css/animsition.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/select2/select2.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/daterangepicker/daterangepicker.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/slick/slick.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/lightbox2/css/lightbox.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/util.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/main.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/own.css"/>">
<link href="https://fonts.googleapis.com/css?family=Poller+One|Sarina|Sonsie+One&display=swap" rel="stylesheet">


</head>
<body>
	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="wrap-menu-header gradient1 trans-0-4">
			<div class="container h-full">
				<div class="wrap_header trans-0-3">
					<!-- Logo -->
					<div class="logo">
						<a href="${pageContext.request.contextPath}"> 
						<img src="<c:url value='/images/icons/logo4nb.png' />" 
							data-logofixed="<c:url value='/images/icons/logo4nb.png' />">
						</a>
					</div>
					<!-- Menu -->
					<div class="wrap_menu p-l-20 p-l-0">
						<nav class="menu">
							<ul class="main_menu">
						<li><a href="${pageContext.request.contextPath}/activities">熱門活動</a></li>

								<li><a
									href="${pageContext.request.contextPath}/shoppingCart">購物區</a></li>

								<li><a href="${pageContext.request.contextPath}/blogs">部落格</a></li>

								<li><a href="${pageContext.request.contextPath}/discuss">討論區</a></li>

								<li class="nav-item dropdown">
								
								         <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">線上預約</a>
								         
								           <div class="dropdown-menu">
								           		 <a class="dropdown-item" href="${pageContext.request.contextPath}/booking">線上訂位</a>
               									 <a class="dropdown-item" href="${pageContext.request.contextPath}/booking_room">線上訂房</a>
               								</div>	 
               									  
								
								
								
								</li>
								
								<li><a href="${pageContext.request.contextPath}/signin">登入</a></li>

								</ul>
								
								<c:choose>
									<c:when test="${sessionScope.member.memberName==null}">
										<li><a href="joinus">註冊</a></li>
										<li><a href="${pageContext.request.contextPath}/signin">登入</a></li>
									</c:when>
									<c:otherwise>

										<a href="<c:url value='getONE?id=${member.id}' />">
								<img class="card-img-top rounded-circle"
								style="height:50px;width:50px "
									src="<c:url value='/membergetPicture/${member.id}'/>">
							</a>
										<a>${sessionScope.member.memberName}, 你好</a>
										<td><a href="${pageContext.request.contextPath}/logout">登出</a></td>
									</c:otherwise>
								</c:choose>
						
						</nav>
					</div>
					<!-- Social -->
					<div class="social flex-w flex-l-m p-r-20">
						<a href="#"><i class="fa fa-tripadvisor" aria-hidden="true"></i></a>
						<a href="#"><i class="fa fa-facebook m-l-21"
							aria-hidden="true"></i></a> <a href="#"><i
							class="fa fa-twitter m-l-21" aria-hidden="true"></i></a>
						<button class="btn-show-sidebar m-l-33 trans-0-4"></button>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Sidebar -->
	<aside class="sidebar trans-0-4">
		<!-- Button Hide sidebar -->
		<button class="btn-hide-sidebar ti-close color0-hov trans-0-4"></button>

		<!-- - -->
		<ul class="menu-sidebar p-t-95 p-b-70">


			<li class="t-center m-b-13"><a href="booking_query">訂位、訂房查詢</a></li>

			<li class="t-center m-b-13"><a href="activities" class="txt19">熱門活動</a>
			</li>

			<li class="t-center m-b-13"><a href="shoppingCart">購物區</a></li>

			<li class="t-center m-b-13"><a
				href="${pageContext.request.contextPath}/blogs" class="txt19">部落格</a>
			</li>

			<li class="t-center m-b-13"><a href="discuss" class="txt19">討論區</a>
			</li>
			



			<li class="t-center m-b-13"><a href="signin">登入</a></li>

			<li class="t-center m-b-13"><a href="admin">後台管理</a></li>


			<li class="t-center">
				<!-- Button3 --> <a href="reservation.html"
				class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto">
					Reservation </a>
			</li>
		</ul>
	</aside>
</body>

</html>