<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <title>活動管理</title>
  <script>
    $(function () {
      var len = 20; // 超過20個字以"..."取代
      $(".tb").each(function (i) {
        if ($(this).text().length > len) {
          $(this).attr("title", $(this).text());
          var text = $(this).text().substring(0, len - 1) + "...";
          $(this).text(text);
        }
      });
    });
  </script>
  <style>
    body,
    title {
      font-family: "微軟正黑體";

    }

    td {
      width: 200px;
    }
    
    table {
      table-layout: fixed;
    }
    .container{
		font-family:微軟正黑體;
		margin: 100px auto 150px auto; width: 80%;
	}
  </style>
</head>

<body>
  <jsp:include page="admin_header.jsp" />

  <div class="container">
    <h2>活動管理</h2>
    <hr>
    <a href="<spring:url value='/allSuggestion' />">
                <button type="button" class="btn btn-outline-secondary">查看活動建議</button></a>
                
     <a href="<spring:url value='/getTimeAndSend' />">
    <button type="button" class="btn btn-outline-secondary">發送通知email</button></a>
                <hr>
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
            <td class="tb"><img class="card-img-top" src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>">
            </td>
            <td class="tb">${activity.eventName}</td>
            <td class="tb">${activity.eventDate}</td>
            <td class="tb">${activity.address}</td>
            <td class="tb">${activity.introduction} </td>
            <td class="tb">${activity.information} </td>
            <td style="width:300px">
              <a href="<spring:url value='activityUpdate?id=${activity.activityId}' />">
                <button type="button" class="btn btn-outline-secondary">修改</button></a>
              <a href="<spring:url value='/deleteActivity?id=${activity.activityId}' />">
                <button type="button" class="btn btn-outline-secondary">刪除</button></a>
              <a href="<spring:url value='/getActivities?activityId=${activity.activityId}' />">
                <button type="button" class="btn btn-outline-secondary">查詢報名名單</button></a>
            </td>
			
          </tr>
        </tbody>
      </c:forEach>
    </table>
  </div>


  <jsp:include page="admin_footer.jsp" />
</body>

</html>