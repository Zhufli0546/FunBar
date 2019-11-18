<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>報名名單</title>
</head>

<body>
<jsp:include page="admin_header.jsp" />
		
		<div id='somedivS'></div>
		
<div class="container">
    <h2>活動報名管理</h2>
    <hr>
	<h4>活動名稱:${activity.activityId}</h4>
    <h4>報名者基本資料</h4>
    <table class="table table-dark table-hover">
      <thead>
        <tr>
          <th>姓名</th>
          <th>性別</th>
          <th>Email</th>
          <th>連絡電話</th>
          <th>編輯</th>
        </tr>
      </thead>
      <c:forEach var='al' varStatus='vs' items='${al}'>
        <tbody>
          <tr>
            <td class="tb">${al.applicantName}</td>
            <td class="tb">${al.gender} </td>
            <td class="tb">${al.applicantEmail}</td>
            <td class="tb">${al.applicantPhone}</td>
            <td class="tb"></td>

          </tr>
        </tbody>
      </c:forEach>
    </table>
  </div>

<jsp:include page="admin_footer.jsp" />
</body>
</html>