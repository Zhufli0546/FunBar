<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已報名活動資料</title>
</head>
<body>
<jsp:include page="header.jsp" />

<c:forEach var="activity" items="${activities}">
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="card h-100">
							<a href="<spring:url value='/activity?id=${activity.activityId}' />">
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
						</div>
					</div>
				</c:forEach>


<jsp:include page="footer.jsp" />
</body>
</html>