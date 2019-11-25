<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
<script src="<c:url value='/js/jquery-1.12.4.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>
</head>
<style>
* {
	font-family: 微軟正黑體;
}

html, body {
background: url("../images/member.jpg");
	background-size: cover;
	
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #eee;
	padding-top: 20px;
	padding-bottom:10px;
}

.login {
	background-color: black;
	text-align: center;
	width: 450px;
}

.error {
	color: red
}

figure {
	margin: 50px;
	border: :5px solid rab(8, 8, 8);
}
</style>

<body>
	<meta charset="UTF-8">
	<link rel="stylesheet"
		href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>

<body>
	<div>
		<h1 style="float: right;">會員資料</h1>
		<form action="updatemb1" method="POST" enctype="multipart/form-data">


			<figure style="float: left">
				<img class="card-img-top rounded-circle"
					style="height: 220px; width: 220px"
					src="<c:url value='/membergetPicture/${member.id}'/>">
				<input type="file" name="memberimg" value="${one.memberimg}">
			</figure>
			<fieldset>
				<div>
					<label for="memberId">姓名:</label> <input type="text"
						class="form-control" name="memberName" value="${one.memberName}">
					<label for="memberAddress">地址:</label> <input type="text"
						class="form-control" name="memberAddress"
						value="${one.memberAddress}"> <label for="memberAddress">生日:</label>
					<input type="date" class="form-control" name="memberBirth"
						value="${one.memberBirth}"> <label for="memberAddress">電話:</label>
					<input type="text" class="form-control" name="memberPhone"
						value="${one.memberPhone}"> <label for="memberAddress">密碼:</label>
					<input type="password" class="form-control" name="memberPwd"
						disabled value="${one.memberPwd}"> <label
						for="memberAddress">帳號:</label> <input type="text"
						class="form-control" name="memberId" disabled
						value="${one.memberId}"> <label for="memberAddress">信箱:</label>
					<input type="text" class="form-control" name="memberEmail"
						value="${one.memberEmail}">
				</div>

				<div class="button">
					<input type="hidden" name="id" value="${one.id}" /> <input
						type="submit" class="btn btn-outline-secondary" value="送出">
					<td><a href="${pageContext.request.contextPath}">
							<button type="button" class="btn btn-outline-secondary">回首頁</button>
					</a></td>
				</div>
		</form>
		</fieldset>
	</div>
	</section>
</body>

</html>