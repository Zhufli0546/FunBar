//createPost 
var requestUrl = "/FunBar/";
var newPost = "<div class='card-header'>Create Post</div>"
		+ "<div class='media p-4 bg-light'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50' />"
		+ "<div class='media-body text-md-left ml-md-2 ml-0'>"
		+ "<h5><a href='#' class='text-primary'>memberId</a></h5>"
		+ "<form method='post' action='createPost'>"
		+ "<textarea id='postContent' name='postContent' class='form-control' placeholder='What is on your mind ?'></textarea>"
		+ "<div class='text-right'><br><button class='btn btn-info lg' type='submit' name='submitPost'>POST</button></div>"
		+ "</form:form></div></div></div>";

var firstLevelComment = "<div class='card' id='firstComment'>"
		+ "<div class='media p-4 bg-light'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50'>"
		+ "<div class='media-body text-md-left ml-md-2 ml-0' id='firstCommentBody{{post.postId}}'>"
		+ "<h5><a href='' class='text-primary'>{{post.memberId}}</a></h5>"
		+ "<div class='media-date'>{{post.postTime}}"
		+ "<button type='button' class='btn-sm ml-2 btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></button>"
		+ "<div class='dropdown-menu'><a class='dropdown-item' id='edit{{post.postId}}' href='#'>Edit</a>"
		+ "<a class='dropdown-item' id='delete{{post.postId}}' href='#'>Delete</a>"
		+ "</div></div>"
		+ "<form method='post' action='updateContent'>"
		+ "<blockquote class='blockquote mb-5'><div id='postContent{{post.postId}}' class='font-weight-bold mt-2 mr-4 post-description'>{{post.postContent}}</div></blockquote>"
		+ "</form>"
		+ "<form method='post' action='replyComment'>"
		+ "<div class='text-right'>"
		+ "<div class='position:absolute; mr-2' id='likeCount{{post.postId}}'>0 Like</div>"
		+ "<button id='likebtn{{post.postId}}' type='button' class='btn btn-outline-primary' value='{{post.postId}}'>"
		+ "<span id='likeStatus{{post.postId}}'>Like</span></button>"
		+ "<button type='button' style='display:none' value='{{post.memberId}}'></button>"
		+ "<a class='btn btn-outline-success btn-circle ml-2 text-uppercase' data-toggle='collapse' href='#comment{{post.postId}}'>"
		+ "<span class='glyphicon glyphicon-comment' id='commentCount{{post.postId}}'>0 comment</span></a>"
		+ "<a class='btn btn-outline-info btn-circle ml-2 text-uppercase' href='#replyComment{{post.postId}}' data-toggle='collapse' id='reply'>"
		+ "<span class='glyphicon glyphicon-share-alt'>Reply</span></a>"
		+ "<div class='collapse' id='replyComment{{post.postId}}'>"
		+ "<div class='input-group card-body'>"
		+ "<input id='postContent' name='postContent' class='form-control' type='text' placeholder='Reply...'></input>"
		+ "<input id='parentPostId' name='parentPostId' class='form-control' type='hidden' value='{{post.postId}}'></input>"
		+ "<button class='btn btn-info' type='submit' name='submitPost'>Post</button>"
		+ "</div></div></div></form></div></div></div><br>";

var level = "<div class='collapse' id='comment{{post.postId}}'>"

var secondLevelComment = "<div class='card mt-3' id='secondComment'>"
		+ "<div class='media p-4 bg-light'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50'>"
		+ "<div class='media-body text-md-left ml-md-2 ml-0'id='secondCommentBody{{post.postId}}' >"
		+ "<h5><a href='' class='text-primary'>{{post.memberId}}</a></h5>"
		+ "<div class='media-date'>{{post.postTime}}"
	    + "<button type='button' class='btn-sm ml-2 btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></button>"
		+ "<div class='dropdown-menu'><a class='dropdown-item' id='edit{{post.postId}}' href='#'>Edit</a>"
		+ "<a class='dropdown-item' id='delete{{post.postId}}' href='#'>Delete</a>"
		+ "</div></div>"
		+ "<form method='post' action='updateContent'>"
		+ "<blockquote class='blockquote mb-5'><div id='postContent{{post.postId}}' class='font-weight-bold mt-2 post-description'>{{post.postContent}}</div></blockquote>"
		+ "</form>"
		+ "<form method='post' action='replyComment'>"
		+ "<div class='text-right'>"
		+ "<div class='position:absolute; mr-2' id='likeCount{{post.postId}}'>0 Like</div>"
		+ "<button id='likebtn{{post.postId}}' type='button' class='btn btn-outline-primary' value='{{post.postId}}'>"
		+ "<span id='likeStatus{{post.postId}}'>Like</span></button>"
		+ "<button type='button' style='display:none' value='{{post.memberId}}'></button>"
		+ "<a class='btn btn-outline-success btn-circle ml-2 text-uppercase' data-toggle='collapse' href='#comment{{post.postId}}'>"
		+ "<span class='glyphicon glyphicon-comment' id='commentCount{{post.postId}}'>0 comment</span></a>"
		+ "<a class='btn btn-outline-info btn-circle ml-2 text-uppercase' href='#replyComment{{post.postId}}' data-toggle='collapse' id='reply'>"
		+ "<span class='glyphicon glyphicon-share-alt'></span>Reply</a><div class='collapse' id='replyComment{{post.postId}}'>"
		+ "<div class='input-group card-body'>"
		+ "<input id='postContent' name='postContent' class='form-control' type='text' placeholder='Reply...'></input>"
		+ "<input id='parentPostId' name='parentPostId' class='form-control' type='hidden' value='{{post.postId}}'></input>"
		+ "<button class='btn btn-info' type='submit' name='submitPost'>Post</button>"
		+ "</div></div></form></div></div></div></div>";

