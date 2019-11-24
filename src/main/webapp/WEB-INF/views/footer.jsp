<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<footer class="bg1">

		<div class="end-footer bg2">
			<div class="container">
				<div class="flex-sb-m flex-w p-t-22 p-b-22">
					<div class="p-t-5 p-b-5">
						<a href="#" class="fs-15 c-white"><i class="fa fa-tripadvisor"
							aria-hidden="true"></i></a> <a href="#" class="fs-15 c-white"><i
							class="fa fa-facebook m-l-18" aria-hidden="true"></i></a> <a href="#"
							class="fs-15 c-white"><i class="fa fa-twitter m-l-18"
							aria-hidden="true"></i></a>
					</div>

					<div class="txt17 p-r-20 p-t-5 p-b-5">
						Copyright &copy; 2018 All rights reserved | This template is made
						with <i class="fa fa-heart"></i> by <a href="https://colorlib.com"
							target="_blank">Colorlib</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- Back to top -->
	<div class="btn-back-to-top bg0-hov" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="fa fa-angle-double-up" aria-hidden="true"></i>
		</span>
	</div>


	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>">
		
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/animsition/js/animsition.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/bootstrap/js/popper.js"/>">
		
	</script>
	<script type="text/javascript"
		src="<c:url value="/vendor/bootstrap/js/bootstrap.min.js"/>">
		
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/select2/select2.min.js"/>"></script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/daterangepicker/moment.min.js"/>">
		
	</script>
	<script type="text/javascript"
		src="<c:url value="/vendor/daterangepicker/daterangepicker.js"/>">
		
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/slick/slick.min.js"/>"></script>
	<script type="text/javascript"
		src="<c:url value="/js/slick-custom.js"/>">
		
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/parallax100/parallax100.js"/>"></script>
	<script type="text/javascript">
		$('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/countdowntime/countdowntime.js"/>">
		
	</script>
	<!--===============================================================================================-->
	<script type="text/javascript"
		src="<c:url value="/vendor/lightbox2/js/lightbox.min.js"/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value="/js/main.js"/>"></script>

	<!-- Test Notification -->
	<!--sockJS cdn-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
	<!--stomp cdn-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/web-socket-js/1.0.0/web_socket.js"></script>
		<input id="websocketUrl" type="hidden" value="<c:url value="/websocket"/> ">
	<script>
	window.addEventListener('load', function () {
		  // At first, let's check if we have permission for notification
		  // If not, let's ask for it
		  if (Notification && Notification.permission !== "granted") {
		    Notification.requestPermission(function (status) {
		      if (Notification.permission !== status) {
		        Notification.permission = status;
		      }
		    });
		  }
		  var button = document.getElementsByTagName('button')[0];
		  button.addEventListener('click', function () {
		    // If the user agreed to get notified
		    if (Notification && Notification.permission === "granted") {
		      var n = new Notification("Hi!");
		    }
		    // If the user hasn't told if he wants to be notified or not
		    // Note: because of Chrome, we are not sure the permission property
		    // is set, therefore it's unsafe to check for the "default" value.
		    else if (Notification && Notification.permission !== "denied") {
		      Notification.requestPermission(function (status) {
		        if (Notification.permission !== status) {
		          Notification.permission = status;
		        }
		        // If the user said okay
		        if (status === "granted") {
		          var n = new Notification("Hi!");
		        }
		        // Otherwise, we can fallback to a regular modal alert
		        else {
		          alert("Hi!");
		        }
		      });
		    }
		    // If the user refuses to get notified
		    else {
		      // We can fallback to a regular modal alert
		      alert("Hi!");
		    }
		  });
		});
	function connectNotification() {
		var socket = new SockJS($("#websocketUrl").val().trim());
		stompClient = Stomp.over(socket);
		var sessionId = "";
		stompClient.connect({}, function(frame) {
			stompClient.subscribe("/topic/notification", function(notification) {
				var json = JSON.parse(notification.body);
				var note = json.notification;
				console.log("notification == " + note)
				var n = new Notification(note);
			});
		})
	}
	$(document).ready(function() {
		connectNotification();
	})
	</script>

</body>

</html>