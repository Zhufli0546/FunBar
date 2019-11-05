<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Activity</title>
</head>
<body>
<jsp:include page="admin_header.jsp" />
	

<div class="container" style="margin-top: 150px ;width:60%">

<form:form modelAttribute="activity" action='activityQuery'
			method='POST' enctype="multipart/form-data">

<div class="form-group">
  <label for="id">活動id:</label>
  <form:input path="activityId" type="text" class="form-control" id="id" disabled="true"/>
  <form:input path="activityId" type="hidden" class="form-control" id="id" />
</div>


<div class="form-group">
  <label for="name">活動名稱:</label>
  <form:input path="eventName" type="text" class="form-control" id="name" placeholder="${activity.eventName}"/>
</div>

<div class="form-group">
  <label for="date">活動時間:</label>
  <form:input path="eventDate" type="text" class="form-control" id="date" placeholder="${activity.eventDate}"/>
</div>

<div class="form-group">
  <label for="address">活動地點</label>
  <form:input path="address" type="text" class="form-control" id="address" placeholder="${activity.address}"/>
</div>

<div class="form-group">
  <label for=introdoction>活動簡介:</label>
  <form:textarea path="introduction" class="form-control" rows="5" id="introdoction" placeholder="${activity.introduction}"></form:textarea>
</div>

<div class="form-group">
  <label for="content">活動內容:</label>
  <form:textarea path="activities" class="form-control" rows="5" id="content" placeholder="${activity.activities}"></form:textarea>
</div>

<div class="form-group">
  <label for="info">活動資訊:</label>
  <form:textarea path="information" class="form-control" rows="5" id="info" placeholder="${activity.information}"></form:textarea>
</div>

<div class="form-group">
<form:select path="category">
			<form:option value="-1" >請選擇分類
							</form:option>
			<form:options items="${categoryList}" />
			</form:select>
</div>

<div class="form-group">
  <form:input id="activityImage" path="activityImage" type='file'
					class='form:input-large' />
</div>


	<hr>
    <form:button type="submit" class="btn btn-outline-secondary">修改</form:button>
    
    </form:form>
        
</div>
</body>
</html>