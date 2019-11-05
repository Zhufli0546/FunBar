var requestUrl = "/FunBar/";
var blogTemplate = "<div class='row blogMargin box'><div class='col-md-5'><img src='{{blogImage}}' /></div><div class='col-md-7'><div class='blog-title'>{{blogTitle}}</div><p><span>{{blogUser}}</span><span>{{blogCreatedTime}}</span><span>文章分類:{{categoryName}}</span></p><div class='blog-content'  data-id='{{data-id}}'>{{blogContent}}</div></div></div>";
let clickArray = new Array();
let pageRow = 5;
let pageRowStart = 0;
let pageRowEnd = 5;
let tododata;
let now = 1;
$.ajax({
	url: "http://localhost:8080" + requestUrl + "blogJson",
	method: "POST",
	dataType: "JSON",
	success: function (res) {
		tododata = res.blogs;
		init();
		
	}
})

function init() {
	blogs = tododata;
	// 每頁最多筆數 ex: 第一頁最大筆數為10
    let maxRow = now * pageRow;

    // 每頁開始筆數的索引 ex: 第一頁開始筆數的索引為 0
    pageRowStart = (now - 1) * pageRow;
    
    // 計算每頁結束的筆數
    pageRowEnd = (blogs.length < maxRow) ? blogs.length : maxRow;
    console.log("Start:" + pageRowStart + " End:" + pageRowEnd);

	for (let i = pageRowStart; i < pageRowEnd; i++) {
		let blog = blogs[i];
		var blog_html = blogTemplate
			.replace("{{data-id}}", blog.blogId)
			.replace("{{blogImage}}", blog.blogImage)
			.replace("{{blogTitle}}", blog.blogTitle)
			.replace("{{blogUser}}", "allen")
			.replace("{{blogCreatedTime}}", blog.blogCreatedTime)
			.replace("{{categoryName}}", blog.category.categoryName)
			.replace("{{blogContent}}", blog.blogContent);
		$(".blogs").append(blog_html);
	}
	$(".box").addClass("animated zoomIn");
	blogContent = hiddenContent();
	
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
        $(".blogs").html("");
        $("#show").html("");
        init(); 
    });
}


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
		let len = 100;
		let txt=$(this).text().trim();
	  if(txt.length>len){
		txt=txt.substr(0,len);
	  }
	  $(this).html(txt+" ......<div><a class='btn btn-info page-btn' href='http://localhost:8080" + requestUrl + "blog/" + id + "'>閱讀詳細內容</a></div>");
  });
}

function preview(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			var resultArea = '#imgArea img';
			$(resultArea).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

$('#blog_img').on('change', function () {
	preview(this);
});