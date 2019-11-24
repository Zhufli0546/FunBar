<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">





</script>
<head>
<title>login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" href="css/member.css">
</head>
<body>


 <form action="signin" class="login" method="post">
<fieldset>
<h2>登入</h2>
<i class="fa fa-user-circle-o"></i>
<h5>帳號</h5>
<input type="text"  name="memberId" placeholder="請輸入帳號">
<span class="error">${errorMsg.errUserName}</span>
<h5>密碼</h5>
<input type="password" name="memberPwd" placeholder="請輸入密碼">
<span class="error">${errorMsg.errPassword}</span>
<span><a href="memberforget">忘記密碼</a></span>
<button type="submit">登入</button>


 </fieldset>
  <span>沒有帳號嗎?</span><span><a href="joinus">註冊</a></span>
<!-- <input type="button" value="一鍵輸入" onclick="enterSomething()"/> -->
 </form>




</body>
</html>
<script src="<c:url value='/js/jquery-1.12.4.js' />"></script>
<script src="<c:url value='/js/bootstrap.min.js' />"></script>