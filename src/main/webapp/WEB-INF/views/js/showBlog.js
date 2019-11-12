var parentCommentId = -1;
var parentCommentName = "";
var requestUrl = $('.requestUrl').val();
var id = $("#blogId").val();

$(".commentClick").click(function () {
	submit();
})


$("#replySubmit").click(function () {
	replySubmit();
})

function submit() {
	$.ajax({
		url: requestUrl + "commentInsert",
		method: "POST",
		data: {
			memberId: $("#memberId").val(),
			blogId: $("#blogId").val(),
			parentCommentId: $("#parentCommentId").val(),
			commentContent: $("#commentContent").val()
		},
		dataType: "JSON",
		success: function (res) {
            if(JSON.stringify(res)=="{}") window.location.href="http://localhost:8080" + requestUrl + "signin";
			$("#commentBlock").html("");
			$("#commentContent").val("");
			generateTemplate();
		}
	});
}

function replySubmit() {
	$.ajax({
		url: requestUrl + "commentInsert",
		method: "POST",
		data: {
			memberId: $("#memberId").val(),
			blogId: $("#blogId").val(),
			parentCommentId: parentCommentId,
			commentContent: $("#replyComment").val()
		},
		dataType: "JSON",
		success: function (res) {
			if(JSON.stringify(res)=="{}") window.location.href="http://localhost:8080" + requestUrl + "signin";
			$("#commentBlock").html("");
			$("#replyComment").val("");
			generateTemplate();
		}
	});
}

function reportSubmit() {
	$.ajax({
		url: requestUrl + "reportInsert",
		method: "POST",
		data: {
			commentId: $(this).data("reportcommentid"),
			reportContent: $("#reportContent").val(),
			reportMemberId: $("#memberId").val()
		},
		success: function() {
			if(JSON.stringify(res)=="{}") window.location.href="http://localhost:8080" + requestUrl + "signin";
			console.log("success");
		}
	})
}

var firstComment = [];
function generateTemplate() {
	$.ajax({
		url: requestUrl + "blog/" + id,
		method: "POST",
		dataType: "JSON",
		success: function(res) {
			console.log(res);
			let commentData = res.comments;

			// 取得第一層評論
			firstComment = [];
			for(let i=0;i<commentData.length;i++) {
				if(commentData[i].parentComment == null) {
					firstComment.push(commentData[i]);
				}
			}
			generateComment();
			
			$(".replyClick").click(function () {
				parentCommentId = $(this).data("comment");
				parentCommentName = $(this).data("commentname");
				console.log("parentCommentId:" + parentCommentId);
				console.log("parentCommentName:" + parentCommentName);
				$("#replyComment").attr("placeholder", "@" + parentCommentName).focus();
			});
		}
	})

	var firstTemplate = "<p style='color:red'>{{comment.commentIds}}</p>" +
						"<h5 class='media mt-4 animated fadeIn'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50'>{{comment.commentName}}</h5>{{comment.commentContent}}" +
						"<div><label for='replyComment' class='replyClick' data-comment='{{comment.commentId}}' data-commentname='{{comment.name}}'><a class='mgl5' href='javascript:;'>回覆</a></label>" +
						"<a class='mgl5' data-toggle='modal' data-target='#reportModal' data-comment='{{comment.reportcommentid}}' href='javascript:;'>檢舉</a></div>";
	var secondTemplate = "<div style='padding-left: 100px'>" +
					     "<p style='color:red'>{{comment.commentIds}}</p>" +
					     "<div class='media mt-4 animated fadeIn'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50'>" +
					     "<h5 class='mt-0'>{{comment.commentName}}</h5></div>" +
					     "<div>{{comment.commentContent}}</div>" +
					     "<div><label for='replyComment' class='replyClick' data-comment='{{comment.commentId}}' data-commentname='{{comment.name}}'><a class='mgl5' href='javascript:;'>回覆</a></label>" +
					     "<a id='reportComment' class='mgl5' data-toggle='modal' data-target='#reportModal' data-comment='{{comment.reportcommentid}}' href='javascript:;'>檢舉</a></div>";
	var tmp;
	function generateComment() {
		for(let i=0;i<firstComment.length;i++) {
			var first_html;
			if(firstComment[i].commentName) {
				first_html = firstTemplate
				.replace("{{comment.commentIds}}", firstComment[i].commentId)
				.replace("{{comment.commentName}}", firstComment[i].commentName)
				.replace("{{comment.commentContent}}", firstComment[i].commentContent)
				.replace("{{comment.commentId}}", firstComment[i].commentId)
				.replace("{{comment.name}}", firstComment[i].commentName)
				.replace("{{comment.reportcommentid}}", firstComment[i].commentId);
			}

			$("#commentBlock").append(first_html);

			if(firstComment[i].replyComment.length>0) {
				tmp = firstComment[i].replyComment;
				var second_html;
				recursively(tmp);
			}
		}
	}
	var replys
	function recursively(tmp) {
		for(let j=0;j<tmp.length;j++) {	
			second_html = secondTemplate
				.replace("{{comment.commentIds}}", tmp[j].commentId)
				.replace("{{comment.commentName}}", tmp[j].commentName)
				.replace("{{comment.commentContent}}", tmp[j].commentContent)
				.replace("{{comment.commentId}}", tmp[j].commentId)
				.replace("{{comment.name}}", tmp[j].commentName)
				.replace("{{comment.reportcommentid}}", tmp[j].commentId);;
			$("#commentBlock").append(second_html);
			replys = tmp[j].replyComment;
			recursively(replys);
		}
	}
}
generateTemplate();