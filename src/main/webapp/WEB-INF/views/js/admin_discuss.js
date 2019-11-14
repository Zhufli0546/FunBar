//createPost 
var requestUrl = "/FunBar/";
var table = "<tr><th scope='row'>{{post.postId}}</th>" +
		"<td>{{post.memberId}}</td>" +
		"<td>{{post.postContent}}</td>" +
		"<td>{{post.postTime}}</td>" +
		"<td>{{post.status}}</td>" +
		"</tr>"

var data;


$.ajax({
	url : "http://localhost:8080" + requestUrl + "discussJson",
	method : "POST",
	dataType : "JSON",
	success : function(postData) {
		let tableArea = "";
		data = postData.Post

		for (let i = 0; i < data.length; i++) {
			let post = data[i];
			

//			if (post.parentPostId == null) {

				table_html = table.replace(/\{{post.memberId}}/g, post.memberId)
				.replace(/\{{post.postTime}}/g, post.postTime)
				.replace(/\{{post.postContent}}/g, post.postContent)
				.replace(/\{{post.postId}}/g, post.postId)
				.replace(/\{{post.status}}/g, post.status)

				tableArea += table_html;
				
				

//				refreshCommentNumber(post.postId, post.replyPost.length)
//				refreshLikeNumber(post.postId)
//				addLike(post.postId, post.memberId)
//				editContent(post.postId, post.postContent)
//				deleteContent(post.postId)

//				if (post.replyPost.length > 0) {
//					let second = "";
//					let commentPostId = "";
//
//					for (let j = 0; j < post.replyPost.length; j++) {
//						let comment = post.replyPost[j];
//
//						secondLevelComment_html = secondLevelComment
//								.replace(/\{{post.parentPostId}}/g,
//										comment.parentPostId)
//								.replace(/\{{post.memberId}}/g,
//										comment.memberId)
//								.replace(/\{{post.postTime}}/g,
//										comment.postTime).replace(
//										/\{{post.postContent}}/g,
//										comment.postContent).replace(
//										/\{{post.postId}}/g, comment.postId)
//
//						if (comment.replyPost.length > 0) {
//							let third = "";
//							for (let k = 0; k < comment.replyPost.length; k++) {
//								let thirdComment = comment.replyPost[k];
//
//								thirdLevelComment_html = thirdLevelComment
//										.replace(/\{{post.parentPostId}}/g,
//												thirdComment.parentPostId)
//										.replace(/\{{post.memberId}}/g,
//												thirdComment.memberId).replace(
//												/\{{post.postTime}}/g,
//												thirdComment.postTime).replace(
//												/\{{post.postContent}}/g,
//												thirdComment.postContent)
//										.replace(/\{{post.postId}}/g,
//												thirdComment.postId)
//
//								third += thirdLevelComment_html;
//
//							}
//
//							thirdLevel_html = level.replace(
//									/\{{post.postId}}/g, comment.postId)
//							thirdLevel_html = thirdLevel_html + third;
//
//							commentPostId = comment.postId;
//
//						}
//
//						second += secondLevelComment_html;
//
//					}
//
//					secondLevel_html = level.replace(/\{{post.postId}}/g,
//							post.postId)
//					secondLevel_html = secondLevel_html + second;
//
//					$("#firstCommentBody" + post.postId).append(
//							secondLevel_html);
//					$("#secondCommentBody" + commentPostId).append(
//							thirdLevel_html);
//
//				}
//			}

//			for (let j = 0; j < post.replyPost.length; j++) {
//				let comment = post.replyPost[j];
//
//				refreshCommentNumber(comment.postId, comment.replyPost.length)
//				refreshLikeNumber(comment.postId)
//				addLike(comment.postId, comment.memberId)
//				editContent(comment.postId, comment.postContent)
//				deleteContent(comment.postId)
//
//				for (let k = 0; k < comment.replyPost.length; k++) {
//					let thirdComment = comment.replyPost[k];
//
//					refreshLikeNumber(thirdComment.postId)
//					addLike(thirdComment.postId, thirdComment.memberId)
//					editContent(thirdComment.postId, thirdComment.postContent)
//					deleteContent(thirdComment.postId)
//
//				}
//			}

				
		}
		
		$("#discussTable").append(tableArea);
	}
})
//}

function refreshLikeNumber(postId) {
	$.get('Like', {
		postId : postId
	}, function(data) {
		$("#likeCount" + postId).text(data + "  Likes")
	})
}

// like 未完成
function addLike(postId, memberId) {
	$("#likebtn" + postId).click(function() {
		$.get("addLike", {
			postId : postId,
			memberId : memberId
		}, function() {
		})
		$(this).text("unLike");
		$(this).attr("id", "unLikebtn" + postId);
		unLike(postId, memberId);
		refreshLikeNumber(postId);
	})
}

function unLike(postId, memberId) {
	$("#unLikebtn" + postId).click(function() {
		$.get("unLike", {
			postId : postId,
			memberId : memberId
		}, function() {
		})
		$(this).text("Like");
		$(this).attr("id", "likebtn" + postId);
		addLike(postId, memberId);
		refreshLikeNumber(postId);
	})
}

function editContent(postId, postContent) {
	$("#edit" + postId).click(function() {
						$("#postContent" + postId)
								.html("<textarea id='postContent' name='postContent' class='form-control mt-3'>" + postContent + "</textarea>"
												+ "<div class='text-right mt-2'><button class='btn btn-primary' type='submit' name='editContent' onclick='reloadPage()'>Edit</button>" 
												+ "<input id='postId' name='postId' class='form-control' type='hidden' value='" + postId + "'></input>"
												+ "<button class='btn btn-warning ml-2' name='cancel' id='cancel" + postId + "'>Cancel</button></div>");
						$("#cancel" + postId).click(function() {
							$("#postContent" + postId).html(postContent);
						})	

					})
}

function deleteContent(postId) {
	$("#delete" + postId).click(function() {
		if(confirm("真的要刪除此則留言嗎？")){
						$.get("deleteContent", {postId : postId}, function(){
							
							})
						}
					})	

				}



function refreshCommentNumber(postId, commentCount) {
	$("#commentCount" + postId).text(commentCount + "  Comments");

}

