<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動參加者意見</title>
<style>
    body,
    title {
      font-family: "微軟正黑體";
    }

    td {
      width: 200px;
    }
    
    table {
      table-layout: fixed;
    }
    .container{
		font-family:微軟正黑體;
		margin: 100px auto 150px auto; width: 80%;
	}
  </style>
</head>
<body>

<jsp:include page="admin_header.jsp" />
<div class="container">
    <h2>--活動名稱--</h2><br>
    <h2 style="color:rgba(58, 26, 11, 0.877)">${eventName}</h2><br>
    <hr>
    
    <table class="table table-dark table-striped">
      <thead>
        <tr>
          <th>使用者ID</th>
          <th>姓名</th>
          <th>E-mail</th>
          <th>意見內容</th>
        </tr>
      </thead>
      <c:forEach var='su' varStatus='status' items='${su}'>
        <tbody>
          <tr>
            <td class="tb">${su.memberId}</td>
            <td class="tb">${su.memberName}</td>
            <td class="tb">${su.memberEmail}</td>
            <td class="tb">${su.suggestion} </td>        
          </tr>
        </tbody>
      </c:forEach>
    </table>
  </div>


  <jsp:include page="admin_footer.jsp" />


</body>
</html>