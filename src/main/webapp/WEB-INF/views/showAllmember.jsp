<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
			<table align="center"
				style="border: 3px #FFAC55 double; padding: 5px;" rules="all";>
				<tr bgcolor="#8fefa">
				<tr>
					<th>會員編號
					<th>姓名
					<th>地址
					<th>生日
					<th>電話
					<th>密碼
					<th>帳號
					<th>email
					<th>大頭貼 
					<th>等級
					<th>功能
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
								<td>${member.memberPic}</td>
								<td>${member.memberLevel}</td>	
								
								
								


								<td><a
									href="<spring:url value='deletemb?id=${member.id}' />">
										<button type="button" class="btn btn-outline-secondary">刪除</button>
								</a></td>
								<td><a href="<spring:url value='getONE?id=${member.id}' />">
										<button type="button" class="btn btn-outline-secondary">修改</button>
								</a></td>
							</tr>
						</c:forEach>
					</th>
				</tr>

				<div>
					<td><a href="admin">
							<button type="button" class="btn btn-outline-secondary">後台管理中心</button>
					</a></td>
				</div>
		</div>
		</table>
	</section>
</body>
</html>

