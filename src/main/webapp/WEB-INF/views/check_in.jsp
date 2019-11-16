<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理</title>

  <script src="/FunBar/ad_vendor/jquery/jquery.min.js"></script>


</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />
	
	
	<div class="row container col-md-6" style="border:1px solid black;height:500px;margin-left:50px">
	
		<div class="row container col-md-12">
	<c:forEach var="r" items="${allroom}">
	<div style="float:left">
		
<c:choose>
	
   <c:when test="${r.status =='1' }">
   <button type="button" class="room" style="width:130px;height:60px;border:1px solid black;background-color:orange">${r.room}<br>${r.room_number}</button>
   </c:when>
   
   <c:otherwise>
   <button type="button" class="room" style="width:130px;height:60px;border:1px solid black">${r.room}<br>${r.room_number}</button> 
   </c:otherwise>
  
</c:choose>
		
		
		

	</div>
	</c:forEach>
	
	
	</div>
	</div>
	
	
	
	
	<div class="col-md-4" style="margin-left:20px">
	<c:forEach var="o" items="${orders}">
	<button class="bt" data-toggle="modal" data-target="#myModal" type="button" value="${o.order_id}"style="border:1px solid black; height:30px;width:200px;">${o.order_id} - ${o.order_name} - ${o.rooms}</button>
	</c:forEach>
	</div>

	
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> Check in</h4>
            </div>
            <form id="form_data" method="post" action="update_room_status">
            <div class="modal-body">
                入住房號: <input type="text" id="room_number" name="room_number"/>
            <input id="od" type="hidden" name="order_id">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
                <button type="submit" onclick="add_info()" class="btn btn-primary">確定</button>
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<script>

$(".bt").click(function(){
		var index = $(this).index();
		var od = $(".bt").eq(index).val();

		$("#od").val(od);

})




</script>


  	<script type="text/javascript"
		src="<c:url value='/ad_vendor/animsition/js/animsition.min.js' />"></script>
   <!-- Bootstrap core JavaScript-->
   
   
  <script src="<c:url value='/ad_vendor/jquery/jquery.min.js' />"></script>


  <script src="<c:url value='/ad_vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
  <script src="<c:url value='/ad_vendor/jquery-easing/jquery.easing.min.js' />"></script>

  <!-- Page level plugin JavaScript-->
  <script src="<c:url value='/ad_vendor/chart.js/Chart.min.js' />"></script>
  <script src="<c:url value='/ad_vendor/datatables/jquery.dataTables.js' />"></script>
  <script src="<c url value='/ad_vendor/datatables/dataTables.bootstrap4.js' />"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value='/ad_js/sb-admin.min.js' />"></script>

  <!-- Demo scripts for this page-->
  <script src="<c:url value='/ad_js/demo/datatables-demo.js' />"></script>
  <script src="<c url value='/ad_js/demo/chart-area-demo.js' />"></script>
</body>
</html>