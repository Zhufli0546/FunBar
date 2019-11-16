var requestUrl = $(".requestUrl").text();
console.log(requestUrl);
let clickArray = new Array();
let pageRow = 10;
let pageRowStart = 0;
let pageRowEnd = 10;
let tododata;
let now = 1;

$(".nav-tabs a").click(function(){
	$(this).tab('show');
});

function init() {
	let txt = "<thead><tr><th>檢舉編號<th>檢舉人<th>檢舉原因<th>檢舉時間<th>被檢舉人</tr></thead>";
	reports = tododata;

	// 每頁最多筆數 ex: 第一頁最大筆數為10
	let maxRow = now * pageRow;

	// 每頁開始筆數的索引 ex: 第一頁開始筆數的索引為 0
	pageRowStart = (now - 1) * pageRow;

	// 計算每頁結束的筆數
	pageRowEnd = (reports.length < maxRow) ? reports.length : maxRow;
	console.log("Start:" + pageRowStart + " End:" + pageRowEnd);

	for (let i = pageRowStart; i < pageRowEnd; i++) {
		txt += "<tr><td>" + reports[i].reportId;
		txt += "<td>" + reports[i].reportName;
		txt += "<td><a class='showComment' data-toggle='modal' data-target='#showComment' data-showcomment='" + requestUrl 
				+ "/admin_showComment/" + reports[i].reportId + "/" + reports[i].comment.commentId + "'>" + reports[i].reportContent;
		txt += "<td>" + reports[i].reportCreatedTime;
		txt += "<td>" + reports[i].commentReportName;
		txt += "<td><a class='lockData btn btn-info' data-lock='" + requestUrl
				+ "/admin_lock/" + reports[i].comment.commentId + "'>刪除評論</a>";
	}
	$("#reportProcess").html(txt);
	hiddenContent();
	$("td").css({
		"width" : "200px",
		"height" : "80px"
	});

	// 取得頁數
	let pageNum = Math.ceil(reports.length / pageRow);
	for (var i = 0; i < pageNum; i++) {
		let ulElement = $("#showProcess");
		ulElement
				.append("<li class='page-item'><a class='page-link' href='javascript:;'>"
						+ (i + 1) + "</a></li>");
	}

	$("#showProcess li").click(function() {
		// 頁數起始筆數 結束筆數
		console.log($(this).index());
		now = $(this).index() + 1;
		console.log("目前頁數:" + now);
		$("#reportProcess").html("");
		$("#showProcess").html("");
		init();
	});
	
	$(".showComment").click(function() {
		let showCommentUrl = $(this).data("showcomment");
		$.ajax({
			url: showCommentUrl,
			method: "POST",
			dataType: "JSON",
			success: function(res) {
				let comment = res.comment;
				$(".blogTitle").html("<h4 class='modal-title blogTitle'>" + comment.blog.blogTitle + "</h4>");
				$(".commentName").html("留言者: <p class='commentName'>" + comment.commentName + "</p>");
				$(".commentCreatedTime").html("留言時間: <p class='commentCreatedTime'>" + comment.commentCreatedTime + "</p>");
				$(".commentContent").html("留言內容: <p class='commentContent'>" + comment.commentContent + "</p>");
				$(".reportName").html("檢舉人: <p class='reportName'>" + comment.reports[0].reportName + "</p>");
				$(".reportContent").html("檢舉原因: <p class='reportContent'>" + comment.reports[0].reportContent + "</p>");

			}
		})
	})
	
	$(".lockData").click(function() {
		let lockUrl = $(this).data("lock");
		$.ajax({
			url: lockUrl,
			method: "POST",
			dataType: "JSON",
			success: function() {
				console.log("success");
				$("#reportProcess").html("");
				$("#showProcess").html("");
				generateReport();
			}
		})
	})
}

function generateReport() {
	$.ajax({
		url : requestUrl + "/reportProcess",
		method : "post",
		dataType : "JSON",
		success : function(data) {
			tododata = data.reports;
			init();
		}
	});
}

generateReport();

function hiddenContent() {
	$(".blog-title").each(function() {
		let len = 10;
		let txt = $(this).text().trim();
		if (txt.length > len) {
			txt = txt.substr(0, len);
		}
		$(this).html(txt);
	});

	$(".blog-content").each(function() {
		let id = $(this).attr('data-id');
		let len = 20;
		let txt = $(this).text().trim();
		if (txt.length > len) {
			txt = txt.substr(0, len);
		}
		$(this).html(txt + " ......");
	});
}