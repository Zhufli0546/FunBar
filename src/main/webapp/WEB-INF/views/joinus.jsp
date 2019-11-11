<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>註冊會員</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body> 
<jsp:include page="admin_header.jsp" />

<div>   
<fieldset> 
    <form:form modelAttribute="Member" action="joinus" method="POST" >
    
        <legend>會員註冊</legend>
      
<td><b> 姓名 : </b> <form:input type="text" path="memberName" size="20" value=""/></td>
<td><b> 地址: </b> <form:input type="text" path="memberAddress" size="20" value=""/></td>
<td><b> 生日 : </b> <form:input type="text" path="memberBirth" size="20" value=""/> </td>
<td><b> 電話 : </b> <form:input type="text" path="memberPhone" size="20" value=""/></td>
<td><b> 密碼 : </b> <form:input type="text" path="memberPwd" size="20" value=""/></td>
<td><b> 帳號 : </b> <form:input type="text" path="memberId" size="20" value=""/></td>
<td><b> Email : </b> <form:input type="text" path="memberEmail" size="20" value=""/></td>

 
    <div class="button">
        <input type="submit" value="送出">
        <input type="reset" value="清除">
    </div>
</form:form>
       </fieldset>
</div>
</body>
</html>