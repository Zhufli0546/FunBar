<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
	<hr>
	<div class='center'>
		<h2>新增活動資料</h2>
		<form:form modelAttribute="activity" action='activities'
			method='POST' enctype="multipart/form-data">
			活動名稱:<form:input path='eventName' />	<p>
			活動時間:<form:input path='eventDate' /><p>
			活動地點:<form:input path='address' /><p>
			活動簡介:<form:input path='introduction' /><p>
			活動介紹<form:input path='activities' /><p>
			活動資訊<form:input path='information' /><p>
			建立時間<form:input path='eventCreateTime' /><p>
			
			<div class='col-lg-10'>
				<form:input id="activityImage" path="activityImage" type='file'
					class='form:input-large' />
			</div>
			
			<br> 
			<br> 
			<input type='submit' value='提交'> 
			<input type='reset' value='還原'> 
			<br> 
			<br> 
<%-- 			<a href='${pageContext.request.contextPath}/_01/cnvr/index'>回到會員管理</a> --%>
		</form:form>
	</div>
</body>
</html>