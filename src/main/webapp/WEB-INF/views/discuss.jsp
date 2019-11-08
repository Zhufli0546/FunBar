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
<!-- Header -->
<jsp:include page="header.jsp" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/discuss.css'/>">
</head>

<body class="animsition">
	<br>
	<br>
	<!-- Body -->
	<section class="container page">
		<div class="row">

			<!-- Member detail block -->
			<div class="col-md-2">
				<div class="list-group">
					<a href="#" class="list-group-item list-group-item-action active">${title}</a>
					<a href="" class="list-group-item list-group-item-action">會員大頭貼</a>
					<a href="" class="list-group-item list-group-item-action">會員帳號</a>
					<a href="" class="list-group-item list-group-item-action">儲存留言</a>
					<a href="" class="list-group-item list-group-item-action">好友</a>
				</div>
			</div>

			<!-- Post area -->
			<!--create new post block-->
			<div class="col-md-7">
				<div class='card' id="newPost"></div>
				<br>
				<!-- 第一層Post -->
				<div id="firstLevelComment">
				<!-- 第二層Post -->
				</div>
			</div>


			<!-- friend request block -->
			<div class="col-md-3" style="background-color: white;">
				<br>
				<div class="col-md-12 font-weight-bold">Friend request</div>
				<div class="col-md-12" style="margin-top: 50px;">
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
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="<c:url value='/js/discuss.js'/>">
		
	</script>
</body>

</html>