<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="<c:url value='/vendor/jquery/jquery-3.2.1.min.js' />"></script>
  <script src="<c:url value='/vendor/slick/slick.js' />"></script>
	
	
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>


<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</head>


    
    <body onload="go()">

	<!-- Header -->
	<jsp:include page="header.jsp" />



		
	<section class="page animsition">
		

    <!-- Jumbotron Header -->
    <header>
	<img style="height: 450px;width:100%;border:2px solid red;border-radius-bottom:10px" src="images/room_00.jpg" alt="" title="" style="border:5px solid black;border-radius:5px">
    </header>
<div style="height:30px;width:100%;text-align:center;font-size:22px;background-color:orange;"><span>選擇房型</span></div>
    <!-- Page Features -->
    <div id="yyyyy" class="row text-center slider single-item" style="margin:0 auto;">


	<c:forEach var="room" items="${okroom}">
      <div class="col-lg-3 col-md-6 mb-4">
        <div class="card h-100">
          <img style="height:150px" class="card-img-top" src="room/${room.room_id}" alt="">
          <div class="card-body">
            <h4 class="card-title">${room.room_type}</h4>
          </div>
          <div class="card-footer">
          <form method="post" action="confirm_order">
          
          <input type="hidden" name="room_id" value="${room.room_id}">
          <input type="hidden" name="date" value="${date}">
          <input type="hidden" name="stay" value="${stay}">
          <input type="hidden" name="rooms" value="${rooms}">
          <button class="btn btn-default" style="float:left;border:1px solid black;border-radius:5px" type="button" data-toggle="modal" data-target="#mymodal${room.room_id}">詳細資料</button>
          <input class="btn btn-warning" style="background-color:#84C1FF;border:1px solid black;float:right" type="submit" value="選擇此房型">
          
          </form>
            <!-- <a href="#" class="btn btn-primary">選擇此房型</a> -->
          </div>
        </div>
      </div>
      
      <div class="modal fade" id="mymodal${room.room_id}">
    <div class="modal-dialog" style="width:350px;">
        <div class="modal-content">
            <div class="modal-header" style="text-align:center;">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">客房資訊</h4>
            </div>
            <div class="modal-body">
                <img src="${pageContext.request.contextPath}/room/${room.room_id}" alt="" title="" height="200px"
							width="320px" style="margin:5px;border:5px solid black;border-radius:5px"><br>
				<table style="text-align: center;margin:0 auto">
						<tr><td>床:</td><td>${room.room_bed}</td></tr>
						<tr><td>房型:</td><td>${room.room_type}</td></tr>
						<tr><td>坪數:</td><td>${room.room_pings}坪</td></tr>
						<tr><td>容納人數:</td><td>${room.room_people}人</td></tr>
						</table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</c:forEach>

	
     

    </div>
    <!-- /.row -->

  
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />



	
	<script>

function go() {
	$('html,body').animate({scrollTop:400},2000);
	}
</script>
</body>

</html>