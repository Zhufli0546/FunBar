<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>取消活動成功</title>
<style>
</style>
</head>
<body>

	<jsp:include page="header.jsp" />

	<div class="container" style="margin:150px auto;width: 40%;height: 600px;">

		<fieldset>
			<legend>取消報名成功</legend>
			<p>${member.memberName} 先生/小姐你好，</p>
			<p>你所報名的活動 ${activity.eventName}</p>
			<p>已為您做取消</p>


			<a href="${pageContext.request.contextPath}/activities?index=1"
				class="list-group-item">
				<button type="button" class="btn btn-outline-secondary">返回活動頁面</button>
			</a>
		</fieldset>

	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>