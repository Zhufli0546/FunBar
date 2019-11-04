$(document).ready(
	function () {
		refreshLikeNumber();

		$("#likebtn").each(function () {
			if ($(this).attr("like") == 0) {
				$(this).click(function () {
					var postId = $(this).val();
					var memberId = $(this).next().val();
					$.get("unLike", { postId: postId, memberId: memberId },
						function () {
							refreshLikeNumber();
						})
					$(this).text("like").attr("like", 0);
					alert($(this).attr("like"))
				})
			} else {
				$(this).click(function () {
					var postId = $(this).val();
					var memberId = $(this).next().val();
					$.get("addLike", { postId: postId, memberId: memberId },
						function () {
							refreshLikeNumber();
						}
					)
					$(this).text("unlike").attr("like", 1);
					alert($(this).attr("like"));
				})




			}

		})
	})


function refreshLikeNumber() {
	$(".post").each(function () {
		var postId = $(this).val();
		$.get('Like', { postId: postId },
			function (data) {
				$("#" + postId).text(data + "__Likes")
			})
	})
}


//not Finish yet
function checkLike() {
	refreshLike();
	$("#likebtn").each(function () {
		if ($(this).attr("like") == 1) {
			$(this).click(function () {
				var postId = $(this).val();
				var memberId = $(this).next().val();
				$.get("unLike", { postId: postId, memberId: memberId },
					function () {
						refreshLike();
					})
				$(this).text("like").attr("like", 0);
				alert($(this).attr("like"))
			})

		}
	})
}

