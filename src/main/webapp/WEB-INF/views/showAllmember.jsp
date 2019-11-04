<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>showAllmember</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h1>會員管理</h1>
			</div>
	

	
	
		
			<c:forEach var='member' items='${showAllmember}'>
				<div class="col-sm-6 col-md-3" style="width: 360px; height: 360px">
					<h1>${member.id}</h1>
					<h1>${member.memberName}</h1>
					<h1>${member.memberAddress}</h1>
					<h1>${member.memberBirth}</h1>
					<h1>${member.memberPhone}</h1>
					<h1>${member.memberPwd}</h1>
					<h1>${member.memberId}</h1>
					<h1>${member.memberEmail}</h1>
					
					
				</div>
		</div>
		</div>
		</c:forEach>
		</div>
	</section>
</body>
</html>
