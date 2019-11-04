<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>活動管理</title>
<script>
$(function(){
    var len = 20; // 超過50個字以"..."取代
    $("td").each(function(i){
        if($(this).text().length>len){
            $(this).attr("title",$(this).text());
            var text=$(this).text().substring(0,len-1)+"...";
            $(this).text(text);
        }
    });
});
</script>
<style>
	body, title {
		font-family:"微軟正黑體";
	}
	td	{
		width:200px;
	}


</style>
</head>
<body>
	<jsp:include page="admin_header.jsp" />
	
	<div class="container">
  <h2>活動管理</h2>
            
  <table class="table table-dark table-hover">
    <thead>
      <tr>
        <th>活動圖片</th>
        <th>活動名稱</th>
        <th>活動日期</th>
        <th>活動地點</th>
        <th>活動簡介</th>
        <th>活動資訊</th>
        <th>編輯</th>
      </tr>
    </thead>
    <c:forEach var='activity' varStatus='vs' items='${activities}'> 
    <tbody>
      <tr>
        <td ><img class="card-img-top"
				src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>"></td>
        <td >${activity.eventName}</td>
		<td >${activity.eventDate}</td>
		<td >${activity.address}</td>
		<td >${activity.introduction} </td>
		<td >${activity.information} </td>
        <td ><a href="<spring:url value='activityUpdate?id=${activity.activityId}' />">
        <button type="button" class="btn btn-outline-secondary">編輯</button></a></td>
      </tr>
    </tbody>
    </c:forEach>
  </table>
  
</div>
	
<jsp:include page="admin_footer.jsp" />
</body>
</html>