<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.center {
	margin:20px 65% 20px 35%;
	font-famaly:微軟正黑體;
}
.text {
	width:300px;
	height:100px;
}
</style>

</head>
<body>
<jsp:include page="admin_header.jsp" />
	
<p>
	<hr>
	<div class='center'>
		<h2>新增活動資料</h2><br>
		
		<form:form modelAttribute="activity" action='activities'
			method='POST' enctype="multipart/form-data">
			活動名稱:<form:input path='eventName' type="text" /><p><br>
			活動時間:<form:input path='eventDate' type="text" /><p><br>
			活動地點:<form:input path='address' type="text"/><p> <br>
			活動簡介:<form:textarea path='introduction' rows="50"  cols="40" class="text" /><p> <br>
			活動介紹<form:textarea path='activities' rows="50"  cols="40" class="text"/><p><br>
			活動資訊<form:textarea path='information' rows="50"  cols="40" class="text"/><p> <br>
			
			活動分類
			<form:select path="category">
			<form:option value="-1" >請選擇分類
							</form:option>
			<form:options items="${categoryList}" />
			</form:select>
			
			<div class=''>
				<form:input id="activityImage" path="activityImage" type='file'
					class='form:input-large' />
			</div>
			<input type='submit' value='提交'> 
			<input type='reset' value='還原'> 
			<br> 
			<br> 
		</form:form>
	</div>
<%-- <jsp:include page="admin_footer.jsp" /> --%>
</body>
</html>