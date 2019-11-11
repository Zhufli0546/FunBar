<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動報名</title>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container" style="margin: 150px 10% 150px 60%; width: 30% ">
		<h5>填寫報名者資訊</h5>
		<hr>

		<form action="applicantSignup" method='POST'
			enctype="multipart/form-data">

			<div class="form-group">
				<label for="name">姓名:</label> <input name="applicantName"
					type="text" class="form-control" value="" id="name" required
					autofocus />
			</div>


			<div class="form-group">
				<label for="gender">性別:</label> <input name="gender" type="text"
					class="form-control" value="" id="gender" />
			</div>

			<div class="form-group">
				<label for="phone">手機號碼:</label> <input name="applicantPhone"
					type="text" class="form-control" value="" id="phone" required />
			</div>

			<div class="form-group">
				<label for="email">e-mail:</label> <input name="applicantEmail"
					type="text" class="form-control" value="" id="email" required />
			</div>

			<div class="form-group">
				<label for="id"></label> <input name="activityId" type="hidden"
					class="form-control" value="${activity.activityId}" id="id" />
			</div>

			<button
				class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
				type="submit">確認報名</button>
			<div class="text-center">
				<a class="small" href="#">活動資訊</a>
			</div>
		</form>
		
		<section>
			<div class="row">
				
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top"
							src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>">
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
			</div>
		</section>

	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>