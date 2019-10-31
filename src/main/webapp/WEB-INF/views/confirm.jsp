<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>填寫訂位資料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->


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
<!--===============================================================================================-->
</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->

	<div class="page row">
		<div class="col-md-4" style="height:350px;background-color:#DDDDDD">
		
		<img style="margin:5px 5px 5px 5px;border:2px solid red;border-radius:10px" src="images/mini_img.jpg" alt="" title="" height="190px">
		<div style="padding: 5px 10px">
		<span style="font-weight: bold;">訂位日期:<span style="margin-left: 100px">${date}</span></span><br>
		<span style="font-weight: bold;">訂位時間:<span style="margin-left: 120px">${time}</span></span><br>
		<span style="font-weight: bold;">訂位人數:<span style="margin-left: 135px">${people}  人</span></span>
		</div>
		<div style="text-align: center;margin-bottom:0px">
						<button type="submit" class="btn btn-primary"   onclick="location.href='booking'"
					style="background-color: orange; border: 1px solid red;">重新選擇日期及時段</button>
		</div>
		</div>

		<div class="col-md-8">
			<form>
				<div class="form-group">
					<label for="inputname">Name <span style="color: red">*</span></label>
					<input type="text" class="form-control col-md-4" id="inputname"
						placeholder="請輸入姓名">
						
											<input type="radio" name="sex" value="male"
						style="margin-left: 15px">Mr<input type="radio"
						name="sex" value="female">Ms
				</div>



				<div class="form-group">
					<label for="inputphone">Phone <span style="color: red">*</span></label>
					<input type="text" class="form-control col-md-4" id="inputphone"
						placeholder="請輸入電話號碼">
				</div>

				<div class="form-group">
					<label for="inputremark">Remark</label> <input type="text"
						class="form-control col-md-8" id="inputremark" placeholder="如有需要 請輸入備註">
				</div>

				<button type="submit" class="btn btn-primary"
					style="background-color: orange; border: 1px solid red">Complete
					Reservation</button>
			</form>
		</div>
	</div>


	<jsp:include page="footer.jsp" />

	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/animsition/js/animsition.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/bootstrap/js/popper.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/select2/select2.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/daterangepicker/moment.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/vendor/daterangepicker/daterangepicker.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/slick/slick.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/js/slick-custom.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/parallax100/parallax100.js"/>"></script>
	<script type="text/javascript">
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/countdowntime/countdowntime.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/lightbox2/js/lightbox.min.js"/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value="/js/main.js"/>"></script>


</body>
</html>