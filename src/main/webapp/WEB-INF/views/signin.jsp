<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style> 
input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}
</style>
<head>
<meta charset="UTF-8">

<title>signin</title>
</head>
<body>
<c:set var="go" value="" scope="session"></c:set>
	<jsp:include page="header.jsp" />
	<div class="container" style="margin-top: 150px">

		<div class="row" style="float: left">
			<div class="col-lg-3"></div>
		</div>
<H1>會員登入</H1>

<form action="signin" method="POST">
  <label >帳號</label>
  <input type="text"  name="memberId">
  <label >密碼</label>
  <input type="text"  name="memberPwd">
   <input type="submit"  value="登入">
</form>

</body>
</html>
