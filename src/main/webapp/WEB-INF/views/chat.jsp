<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>EasyChat</title>

    <link rel="icon" href="<c:url value="/resources/image/favicon.ico"/> " type="image/x-icon">
<!--jquery cdn-->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<!--sockJS cdn-->
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<!--stomp cdn-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<!-- Header -->
<jsp:include page="header.jsp" />
</head>
<body background="<c:url value="/resources/image/1.jpg"/> ">

<br>

<br>
<br>
<br>
<br>
<br>
<br>
<div class="wrapper">
    <div class="banner">
        <h1>EasyChat :)</h1>
        <div id="activeUserWraper">
            <span class="label label-info" id="status"></span><span class="label">位用戶在線上</span>
        </div>
    </div>
    <div id="historyMsg">
    </div>
    <div class="controls">
        <div class="items">
            <input id="uploadUrl" type="hidden" value="<c:url value="/upload/image"/> ">
            <input id="websocketUrl" type="hidden" value="<c:url value="/websocket"/> ">
            <input id="emojiBaseUri" type="hidden" value="<c:url value="/resources/media/emoji/"/> ">
            <form id="sendImageForm" enctype="multipart/form-data" method="post">
                <input id="emoji" class="btn btn-primary" type="button" value="emoji" title="emoji"/>
                <label for="sendImage" class="imageLable">
                    <input id="sendImageBtn" class="btn btn-success" type="button" value="发送图片"/>
                    <input id="sendImage" type="file" value="发送图片" name="image"
                           accept="image/jpg,image/jpeg,image/png,image/gif"/>
                </label>
                <input id="clearBtn" class="btn btn-warning" type="button" value="清屏" title="清除屏幕消息"/>
                <input id="myName" type="hidden" name="userName" value="${member.memberName}">
            </form>
        </div>
        <textarea class="form-control" id="messageInput" placeHolder="回车键发送"></textarea>
        <div id="emojiWrapper">
        </div>
    </div>
</div>



<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="<c:url value='/js/chat.js'/>">
		
	</script>
</body>
</html>