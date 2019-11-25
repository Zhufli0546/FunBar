<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">

<script src="js/addmember.js"></script> 
<script type="text/javascript"
		src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>">
		
	</script>
</head>
<style>
.error { color: red}
</style>
<body> 

    <form:form modelAttribute="Member" class="login" action="joinus" method="POST"
    enctype="multipart/form-data" >
        <legend>會員註冊</legend>
<td><p> 姓名 : </p> <form:input autocomplete="off" id="memberName" type="text" path="memberName" /></td>
<span id="noName"></span>
<span class="error">${errorMsg.errUserName}</span>
<td><p> 地址: </p> <form:input type="text" path="memberAddress"  value=""/></td>
<span class="error">${errorMsg.errAddress}</span>
<td><p> 生日 : </p> <form:input type="date" path="memberBirth"  value=""/> </td>
<span class="error">${errorMsg.errBirth}</span>
<td><p> 電話 : </p> <form:input type="text" path="memberPhone"  value=""/></td>
<span class="error">${errorMsg.errPhone}</span>
<td><p> 帳號 : </p> <form:input autocomplete="off" id="memberId" type="text" path="memberId"  value=""/></td>
<span id="noId"></span>
<span class="error">${errorMsg.errId}</span>
<td><p> 密碼 : </p> <form:input autocomplete="off" id="memberPwd" type="text"  path="memberPwd"  value=""/></td>
<span id="noPwd"></span>
<span class="error">${errorMsg.errPwd}</span>
<td><p> Email : </p> <form:input type="text" path="memberEmail"  value=""/></td>
<span class="error">${errorMsg.errEmail}</span>
<td><p> 大頭貼 : </p> <form:input path = "memberimg" type ="file"   maxlength="40"/> </td>
      <br> <button type="submit">送出</button>
        <button type="reset">清除</button>
</form:form>
</body>
</html>