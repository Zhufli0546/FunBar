<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>已報名活動資料</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
	show();
});
	function show(){
		var ac = "${activity}";
		console.log("ac=>"+ac );
		console.log(ac.length);
		if(ac.length == 2 ){
			document.getElementById("ns").style.display="block";
			
		}
	}

</script>
  <script>
    $(function () {
      var len = 90; // 超過字數以"..."取代
      $(".card-text").each(function (i) {
        if ($(this).text().length > len) {
          $(this).attr("title", $(this).text());
          var text = $(this).text().substring(0, len - 1) + "...";
          $(this).text(text);
        }
      });
    });
    
  </script>
  
	<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
    <script type="text/javascript">
        //自訂預設值
        swal.setDefaults({
            confirmButtonText: "確定",
            cancelButtonText: "取消"
        });
        //swal.resetDefaults();//清空自訂預設值


        $(function () {
            $("input").click(function () {
                //confirm dialog範例
                let currentClick = $(this);
                swal({
                    title: "確定要取消?",
                    html: "按下確定後將取消活動",
                    type: "question",
                    showCancelButton: true//顯示取消按鈕
                }).then(
                    function (result) {
                        if (result.value) {
                            //使用者按下「確定」要做的事
                            let requestUrl = "${pageContext.request.contextPath}";
                            let memberId = currentClick.data("memberid");
                            let activityId = currentClick.data("activityid");
							
                            // ajax 非同步取消活動
							$.ajax({
								url: requestUrl + "/cancelSignup",
								method: "POST",
								data: {
									activityId: activityId,
									memberId: memberId
								},
								success: function() {
// 									window.location.href = requestUrl + "/activities?index=1";
									window.location.href = requestUrl + "/getsiqnupActivity/${member.memberId}";
									
								}
							})
							
                            
                            swal("成功", "活動已經取消", "success");
                        } else if (result.dismiss === "cancel")
                        {
                             //使用者按下「取消」要做的事
                            swal("取消", "活動未取消", "error");
                        }//end else  
                    });//end then 
            });
        });
    </script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="container" style="margin-top: 150px">
		<div class="row">
			<c:forEach var="activity" items="${activity}">

				<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
					<div class="card h-100">
						<a
							href="<spring:url value='/activity?id=${activity.activityId}' />">
							<img class="card-img-top"
							src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>">
						</a>
						<div class="card-body">
							<h4 class="card-title">
								<a
									href="<spring:url value='/activity?id=${activity.activityId}' />">${activity.eventName}</a>
							</h4>
							<p class="card-text">${activity.eventDate}</p>
							<p class="card-text">${activity.introduction}</p>
							
						</div>
						<input type="button" value="取消報名" class="btn btn-outline-secondary btn-block" data-memberid="${memberId}" data-activityid="${activity.activityId}" />
					
						 
						<a href="<spring:url value='/addSuggestion'/>">
						<button type="button" class="btn btn-outline-secondary btn-block" >我要給意見</button></a>
					</div>							
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="ns" style="height:50%; width:25%; margin:50px auto; display:none">
	<div style="height:100px;background-color:black;">
    <h2 style="margin-bottom:0px; font-size: 4em;color :white;font-family:Copperplate;
	font-weight:bold;font-style:italic;text-decoration:underline;text-align: center;">FunBar</h2>
        <h6 style="margin-top: 0px;text-align: center;color :white;font-family:Papyrus;font-size: 1em;">CHILL&CHEER</h6>
    </div >
   	<br><br>

	<h2 style="color:rgba(204, 74, 14, 0.438);font-family:微軟正黑體">還沒報名任何活動喔!!</h2><br><br>
		<a href="${pageContext.request.contextPath}/activities?index=1">
				<button type="button" class="btn btn-outline-secondary">熱門活動</button>
			</a>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>