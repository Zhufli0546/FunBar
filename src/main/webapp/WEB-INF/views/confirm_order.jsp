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
</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->

	<div class="page row">
		<div class="col-md-7" style="height: 380px; background-color: #DDDDDD">

			<img
				style="margin: 5px 5px 5px 5px; border: 2px solid black; border-radius: 10px"
				src="room/${room.room_id}" alt="" title="" height="220px" width="725px">
			<div style="padding: 5px 10px">
				<span style="font-weight: bold;">訂房日期:<span
					style="margin-left: 250px">${date}</span></span><br> <span
					style="font-weight: bold;">入住天數:<span
					style="margin-left: 270px">${stay}</span></span><br> <span
					style="font-weight: bold;">客房數:<span
					style="margin-left: 280px">${rooms} 間</span></span>
			</div>
			<div style="text-align:right; margin-bottom: 0px;">
				<button type="submit" class="btn btn-primary"
					onclick="location.href='booking_room'"
					style="background-color: #66B3FF; border: 2px solid black;height:50px;width:300px">重新選擇日期</button>
			
			<span style="margin-left: 90px;color:red;">TWD : ${room.room_price} 元整</span>
					
			</div>
			
		</div>

		<div class="col-md-5" style="margin-top: 20px;">
		
			<form method="POST" action="pay">
			
			<input type="hidden" name="room_id" value="${room.room_id}">
				<div class="form-group">
					<label for="inputname">姓名 <span style="color: red">*</span></label>
					<input type="text" class="form-control col-md-12" id="inputname" name="name"
						placeholder="請輸入姓名"> <input type="radio" name="sex"
						value="male" style="margin-left: 15px">Mr<input
						type="radio" name="sex" value="female">Ms
				</div>



				<div class="form-group">
					<label for="inputphone">連絡電話 <span style="color: red">*</span></label>
					<input type="text" class="form-control col-md-12" id="inputphone" name="phone"
						placeholder="請輸入電話號碼">
										<label for="inputemail">E-mail <span style="color: red">*</span></label>
					<input type="text" class="form-control col-md-12" id="inputemail" name="email"
						placeholder="請輸入電子郵件">
				</div>

				<input type="hidden" name="date" value="${date}" />
				<input type="hidden" name="time" value="${time}" />
				<input type="hidden" name="people" value="${people}" />
				<span>繳款方式 : 信用卡</span>
				<button type="submit" class="btn btn-primary"
					style="background-color: #66B3FF; border: 2px solid black;width:100%;height:50px">前往預訂</button>
			</form>
			
		</div>
	</div>


	<jsp:include page="footer.jsp" />




</body>
</html>