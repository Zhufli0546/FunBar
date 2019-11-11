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
		
<div class="container">
    <h2>活動報名管理</h2>
    <hr>
    <table class="table table-dark table-hover">
      <thead>
        <tr>
          <th>活動名稱</th>
          <th>報名者Id</th>
          <th>名字</th>
          <th>性別</th>
          <th>Email</th>
          <th>連絡電話</th>
          <th>編輯</th>
        </tr>
      </thead>
      <c:forEach var='al' varStatus='vs' items='${al}'>
        <tbody>
          <tr>
            <td class="tb"><img class="card-img-top" src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>">
            </td>
            <td class="tb">${activity.eventName}</td>
            <td class="tb">${al.applicantId}</td>
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
		
<!-- <section class="pricing py-5"> -->
<!--   <div class="container"> -->
<!--     <div class="row"> -->
<!--       Free Tier -->
<!--       <div class="col-lg-4"> -->
<!--         <div class="card mb-5 mb-lg-0"> -->
<!--           <div class="card-body"> -->
<!--             <h5 class="card-title text-muted text-uppercase text-center">Free</h5> -->
<!--             <h6 class="card-price text-center">$0<span class="period">/month</span></h6> -->
<!--             <hr> -->
<!--             <ul class="fa-ul"> -->
<!--               <li><span class="fa-li"><i class="fas fa-check"></i></span>Single User</li> -->
<!--               <li><span class="fa-li"><i class="fas fa-check"></i></span>5GB Storage</li> -->
<!--               <li><span class="fa-li"><i class="fas fa-check"></i></span>Unlimited Public Projects</li> -->
<!--               <li><span class="fa-li"><i class="fas fa-check"></i></span>Community Access</li> -->
<!--               <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Unlimited Private Projects</li> -->
<!--               <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Dedicated Phone Support</li> -->
<!--               <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Free Subdomain</li> -->
<!--               <li class="text-muted"><span class="fa-li"><i class="fas fa-times"></i></span>Monthly Status Reports</li> -->
<!--             </ul> -->
<!--             <a href="#" class="btn btn-block btn-primary text-uppercase">Button</a> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       </div> -->
<!--       </div> -->
<!--       </section> -->

<jsp:include page="admin_footer.jsp" />
</body>
</html>