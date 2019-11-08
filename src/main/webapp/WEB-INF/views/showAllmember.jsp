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
<table border="1">
<tr bgcolor="#8fefa"><tr><th>會員編號<th>姓名<th>身分證<th>出生<th>住址<th>電話<th>性別<th>email
			<c:forEach var="member" items="${members}">
							<!--  隨便取                      對應Controller-->
				
					<tr>
						<td>${member.id}</td>
						<td>${member.memberName}</td>
						<td>${member.memberAddress}</td>
						<td>${member.memberBirth}</td>
						<td>${member.memberPhone}</td>
						<td>${member.memberPwd}</td>
						<td>${member.memberId}</td>
						<td>${member.memberEmail}</td>
						<td><a href="<spring:url value='deletemb?id=${member.id}' />">
								<button type="button" class="btn btn-outline-secondary">刪除</button>
						</a></td>
						<td><a href="<spring:url value='getONE?id=${member.id}' />">
								<button type="button" class="btn btn-outline-secondary">修改</button>
						</a></td>
					</tr>
				


			</c:forEach>
		</div>
	</th>
	</tr>
	</table>
	</div>
	</section>
	
</body>
</html>
