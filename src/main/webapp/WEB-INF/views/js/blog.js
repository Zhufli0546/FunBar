var requestUrl = "/FunBar/";
var blogTemplate = "<div class='row blogMargin box'><span class='blogMore' data-click='{{data-click}}'><i class='fas fa-align-center'></i></span><div class='col-md-5'><img src='{{blogImage}}' /></div><div class='col-md-7'><div class='blog-title'>{{blogTitle}}</div><p><span>{{blogUser}}</span><span>{{blogCreatedTime}}</span><span>文章分類:{{categoryName}}</span></p><div class='blog-content'  data-id='{{data-id}}'>{{blogContent}}</div></div></div>";
let pageRow = 5;
let pageRowStart = 0;
let pageRowEnd = 5;
let tododata;
let now = 1;

// init()
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
	let blogs = tododata;
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
			.replace("{{data-click}}", blog.blogId)
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
    
    // 未來整合個人文章才可以進行編輯及刪除
    
    $(".blogMore").each(function() {
    	let id = $(this).data('click');
    	$(this).popover({
	    	html: true,
	    	content: "Blabla",
	    	trigger: "click",
	    	content: "<div class='modifyData' data-toggle='modal' data-target='#modifyBlog' data-blog='"+id+"'>編輯文章</div>" +
	    			 "<div class='deleteData' data-blog='"+id+"'>刪除文章</div>"
	    });
	});
    
	// 編輯文章
    // blogMore 點擊事先綁定還未產生的 .modifyData .deleteData click
	$(".blogMore").click(function(){

		$(".modifyData").click(function() {
	    	let modifyBlogId = $(this).data("blog");
	    	console.log("modify = " + modifyBlogId);
	    	$.ajax({
	    		url: "http://localhost:8080" + requestUrl + "getmodifyBlog/" + modifyBlogId,
	    		method: "POST",
	    		dataType: "JSON",
	    		success: function(res) {
	    			let modifyData = res.modifyBlog;
	    			console.log(modifyData.blogId);
	    			
	    			CKEDITOR.instances["blogContent2"].destroy(true);
    				CKEDITOR.replace('blogContent2', {
	    		        height: 400,
	    		        filebrowserUploadUrl: '${pageContext.request.contextPath}/blogInsert',
	    		        filebrowserBrowseUrl: '${pageContext.request.contextPath}/blogBrowse'
	    		    });
	    			
	    			
	    			$("#blogTitle2").val(modifyData.blogTitle);
	    			$("#blogContent2").val(modifyData.blogContent);
	    		}
	    	})
		})
	})
}


// categoryinit()
$(".categoryClick").click(function() {
	let categoryId = $(this).data("category");
	$.ajax({
		url: "http://localhost:8080" + requestUrl + "blogsByCategoryId/" + categoryId,
		method: "POST",
		dataType: "JSON",
		success: function(res) {
			tododata = res.blogsByCategory;
			$(".blogs").html("");
	        $("#show").html("");
	        $(".fade.show").css({"opacity":0});

	        // 回歸第一頁
	        now = 1;
	        console.log("目前頁數" + now);
			init();
		}
	})
})


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

$(".allBlogs").click(function() {
	$(".blogs").html("");
    $("#show").html("");
    $.ajax({
    	url: "http://localhost:8080" + requestUrl + "blogJson",
    	method: "POST",
    	dataType: "JSON",
    	success: function (res) {
    		tododata = res.blogs;
    		init();
    	}
    })
})

// Like
$(".searchClick").click(function() {
	$.ajax({
		url: "http://localhost:8080" + requestUrl + "search",
		method: "POST",
		data:{
			searchKey: $(".searchValue").val()
		},
		dataType: "JSON",
		success: function(res) {
			tododata = res.blogs;
			console.log(tododata);
			$(".blogs").html("");
	        $("#show").html("");
			init();
		}
	})
})

//$("#closeLeftModal").click(function(){
//	window.location.reload();
//})