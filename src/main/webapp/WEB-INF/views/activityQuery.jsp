<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Activities</title>
<script type="text/javascript">
  function confirmDelete(userId){
	  var result = confirm("確定刪除此筆記錄(帳號:" + userId.trim() + ")?");
	  if (result) {
		  document.forms[0].putOrDelete.value = "DELETE";
	      return true;
	  }
	  return false;
  }
  function confirmUpdate(userId){
	  var result = confirm("確定送出此筆記錄(帳號:" + userId.trim() + ")?");
	  if (result) {
		  document.forms[0].putOrDelete.value = "PUT";
	      return true;
	  }
	  return false;
  }
</script>
</head>
<body>
	<jsp:include page="admin_header.jsp" />
	<!-- Page Content -->
		
	<div class="container" style="margin-top: 150px" >

<!-- 		<div class="row" style="float: left"> -->

<!-- 			<div class="col-lg-3"> -->

<!-- 				<div class="list-group" style="width: 120px"> -->
<!-- 				<a href="addActivity" class="list-group-item">新增活動</a>  -->
<!-- 					<a href="activities" class="list-group-item">所有活動</a> -->
<%-- 					<c:forEach var="category" items="${categoryList}"> --%>
<%-- 						<a href="activities/${category}" class="list-group-item">${category}</a> --%>
						
<%-- 					</c:forEach> --%>

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		    
		<!-- /.col-lg-3 -->

		<section >
			<div class="row" >
				<c:forEach var="activity" items="${activities}">
					<div class="col-lg-4 col-sm-6 mb-4" >
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
								<p class="card-text">${activity.introduction}</p><br>
								<input type="submit" value="更新" name='updateBtn' onclick="return confirmUpdate('${activity.activityId}');"> 
           						<input type="submit" value="刪除" name='deleteBtn' onclick="return confirmDelete('${activity.activityId}');" >
								
								
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
	<jsp:include page="admin_footer.jsp" />

</body>
</html>