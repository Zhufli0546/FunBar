<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend</title>
<!-- Header -->
<jsp:include page="header.jsp" />
</head>
<body class="animsition bg-dark">
	<br>

	<section class="container page">
		<div class="row mt-5">
			<!-- Member detail block -->
			<div class="col-md-2 fixed-top"
				style="margin: 192px 120px; width: 200px">
				<div class="list-group">
					<p class="list-group-item list-group-item-action active">${title}</p>
					<a href="" class="list-group-item list-group-item-action"
						id="loginMemberName">${sessionScope.member.memberName}</a> <a
						href="" class="list-group-item list-group-item-action"
						id="loginMemberid" style="display: none">${sessionScope.member.id}</a>
					<a href="" class="list-group-item list-group-item-action"
						id="requestUrl" style="display: none">${pageContext.request.contextPath}/</a>
					<a href="${pageContext.request.contextPath}/discuss"
						class="list-group-item list-group-item-action ">討論區</a>
						<a href="${pageContext.request.contextPath}/chat"
						class="list-group-item list-group-item-action ">聊天</a>
				</div>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="navFriendList"
							data-toggle="tab" href="#FriendList" role="tab"
							aria-controls="nav-home" aria-selected="true">好友列表</a> <a
							class="nav-item nav-link" id="navReceiver" data-toggle="tab"
							href="#Receiver" role="tab" aria-controls="nav-profile"
							aria-selected="false">交友邀請</a>
						<!-- <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact"
							role="tab" aria-controls="nav-contact" aria-selected="false">Contact</a> -->
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="FriendList"
						role="tabpanel" aria-labelledby="nav-home-tab">


						<br>
						<textarea rows="8" cols="50" id="clientMsg"></textarea>
						<br>
						<button onclick="send()">Send</button>
						<br> <label>Response from Server</label> <br>
						<textarea rows="8" cols="50" id="serverMsg" readonly="readonly"></textarea>


					</div>
					<div class="tab-pane fade" id="Receiver" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<table class='table table-striped table-dark table-hover'>
							<thead class='thead-dark'>
								<tr class=''>
									<th scope='col'>Friend Pic</th>
									<th scope='col'>Friend Name</th>
									<th scope='col'>Friend Birth</th>
									<th scope='col'>Friend Request</th>
								</tr>
							</thead>
							<tbody id='friendshipTable'>
							</tbody>
						</table>


					</div>
					<!-- <div class="tab-pane fade" id="nav-contact" role="tabpanel"
						aria-labelledby="nav-contact-tab">...</div> -->
				</div>
			</div>

		</div>
	</section>
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="<c:url value='/js/friend.js'/>">
		
	</script>
</body>
</html>