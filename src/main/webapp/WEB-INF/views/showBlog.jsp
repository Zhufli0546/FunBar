<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>showBlog</title>
</head>
<style>
	.blogContent img {
		max-width: 650px !important;
		max-height: auto !important;
	}

	.categoryBlock:hover { background-color: #eee;}

	@media(max-width: 600px) {
		.blogContent img {
			max-width: 480px !important;
		}
	}
</style>
<body>
	<!-- Header -->
	<jsp:include page="header.jsp" />

	<!-- content 區塊 -->
	<div style="padding: 50px" class="container row page animsition">
		<!-- Post Content Column -->
		<div class="col-md-8" style="margin: 0 auto;">
			<!-- Title -->
			<h1 style="word-break: break-all;" class="mt-4">${blog.blogTitle}</h1>
			<!-- Author -->
			<p class="lead">
				by<a href="#">allen</a>
			</p>
			<hr>
			<!-- Date/Time -->
			<p>${blog.blogCreatedTime}</p>
			<hr>
			<!-- Preview Image -->
			<img class="img-fluid rounded" src="${blog.blogImage}" alt="">
			<hr>
			<!-- Post Content -->
			<div class="blogContent">${blog.blogContent}</div>
			<hr>

			<!-- Comments Form -->
			<div class="card my-4">
				<h5 class="card-header">Leave a Comment:</h5>
				<div class="card-body">
					<div class="form-group">
						<textarea id="commentContent" name="commentContent" class="form-control" rows="3"></textarea>
					</div>
					<input type="hidden" id="memberId" name="memberId" value="${sessionScope.member.memberId}" />
					<input type="hidden" id="blogId" name="blogId" value="${blog.blogId}" />
					<input type="hidden" id="parentCommentId" name="parentCommentId" value="-1" />
					<button class="btn btn-primary commentClick">Submit</button>
				</div>
			</div>

			<!-- Comment with nested comments -->
			<div class="media mb-4">
				<div id="commentBlock" class="media-body">

				</div>
			</div>
			<div class="media mt-4 row">
				<input type="text" id="replyComment" class="col-md-8 form-control" placeholder="請輸入評論訊息..." />
				<button id="replySubmit" class="btn btn-primary">送出</button>
			</div>
		</div>
	</div>

<!-- Footer -->
<jsp:include page="footer.jsp" />
<script src="<c:url value='/js/showBlog.js'/>"></script>
</body>
</html>