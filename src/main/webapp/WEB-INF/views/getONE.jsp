<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<title>Product</title>
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
</head>

<body>
	<section>
		<div>
			<div class="container" style="text-align: center">
				<h2>會員資料</h2>
			</div>
		</div>
	</section>
	<section class="container">
		<div class="row">
			<fieldset>
				<form action="updatemb" method="POST">

					<legend>會員註冊</legend>

					<td> 姓名 :  <input type="text" name="memberName" size="20" value="${one.memberName}" /></td>
					<td> 地址:  <input type="text" name="memberAddress" size="20" value="${one.memberAddress}" />
					</td>
					<td> 生日 :  <input type="text" name="memberBirth" size="20" value="${one.memberBirth}" /></td>
					<td> 電話 :  <input type="text" name="memberPhone" size="20" value="${one.memberPhone}" /></td>
					<td> 密碼 :  <input type="text" name="memberPwd" size="20" value="${one.memberPwd}" /></td>
					<td> 帳號 :  <input type="text" name="memberId" size="20" value="${one.memberId}" /></td>
					<td> Email :  <input type="text" name="memberEmail" size="20" value="${one.memberEmail}" />
					</td>

					<div class="button">
						<input type="hidden" name="id" value="${one.id}" />
						<input type="submit" value="送出"> <input type="reset" value="清除">
					</div>
				</form>
			</fieldset>
		</div>
	</section>
</body>

</html>