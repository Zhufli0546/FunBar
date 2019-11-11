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


<div>   
<fieldset> 
    <form:form modelAttribute="Member" action="joinus" method="POST" >
    
        <legend>會員註冊</legend>
      
<td><p> 姓名 : </p> <form:input type="text" path="memberName" size="20" value=""/></td>
<td><p> 地址: </p> <form:input type="text" path="memberAddress" size="20" value=""/></td>
<td><p> 生日 : </p> <form:input type="text" path="memberBirth" size="20" value=""/> </td>
<td><p> 電話 : </p> <form:input type="text" path="memberPhone" size="20" value=""/></td>
<td><p> 密碼 : </p> <form:input type="text" path="memberPwd" size="20" value=""/></td>
<td><p> 帳號 : </p> <form:input type="text" path="memberId" size="20" value=""/></td>
<td><p> Email : </p> <form:input type="text" path="memberEmail" size="20" value=""/></td>
<td><p> 大頭貼 : </p> <form:input type="file" path="memberPic" value=""/></td>
 
    <div class="button">
        <input type="submit" value="送出">
        <input type="reset" value="清除">
    </div>
</form:form>
       </fieldset>
</div>
</body>
</html>