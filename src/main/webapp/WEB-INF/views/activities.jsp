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
	<!-- Page Content -->
		
	<div class="container" style="margin-top: 150px">

		<div class="row" style="float: left">

			<div class="col-lg-3">

				<div class="list-group" style="width: 120px">
					<a href="${pageContext.request.contextPath}/activities" class="list-group-item">所有活動</a>
					<c:forEach var="category" items="${categoryList}">
						<a href="${pageContext.request.contextPath}/activities/${category}" class="list-group-item">${category}</a>
					</c:forEach>

				</div>
			</div>
		</div>
		    
		<!-- /.col-lg-3 -->

		<section>
			<div class="row">
				<c:forEach var="activity" items="${activities}">
					<div class="col-lg-4 col-sm-6 mb-4">
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
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
		<!-- /.row -->

		<!-- Pagination -->
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
					class="sr-only">Previous</span>
			</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
					class="sr-only">Next</span>
			</a></li>
		</ul>

	</div>

	<!-- /.container -->

	<!-- 	<section > -->
	<!-- 		<div > -->
	<%-- 			<c:forEach var="activity" items="${activities }"> --%>
	<!-- 				<div style="width: 360px; height: 360px"> -->
	<!-- 					<div style = "width: 320px; height: 340px"> -->
	<%-- 						  <img width="100" height="150" src="<c:url value=''/>" /> --%>
	<!-- 						<div> -->
	<!-- 							<p> -->
	<%-- 								<b style='font-size: 16px;'>${activity.eventName}</b> --%>
	<!-- 							</p> -->
	<%-- 							<p>${activity.eventDate}</p> --%>
	<%-- 							<p>${activity.introduction}</p> --%>

	<!-- 							<p> -->
	<!-- 													路徑前加上斜線/ 在分類查詢中即可顯示詳細資料  -->
	<%-- 								<a href="<spring:url value='/activity?id=${activity.activityId}' />" --%>
	<!-- 									class="btn btn-primary"> <span -->
	<!-- 									class="glyphicon-info-sigh glyphicon"></span>活動詳細資料 -->
	<!-- 								</a> -->
	<!-- 							</p> -->

	<!-- 						</div> -->
	<!-- 					</div> -->
	<!-- 				</div> -->
	<%-- 			</c:forEach> --%>
	<!-- 		</div> -->
	<!-- 	</section> -->
	<jsp:include page="footer.jsp" />

</body>
</html>