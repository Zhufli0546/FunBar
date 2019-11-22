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
<link rel="stylesheet" href="css/memberadd.css">
</head>

<body> 
    <form:form modelAttribute="Member" class="login" action="joinus" method="POST"
    enctype="multipart/form-data" >
        <legend>會員註冊</legend>
<td><p> 姓名 : </p> <form:input type="text" path="memberName"  value=""/></td>
<td><p> 地址: </p> <form:input type="text" path="memberAddress"  value=""/></td>
<td><p> 生日 : </p> <form:input type="text" path="memberBirth"  value=""/> </td>
<td><p> 電話 : </p> <form:input type="text" path="memberPhone"  value=""/></td>
<td><p> 密碼 : </p> <form:input type="text" id="input1" path="memberPwd"  value=""/></td>
<td><p> 帳號 : </p> <form:input type="text" path="memberId"  value=""/></td>
<td><p> Email : </p> <form:input type="text" path="memberEmail"  value=""/></td>
<td><p> 大頭貼 : </p> <form:input path = "memberimg" type ="file"   maxlength="40"/> </td>
      <br> <button type="submit">送出</button>
        <button type="reset">清除</button>
</form:form>
</body>
</html>