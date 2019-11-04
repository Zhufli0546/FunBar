var parentCommentId = -1;
var parentCommentName = "";
var requestUrl = "/FunBar/";
var id = $("#blogId").val();

$(".commentClick").click(function () {
	submit();
})


$("#replySubmit").click(function () {
	replySubmit();
})

function submit() {
	$.ajax({
		url: "http://localhost:8080" + requestUrl + "commentInsert",
		method: "POST",
		data: {
			memberId: $("#memberId").val(),
			blogId: $("#blogId").val(),
			parentCommentId: $("#parentCommentId").val(),
			commentContent: $("#commentContent").val()
		},
		dataType: "JSON",
		success: function (res) {
			window.location.reload();

		}
	});
}

function replySubmit() {
	$.ajax({
		url: "http://localhost:8080" + requestUrl + "commentInsert",
		method: "POST",
		data: {
			memberId: $("#memberId").val(),
			blogId: $("#blogId").val(),
			parentCommentId: parentCommentId,
			commentContent: $("#replyComment").val()
		},
		dataType: "JSON",
		success: function (res) {
			window.location.reload();
		}
	});
}
var commentData;
var firstComment = [];
function generateTemplate() {
	$.ajax({
		url: "http://localhost:8080" + requestUrl + "blog/" + id,
		method: "POST",
		dataType: "JSON",
		success: function(res) {
			console.log(res);
			commentData = res.comments;

			// 取得第一層評論
			for(let i=0;i<commentData.length;i++) {
				if(commentData[i].parentComment == null) {
					firstComment.push(commentData[i]);
				}
			}
			generateComment();
			
			$(".replyClick").click(function () {
				parentCommentId = $(this).data("comment");
				parentCommentName = $(this).data("name");
				console.log("parentCommentId:" + parentCommentId);
				console.log("parentCommentName:" + parentCommentName);
				$("#replyComment").attr("placeholder", "@" + parentCommentName).focus();
			});
		}
	})

	var firstTemplate = "<p style='color:red'>{{comment.commentIds}}</p><h5 class='media mt-4'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50'>{{comment.commentName}}</h5>{{comment.commentContent}}<label for='replyComment' class='col-md-2 replyClick' data-comment='{{comment.commentId}}' data-name='allen'><a href='javascript:;'>回覆</a></label>";
	var secondTemplate = "<div style='padding-left: 100px'><p style='color:red'>{{comment.commentIds}}</p><div class='media mt-4'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50'><div class='media-body'><h5 class='mt-0'>{{comment.commentName}}</h5>{{comment.commentContent}}</div><label for='replyComment' class='col-md-2 replyClick' data-comment='{{comment.commentId}}' data-name='allen'><a href='javascript:;'>回覆</a></label></div></div>";
	var tmp;
	function generateComment() {
		for(let i=0;i<firstComment.length;i++) {
			var first_html;
			if(firstComment[i].commentName) {
				first_html = firstTemplate
				.replace("{{comment.commentIds}}", firstComment[i].commentId)
				.replace("{{comment.commentName}}", firstComment[i].commentName)
				.replace("{{comment.commentContent}}", firstComment[i].commentContent)
				.replace("{{comment.commentId}}", firstComment[i].commentId);
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
			$("#commentBlock").append(second_html);
			replys = tmp[j].replyComment;
			recursively(replys);
		}
	}
}
generateTemplate();