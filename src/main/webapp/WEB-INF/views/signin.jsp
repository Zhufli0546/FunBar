<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>signin</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container" style="margin-top: 150px">

    <div class="row" style="float: left">
      <div class="col-lg-3">     
    </div>
    </div>
<h1 color="red">${error}</h1>
	<form action="showAllmember" method="POST">
		 <fieldset>
        <legend>Form Check</legend>
        <div class="str1">
            <label for="account">姓名</label>
            <input type="text" id="a" name="memberName" placeholder="輸入姓名">
            <span id="namesp"></span>
            <br>
            <p>(1.不可空白2.至少兩個字以上3.必須全部為中文字)</p>

        </div>
        <div class="str2">
            <label for="pwd">密碼</label>
            <input type="password" id="pwd" name="memberPwd" size="6" placeholder="請輸入密碼">
            <span id="idsp"></span>
            <br>
            <p>(1.不可空白2.至少6個字包含字母、數字、特殊符號)</p>
        </div>
			<div>
				<input type="submit" value="登入">
			</div>
		</fieldset>
	</form>
</body>
</html>