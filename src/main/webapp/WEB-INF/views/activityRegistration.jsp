<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動報名</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container" style="margin: 150px auto; width: 60%">
		<h2>填寫報名者資訊</h2>
		<hr>

		<form  action="applicantSignup" method='POST' enctype="multipart/form-data">

			<div class="form-group">
				<label for="name">姓名:</label>
				<input name="applicantName" type="text" class="form-control" value=""
					id="name" />
			</div>


			<div class="form-group">
				<label for="gender">性別:</label>
				<input name="gender" type="text" class="form-control" value=""
					id="gender" />
			</div>
			
			<div class="form-group">
				<label for="phone">手機號碼:</label>
				<input name="applicantPhone" type="text" class="form-control" value=""
					id="phone" />
			</div>
			
			<div class="form-group">
				<label for="email">e-mail:</label>
				<input name="applicantEmail" type="text" class="form-control" value=""
					id="email" />
			</div>
			
			<div class="form-group">
				<label for="id">活動Id</label>
				<input name="activityId" type="text" class="form-control" value="${activity.activityId}"
					id="id" />
			</div>
			
			
			<button type="submit" class="btn btn-outline-secondary">確認報名</button>
			
			</form>
			
</div>
<jsp:include page="footer.jsp" />
</body>
</html>