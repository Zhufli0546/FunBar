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
		txt += "<td>" + reports[i].reportContent;
		txt += "<td>" + reports[i].reportCreatedTime;
		txt += "<td>" + reports[i].commentReportName;
		txt += "<td><a class='lockData' href='" + requestUrl
				+ "admin_delete/" + reports[i].blogId + "'>封鎖</a>";
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
}

$.ajax({
	url : requestUrl + "/reportProcess",
	method : "post",
	dataType : "JSON",
	success : function(data) {
		tododata = data.reports;
		init();
	}
});

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