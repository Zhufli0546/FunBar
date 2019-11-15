<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
 <meta charset="UTF-8">
 <title>login</title>
 <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
 <script src="<c:url value='/js/jquery-1.12.4.js' />"></script>
 <script src="<c:url value='/js/bootstrap.min.js' />"></script>
</head>
<style>
    * {
        font-family: 微軟正黑體;
    }

    html,
    body {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #eee;
    }

    .login {
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        padding: 20px;
        margin-bottom: 10px;
        font-weight: bold;
    }

    .registerBox {
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        padding: 10px;
        font-weight: bold;
    }

    .registerBox a {
        text-decoration: none;
    }
    
    .error { color: red}
</style>

<body>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	
	
</head>

<body>

		<div class="row">
			
			<h2>會員資料</h2>
			
				<form action="updatemb" method="POST" enctype="multipart/form-data">

					<fieldset>
					<div class="form-group">
                        <label for="memberId">姓名:</label>
                        <input type="text" class="form-control" name="memberName" value="${one.memberName}">
						<label for="memberAddress">地址:</label>
                        <input type="text" class="form-control" name="memberAddress" value="${one.memberAddress}">
						<label for="memberAddress">生日:</label>
                        <input type="text" class="form-control" name="memberBirth" value="${one.memberBirth}">
						<label for="memberAddress">電話:</label>
                        <input type="text" class="form-control" name="memberPhone" value="${one.memberPhone}">
						<label for="memberAddress">密碼:</label>
                        <input type="password" class="form-control" name="memberPwd" value="${one.memberPwd}">
                        <label for="memberAddress">帳號:</label>
                        <input type="text" class="form-control" name="memberId" value="${one.memberId}">
                        <label for="memberAddress">信箱:</label>
                        <input type="text" class="form-control" name="memberEmail" value="${one.memberEmail}">
                        <label for="memberAddress">大頭貼:</label>
                        <input type="file" class="form-control" name="memberimg" value="${one.memberimg}">
				</div>

					<div class="button">
						<input type="hidden" name="id" value="${one.id}" />
						<input button type="button" class="btn btn-outline-secondary" value="送出"> 
						<td><a href="${pageContext.request.contextPath}">
							<button type="button" class="btn btn-outline-secondary">回首頁</button>
					</a></td>
					</div>
				</form>
			</fieldset>
		</div>
	</section>
</body>

</html>