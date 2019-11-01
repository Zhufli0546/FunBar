<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Activity</title>
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container" style="margin-top: 150px ;width:60%">
        <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">

        <hr>

        <p class="lead">${activity.eventName}</p><br>

        <p class="lead">活動時間</p>
        <p>${activity.eventDate}</p>

        <p class="lead">活動地點</p>
        <p>${activity.address}</p><hr><br>

        <blockquote class="blockquote">
          <p class="mb-0"></p>
          <footer class="blockquote-footer">
            <cite title="Source Title">${activity.introduction}</cite>
          </footer>
        </blockquote>

		<br>
        <p>活動介紹</p><hr>
        <p>${activity.activities}</p><br><br>

        <p>活動資訊</p><hr>
        <p>${activity.information}</p>

        <hr>
        
        </div>

<jsp:include page="footer.jsp" />
</body>
</html>