<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已報名活動資料</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(function () {
      var len = 90; // 超過字數以"..."取代
      $(".card-text").each(function (i) {
        if ($(this).text().length > len) {
          $(this).attr("title", $(this).text());
          var text = $(this).text().substring(0, len - 1) + "...";
          $(this).text(text);
        }
      });
    });
  </script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container" style="margin-top: 150px">
		<div class="row">
			<c:forEach var="activity" items="${activity}">

				<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a
							href="<spring:url value='/activity?id=${activity.activityId}' />">
							<img class="card-img-top"
							src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>">
						</a>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="<spring:url value='/activity?id=${activity.activityId}' />">${activity.eventName}</a>
							</h4>
							<p class="card-text">${activity.eventDate}</p>
							<p class="card-text">${activity.introduction}</p>
							
						</div>
						<a href="<spring:url value='/cancelSignup/${memberId}&${activity.activityId}'/>">
						<button type="button" class="btn btn-outline-secondary btn-block">取消報名</button></a>
						
						<a href="<spring:url value='/addSuggestion'/>">
						<button type="button" class="btn btn-outline-secondary btn-block" >我要給意見</button></a>
					</div>							
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>