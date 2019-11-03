<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<title>Discuss</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/discuss.css"/>">

</head>
<body class="animsition" style="background-color: black;">
	<!-- Header -->
	<jsp:include page="header.jsp" />

	<br>
	<br>
	<br>
	<section class="container page">
		<div class="row">
			<!-- Member detail block -->
			<div class="col-md-3">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action active">
						${title}</a> <a href="" class="list-group-item list-group-item-action"></a>
					<a href="" class="list-group-item list-group-item-action"></a>
				</div>
			</div>

			<div class="col-md-6">
				<!--the create new post block-->
				<div class="card">
					<div class="card-header">Create Post</div>
					<div class="card-body">
						<form:form method="post" modelAttribute="Post"
							class="from-horizontal">
							<blockquote class="blockquote mb-0">
								<form:input path="postContent" class="form-control"
									name="postBody" type="text"
									placeholder="What's on your mind ? "></form:input>
							</blockquote>
							<div class="text-right">
								<br>
								<button class="btn btn-info  btn-sm" type="submit"
									name="submitPost">Post</button>
							</div>
						</form:form>
					</div>
				</div>
				<br>

				<!-- 第一層Post -->
				<c:forEach var="post" items="${post}">
					<c:if test="${post.parentPostId==null}">
						<div class="card">
							<div class="card-body">
								<p>${post.memberId}</p>
								<%-- 								<p>${post.Like.memberId}</p> --%>
								<blockquote class="blockquote mb-0">
									<div class="font-weight-bold">${post.postContent}</div>
								</blockquote>

								<!--時間顯示 未完成 -->
								<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
								<div class="text-right">
									<br>
									<%-- 									<p>dataBase = ${post.postTime.time}</p> --%>
									<%-- 									<p>JSTL = ${date.time}</p> --%>
									<c:set var="postInterval"
										value="${(date.time-post.postTime.time)/1000*60*60}" />

									<%-- 									<p>${date}</p> --%>
									<p>${post.postTime}</p>
									<%-- 									<p>差距 ： ${postInterval}</p> --%>
									<br>
									<form:form method="post" modelAttribute="Post"
										class="from-horizontal">
										<div class="input-group mb-6">
											<form:input path="parentPostId" type="hidden" id="postId"
												value="${post.postId}"></form:input>
											<form:input path="postContent" class="form-control"
												name="replyBody" type="text" placeholder="Reply..."></form:input>
											<button class="btn btn-info  btn-sm" type="submit"
												name="submitPost">Reply</button>
										</div>
									</form:form>

									<!-- 第二層留言 -->
									<c:forEach var="childPost" items="${reply}">
										<c:if test="${post.postId==childPost.parentPostId}">
											<div class="card">
												<div class="card-body">
													<div class="text-left">
														<p>${childPost.postContent}</p>
													</div>
												</div>
											</div>

											<form:form method="post" modelAttribute="Post"
												class="from-horizontal">
												<div class="input-group mb-6">
													<form:input path="parentPostId" type="hidden"
														value="${childPost.postId}"></form:input>
													<form:input path="postContent" class="form-control"
														type="text" placeholder="Reply..."></form:input>
													<button class="btn btn-info  btn-sm" type="submit"
														name="submitPost">Reply</button>
												</div>
											</form:form>

											<!-- 第三層留言 -->
											<c:forEach var="childPost2" items="${reply2}">
												<c:if test="${childPost.postId==childPost2.parentPostId}">
													<div class="card">
														<div class="card-body">
															<div class="text-left">
																<p>${childPost2.postContent}</p>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</c:if>
									</c:forEach>
								</div>
							</div>
						</div>
						<br>
					</c:if>
				</c:forEach>

			</div>
			<!-- friend request block -->
			<div class="col-md-3">
				<div style="background-color: black">
					<div class="col-md-12">Friend request</div>
					<div class="col-md-12" style="margin-top: 100px;">
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="search_screen_name"
								placeholder="search friends" aria-describedby="button-addon2">
							<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button"
									onclick="searchFriend()">search</button>
							</div>
						</div>
						<div id="search_result" class="list-group"></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="<c:url value="/js/discuss.js"/>"></script>
</body>
</html>