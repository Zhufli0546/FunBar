<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
<link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" />
<!--sockJS cdn-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<!--stomp cdn-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/web-socket-js/1.0.0/web_socket.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" type="text/css" href="<c:url value="/css/chat.css"/>">
<jsp:include page="header.jsp" />
</head>
<body class="bg-dark">
	<br>
	<div class="col-md-2 fixed-top"
		style="margin: 150px 120px; width: 200px; display: none">
		<div class="list-group">
			<p class="list-group-item list-group-item-action active">${title}</p>
			<a href="" class="list-group-item list-group-item-action"
				id="loginMemberName_chatbox">${sessionScope.member.memberName}</a> <a
				href="" class="list-group-item list-group-item-action"
				id="loginMemberid_chatbox" style="display: none">${sessionScope.member.id}</a>
			<a href="" class="list-group-item list-group-item-action"
				id="requestUrl_chatbox" style="display: none">${pageContext.request.contextPath}/</a>
			<a href="${pageContext.request.contextPath}/discuss"
				class="list-group-item list-group-item-action ">討論區</a> 
			<a href="${pageContext.request.contextPath}/chat"
				class="list-group-item list-group-item-action ">聊天</a> 
			<input id="websocketUrl" type="hidden" value="<c:url value="/websocket"/> ">
<%-- 			<input id="emojiBaseUri" type="hidden"
				value="<c:url value="/resources/media/emoji/"/> "> --%>
		</div>
	</div>
	<div class="container page">
		<div id="frame">
			<div id="sidepanel">
				<div id="profile">
					<div class="wrap">
						<img id="profile-img" src="<c:url value='/membergetPicture/${member.id}'/>" class="online"/>
						<p style="font-family: 'Russo One', sans-serif; font-size:20px;">${sessionScope.member.memberName}</p>
						<i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>
						<div id="status-options">
							<ul>
								<li id="status-online" class="active"><span
									class="status-circle"></span>
									<p>Online</p></li>
								<li id="status-away"><span class="status-circle"></span>
									<p>Away</p></li>
								<li id="status-busy"><span class="status-circle"></span>
									<p>Busy</p></li>
								<li id="status-offline"><span class="status-circle"></span>
									<p>Offline</p></li>
							</ul>
						</div>
						<div id="expanded">
							<label for="twitter"><i class="fa fa-facebook fa-fw"
								aria-hidden="true"></i></label> <input name="twitter" type="text"
								value="mikeross" /> <label for="twitter"><i
								class="fa fa-twitter fa-fw" aria-hidden="true"></i></label> <input
								name="twitter" type="text" value="ross81" /> <label
								for="twitter"><i class="fa fa-instagram fa-fw"
								aria-hidden="true"></i></label> <input name="twitter" type="text"
								value="mike.ross" />
						</div>
					</div>
				</div>
				<div id="search">
					<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
					<input type="text" placeholder="Search contacts..." />
				</div>
				<div id="contacts">
					<ul id="receiverArea">
					</ul>
				</div>
				<div id="bottom-bar">
					<button id="addcontact">
						<i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Add
							contact</span>
					</button>
					<button id="settings">
						<i class="fa fa-cog fa-fw" aria-hidden="true"></i> <span>Settings</span>
					</button>
				</div>
			</div>
			<div class="content">
				<div class="contact-profile">
					<img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
					<p id="receiverMemberName"></p>
					<div class="social-media">
						<i class="fa fa-facebook" aria-hidden="true"></i> <i
							class="fa fa-twitter" aria-hidden="true"></i> <i
							class="fa fa-instagram" aria-hidden="true"></i>
					</div>
				</div>
				<div class="messages">
					<ul id="conversation">
					</ul>
				</div>
				<div class="message-input">
					<div class="wrap">
						<input type="text" id="messageInput" placeholder="Write your message..." /> <i
							class="fa fa-paperclip attachment" aria-hidden="true"></i>
						<button class="submit">
							<i class="fa fa-paper-plane" aria-hidden="true"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="<c:url value='/js/chat.js'/>"></script>
</body>
</html>