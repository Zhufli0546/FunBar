var requestUrl = $('.requestUrl').val();
let clickArray = new Array();
let pageRow = 5;
let pageRowStart = 0;
let pageRowEnd = 5;
let tododata;
let now = 1;

function init() {
    let txt = "<thead><tr><th>部落格編號<th>部落格縮圖<th>部落格標題<th>部落格內容<th>建立時間<th>刪除部落格</tr></thead>";
    blogs = tododata;
    
    // 每頁最多筆數 ex: 第一頁最大筆數為10
    let maxRow = now * pageRow;

    // 每頁開始筆數的索引 ex: 第一頁開始筆數的索引為 0
    pageRowStart = (now - 1) * pageRow;
    
    // 計算每頁結束的筆數
    pageRowEnd = (blogs.length < maxRow) ? blogs.length : maxRow;
    console.log("Start:" + pageRowStart + " End:" + pageRowEnd);

    for (let i = pageRowStart; i < pageRowEnd; i++) {
        txt += "<tr><td>" + blogs[i].blogId;
        txt += "<td><img class='card-img-top' src='" + blogs[i].blogImage + "'>";
        txt += "<td class='blog-title'>" + blogs[i].blogTitle;
        txt += "<td class='blog-content overflowH'>" + blogs[i].blogContent;
        txt += "<td>" + blogs[i].blogCreatedTime;
        txt += "<td><a class='deleteData' href='" + requestUrl + "admin_delete/" + blogs[i].blogId + "'>刪除</a>";
    }    
    $("#demo").html(txt);
    hiddenContent();
    $("td").css({"width":"200px", "height":"110px"});

    // 取得頁數
    let pageNum = Math.ceil(blogs.length / pageRow);
    for (var i = 0; i < pageNum; i++) {
        let ulElement = $("#show");
        ulElement.append("<li class='page-item'><a class='page-link' href='javascript:;'>" + (i + 1) + "</a></li>");
    }

    $("#show li").click(function () {
        // 頁數起始筆數 結束筆數
        console.log($(this).index());
        now = $(this).index() + 1;
        console.log("目前頁數:" + now);
        $("#demo").html("");
        $("#show").html("");
        init(); 
    });
}

$.ajax({
    url: requestUrl + "admin_blog",
    method: "post",
    dataType: "JSON",
    success: function (data) {
    	tododata = data.blogs;
        init();
    }
});

function hiddenContent() {
	$(".blog-title").each(function() {
		let len = 10;
		let txt=$(this).text().trim();
		if(txt.length>len){
			txt=txt.substr(0,len);
		}
		$(this).html(txt);
	});

	$(".blog-content").each(function(){
		let id = $(this).attr('data-id');
		let len = 20;
		let txt=$(this).text().trim();
	  if(txt.length>len){
		txt=txt.substr(0,len);
	  }
	  $(this).html(txt+" ......");
  });
}