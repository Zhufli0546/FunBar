<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>取消活動成功</title>
<style>
</style>
</head>
<body>

	<jsp:include page="header.jsp" />
	
<div style="margin:150px auto;width: 40%;height: 600px;">
	 <div class="top">
        <h2 style="margin-bottom:0px; font-size: 4em;color :white;font-family:Copperplate;
	font-weight:bold;font-style:italic;text-decoration:underline;text-align: center;">FunBar</h2>
        <h6 style="margin-top: 0px;text-align: center;color :white;font-family:Papyrus;font-size: 1em;">CHILL&CHEER</h6>
    </div>
    <div style="margin:50px auto;width:100px;height:35px ;border: 1px gray solid;border-radius:25px;">
    <p style="color:gray ;margin-top: 6px ;font-family: 微軟正黑體;font-size:1em; text-align: center;">報名成功</p>
    </div>
    <div style="margin:auto ;width: 500px;height: 350px;border: 1px gray solid;">
    <p style="text-align: center;font-size: 1.8em;color: rgb(22, 15, 1)">${member.memberName} 你好</p><br>
<%--     <p style="text-align: center;font-size: 1.5em;color: rgb(128, 128, 128)">${activity.eventName}</p> --%>
    <p style="text-align: center;font-size: 1.5em;color: rgb(228, 121, 21)">已為你活動取消</p><br>
    <p style="text-align: center;font-size: 1.2em;color: gray;"></p><br>
    
    <a href="${pageContext.request.contextPath}/activities?index=1"
				class="list-group-item">
				<button type="button" class="btn btn-secondary">返回熱門活動</button>
			</a>
    </div>
</div>


	<div class="container" style="margin:150px auto;width: 40%;height: 600px;">

		<fieldset>
			<legend>取消報名成功</legend>
			<p>${member.memberName} 先生/小姐你好，</p>
			<p>你所報名的活動 ${activity.eventName}</p>
			<p>已為您做取消</p>


			<a href="${pageContext.request.contextPath}/activities?index=1"
				class="list-group-item">
				<button type="button" class="btn btn-outline-secondary">返回活動頁面</button>
			</a>
		</fieldset>

	</div>

	<jsp:include page="footer.jsp" />

</body>
</html>