$(document).ready(
	function () {
		// var postId = $("#postId").value();
		$.get('Like', {postId: "0"},
			function (data) {
				alert(data);
			})
	})