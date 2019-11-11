<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Activity</title>
<style>
.lead {
	font-family: 微軟正黑體;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp" />

	<div class="container" style="margin-top: 150px; width: 60%">
		<img class="img-fluid rounded"
			src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>">


		<hr>

		<p class="lead">${activity.eventName}</p>
		<br>

		<p class="lead">活動時間</p>
		<p>${activity.eventDate}</p>

		<p class="lead">活動地點</p>
		<p>${activity.address}</p>
		<hr>
		<br>

		<blockquote class="blockquote">
			<p class="mb-0"></p>
			<footer class="blockquote-footer">
				<cite title="Source Title">${activity.introduction}</cite>
			</footer>
		</blockquote>

		<br>
		<p class="lead">活動介紹</p>
		<hr>
		<p>${activity.activities}</p>
		<br>
		<br>

		<p class="lead">活動資訊</p>
		<hr>
		<p>${activity.information}</p>

		<hr>
		<br>
		<p class="lead">活動地圖</p>
		<hr>
		<iframe width='100%' height='300' style="border-radius: 50px"
			src='https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${activity.address}&z=16&output=embed&t='>
		</iframe>

		<div>
 			<a href="<spring:url value='activityRegistration?id=${activity.activityId}' />">
				
				<button type="button" class="btn btn-outline-secondary">我要報名</button>
			</a>
		</div>

	</div>




	<jsp:include page="footer.jsp" />
</body>

</html>