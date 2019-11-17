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
	
<div class="container" style="margin-top: 150px">
	<div class="row" style="margin: 150px 10% 150px 60%; width: 30% ;font-family:微軟正黑體">
		
		<fieldset style="border:2px;">
			<legend>填寫報名者資訊</legend>
		
		
		<form action="applicantSignup" method='POST'>

			<div class="form-group">
				<label for="name">姓名:</label> <input name="applicantName"
					type="text" class="form-control" value="${member.memberName}" id="name" required
					autofocus />
			</div>

			<div class="form-group">
				<label for="gender">性別:</label> <br>
				<input type="radio" name="gender"  value="女" id="gender" />女
				<input type="radio" name="gender"  value="男" id="gender" />男
			</div>

			<div class="form-group">
				<label for="phone">手機號碼:</label> <input name="applicantPhone"
					type="text" class="form-control" value="${member.memberPhone}" id="phone" required />
			</div>

			<div class="form-group">
				<label for="email">e-mail:</label> <input name="applicantEmail"
					type="text" class="form-control" value="${member.memberEmail}" id="email" required />
			</div>

			<div class="form-group">
				<label for="id"></label> <input name="activityId" type="hidden"
					class="form-control" value="${activity.activityId}" id="id" />
			</div>
			
			<div class="form-group">
				<label for="mid"></label> <input name="memberId"
					class="form-control" value="${member.memberId}" id="mid" type="hidden" />
			</div>

			<button
				class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
				type="submit">確認報名</button>
			<div class="text-center">
				<a class="small" href="#">活動資訊</a>
			</div>
		</form>
		</fieldset>
	</div>
</div>
			
				
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
			
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>