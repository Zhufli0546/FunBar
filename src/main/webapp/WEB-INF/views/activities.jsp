<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">

	<title>Activities</title>
</head>

<body>
	<jsp:include page="header.jsp" />

	<div class="container" style="margin-top: 150px">

		<div class="row" style="float: left">

			<div class="col-lg-3">

				<div class="list-group" style="width: 120px">
					<a href="${pageContext.request.contextPath}/activities" class="list-group-item">所有活動</a>
					<c:forEach var="category" items="${categoryList}">
						<a href="${pageContext.request.contextPath}/activities/${category}"
							class="list-group-item">${category}</a>
					</c:forEach>
					<a href="${pageContext.request.contextPath}/activitiesSignup"
					class="list-group-item">我報名的活動</a>

				</div>
			</div>
		</div>

		<section>
			<div class="row">
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
			</div>
		</section>
		
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
				</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span
						aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
				</a></li>
		</ul>
		
		  <a href="<spring:url value='/cancelSignup?id=1'/>">
                <button type="button" class="btn btn-outline-secondary">取消報名</button></a>
                
          <a href="<spring:url value='/deleteMap?activityId=21&applicantId=3'/>">
                <button type="button" class="btn btn-outline-secondary">取消報名測試</button></a> <a
			href="<spring:url value='/queryMapById?at.activityId=21&al.applicantId=12'/>">
			<button type="button" class="btn btn-outline-secondary">取消報名測試2</button>
		</a>

	</div>
	<jsp:include page="footer.jsp" />

</body>

</html>