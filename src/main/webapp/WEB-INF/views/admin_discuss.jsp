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
<title>admin_discuss</title>
</head>
<body class="animsition">
	<!-- Header -->
	<jsp:include page="admin_header.jsp" />

	<section class="container page">
		<!-- Table area -->
		<div class="mt-5">

			<table class='table table-striped table-dark table-hover'>
				<thead class='thead-dark'>
					<tr class=''>
						<th scope='col'>Post Id</th>
						<th scope='col'>Member Id</th>
						<th scope='col'>Post Content</th>
						<th scope='col'>Post Time</th>
						<th scope='col'>Status</th>
					</tr>
				</thead>
				<tbody id='discussTable'>
				</tbody>
			</table>


		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="admin_footer.jsp" />
	<script type="text/javascript"
		src="<c:url value='/js/admin_discuss.js'/>"></script>
</body>
</html>