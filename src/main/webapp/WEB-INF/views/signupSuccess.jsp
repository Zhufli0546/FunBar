<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>完成報名</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	
	<div class="container" style="margin:150px auto;width: 40%;height: 600px;">

		<fieldset>
			<legend>報名成功</legend>
			<p>${member.memberName} 先生/小姐你好，</p>
			<p>${activity.eventName}  已報名成功</p>
			


			<a href="${pageContext.request.contextPath}/activities?index=1"
				class="list-group-item">
				<button type="button" class="btn btn-outline-secondary">返回熱門活動</button>
			</a>
		</fieldset>

	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>