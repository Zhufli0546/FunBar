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
		
<div class="container" style="font-family:微軟正黑體; padding:15px">
    <h2>活動報名管理</h2>
    <hr>
	<h4>活動名稱：</h4>
	<h4 style="color:rgba(97, 35, 6, 0.877)">${ac.eventName}</h4><br>
    <h5>報名者基本資料</h5>
    <table class="table table-striped">
      <thead>
        <tr class="dark">
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