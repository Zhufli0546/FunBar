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


    <!--===============================================================================================-->
    <script type="text/javascript" src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>"> </script>
        <!--===============================================================================================-->
<script type="text/javascript"
	src="<c:url value="/vendor/animsition/js/animsition.min.js"/>"></script>
    <!--===============================================================================================-->
    <script type="text/javascript" src="<c:url value="/vendor/bootstrap/js/popper.js"/>"> </script> <script
        type="text/javascript" src="<c:url value="/vendor/bootstrap/js/bootstrap.min.js"/>"> </script>
        <!--===============================================================================================-->
<script type="text/javascript"
	src="<c:url value="/vendor/select2/select2.min.js"/>"></script>
    <!--===============================================================================================-->
    <script type="text/javascript" src="<c:url value="/vendor/daterangepicker/moment.min.js"/>"> </script> <script
        type="text/javascript" src="<c:url value="/vendor/daterangepicker/daterangepicker.js"/>"> </script>
        <!--===============================================================================================-->
<script type="text/javascript"
	src="<c:url value="/vendor/slick/slick.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/js/slick-custom.js"/>"> </script>
        <!--===============================================================================================-->
<script type="text/javascript"
	src="<c:url value="/vendor/parallax100/parallax100.js"/>"></script>
    <script type="text/javascript">
        $('.parallax100').parallax100();
    </script>
    <!--===============================================================================================-->
    <script type="text/javascript" src="<c:url value="/vendor/countdowntime/countdowntime.js"/>"> </script>
        <!--===============================================================================================-->
<script type="text/javascript"
	src="<c:url value="/vendor/lightbox2/js/lightbox.min.js"/>"></script>
    <!--===============================================================================================-->
    <script src="<c:url value="/js/main.js"/>"> </script> <style>

.cform{

input{
border:1px solid white;
color:white;

}


}

</style>
</head>
<body>

	<jsp:include page="header.jsp" />
	<div style="width: 100%; height:100% ;background-color:white;">
	<div style="width: 700px; height:450px; margin-top:90px; margin-bottom:300px; margin-left:500px;">
	<form>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control cform" id="inputEmail4" placeholder="Email">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control cform" id="inputPassword4" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control cform" id="inputAddress" placeholder="1234 Main St">
  </div>
  <div class="form-group">
    <label for="inputAddress2">Address 2</label>
    <input type="text" class="form-control cform" id="inputAddress2" placeholder="Apartment, studio, or floor">
  </div>
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputCity">City</label>
      <input type="text" class="form-control cform" id="inputCity">
    </div>
    <div class="form-group col-md-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control cform">
        <option selected>Choose...</option>
        <option>...</option>
      </select>
    </div>
    <div class="form-group col-md-2">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" id="inputZip">
    </div>
  </div>

  <button type="submit" class="btn btn-primary">Sign in</button>
</form>
	</div>
	</div>
<jsp:include page="footer.jsp" />

	<div class="dmtop">
		<i class="fa fa-long-arrow-up"></i>
	</div> 
</body>
</html>