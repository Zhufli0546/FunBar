<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	

	
</head>


    
    <body>

	<!-- Header -->
	<jsp:include page="header.jsp" />



		
	<section class="page animsition">
		

    <!-- Jumbotron Header -->
    <header>
	<img  style="height: 450px;width:100%;margin-bottom:50px;border:2px solid red;border-radius-bottom:10px" src="images/room_00.jpg" alt="" title="" style="border:5px solid black;border-radius:5px">
    </header>

    <!-- Page Features -->
    <div class="row text-center" style="margin:0 auto">


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
          <input type="submit" value="選擇此房型">
          <button type="button" id="abc" onclick="openwin()" value="${room.room_id}">詳細資料</button>
          </form>
            <!-- <a href="#" class="btn btn-primary">選擇此房型</a> -->
          </div>
        </div>
      </div>
</c:forEach>
     

    </div>
    <!-- /.row -->

  
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	
	<script>
function openwin(){

	  var id =  $("#abc").val();
    window.open("room_info/"+id, "newwindow", "height=400, width=400, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no")
}
</script>
</body>

</html>