var thirdLevelComment = "<div class='card mt-3 ml-5' id='thirdComment'>"
		+ "<div class='media p-4 bg-light'><img class='d-flex mr-3 rounded-circle' src='http://placehold.it/50x50'>"
		+ "<div class='media-body text-md-left ml-md-2 ml-0'>"
		+ "<h5><a href='' class='text-primary'>{{post.memberId}}</a></h5>"
		+ "<div class='media-date'>{{post.postTime}}<button type='button' class='btn-sm ml-2 btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></button>"
		+ "<div class='dropdown-menu'><a class='dropdown-item' id='edit{{post.postId}}' href='#'>Edit</a>"
		+ "<a class='dropdown-item' id='delete{{post.postId}}' href='#'>Delete</a>"
		+ "</div></div> "
		+ "<form method='post' action='updateContent'>"
		+ "<blockquote class='blockquote mb-5'><div id='postContent{{post.postId}}' class='font-weight-bold mt-2 post-description'>{{post.postContent}}</div></blockquote>" 
		+ "</form>"
		+ "<div class='text-right'>"
		+ "<div class='position:absolute; mr-2' id='likeCount{{post.postId}}'>0 Like</div>"
		+ "<button id='likebtn{{post.postId}}' type='button' class='btn btn-outline-primary' value='{{post.postId}}'>"
		+ "<span id='likeStatus{{post.postId}}'>Like</span></button>"
		+ "<button type='button' style='display:none' value='{{post.memberId}}'></button>"
		+ "</div></div></div></div>";

var data;
var firstLevelComment_html = null;
var secondLevelComment_html = null;
var secondLevel_html = null;
var thirdLevelComment_html = null;
var thirdLevel_html = null;

$.ajax({
	url : "http://localhost:8080" + requestUrl + "discussJson",
	method : "POST",
	dataType : "JSON",
	success : function(postData) {

		$("#newPost").append(newPost);
		data = postData.Post

		for (let i = 0; i < data.length; i++) {
			let post = data[i];

			if (post.parentPostId == null) {

				firstLevelComment_html = firstLevelComment.replace(
						/\{{post.memberId}}/g, post.memberId).replace(
						/\{{post.postTime}}/g, post.postTime).replace(
						/\{{post.postContent}}/g, post.postContent).replace(
						/\{{post.postId}}/g, post.postId)

				$("#firstLevelComment").append(firstLevelComment_html);

				refreshCommentNumber(post.postId, post.replyPost.length)
				refreshLikeNumber(post.postId)
				addLike(post.postId, post.memberId)
				editContent(post.postId, post.postContent)
				deleteContent(post.postId)

				if (post.replyPost.length > 0) {
					let second = "";
					let commentPostId = "";

					for (let j = 0; j < post.replyPost.length; j++) {
						let comment = post.replyPost[j];

						secondLevelComment_html = secondLevelComment
								.replace(/\{{post.parentPostId}}/g,
										comment.parentPostId)
								.replace(/\{{post.memberId}}/g,
										comment.memberId)
								.replace(/\{{post.postTime}}/g,
										comment.postTime).replace(
										/\{{post.postContent}}/g,
										comment.postContent).replace(
										/\{{post.postId}}/g, comment.postId)

						if (comment.replyPost.length > 0) {
							let third = "";
							for (let k = 0; k < comment.replyPost.length; k++) {
								let thirdComment = comment.replyPost[k];

								thirdLevelComment_html = thirdLevelComment
										.replace(/\{{post.parentPostId}}/g,
												thirdComment.parentPostId)
										.replace(/\{{post.memberId}}/g,
												thirdComment.memberId).replace(
												/\{{post.postTime}}/g,
												thirdComment.postTime).replace(
												/\{{post.postContent}}/g,
												thirdComment.postContent)
										.replace(/\{{post.postId}}/g,
												thirdComment.postId)

								third += thirdLevelComment_html;

							}

							thirdLevel_html = level.replace(
									/\{{post.postId}}/g, comment.postId)
							thirdLevel_html = thirdLevel_html + third;

							commentPostId = comment.postId;

						}

						second += secondLevelComment_html;

					}

					secondLevel_html = level.replace(/\{{post.postId}}/g,
							post.postId)
					secondLevel_html = secondLevel_html + second;

					$("#firstCommentBody" + post.postId).append(
							secondLevel_html);
					$("#secondCommentBody" + commentPostId).append(
							thirdLevel_html);

				}
			}

			for (let j = 0; j < post.replyPost.length; j++) {
				let comment = post.replyPost[j];

				refreshCommentNumber(comment.postId, comment.replyPost.length)
				refreshLikeNumber(comment.postId)
				addLike(comment.postId, comment.memberId)
				editContent(comment.postId, comment.postContent)
				deleteContent(comment.postId)

				for (let k = 0; k < comment.replyPost.length; k++) {
					let thirdComment = comment.replyPost[k];

					refreshLikeNumber(thirdComment.postId)
					addLike(thirdComment.postId, thirdComment.memberId)
					editContent(thirdComment.postId, thirdComment.postContent)
					deleteContent(thirdComment.postId)

				}
			}

		}
	}
})

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
												+ "<div class='text-right mt-2'><button class='btn btn-primary' type='submit' name='editContent'>Edit</button>" 
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

