var requestUrl = "/FunBar/";
var blogTemplate = "<div class='row blogMargin'><div class='col-md-5'><img src='{{blogImage}}' /></div><div class='col-md-7'><div class='blog-title'>{{blogTitle}}</div><p><span>{{blogUser}}</span><span>{{blogCreatedTime}}</span><span>文章分類:{{categoryName}}</span></p><div class='blog-content'  data-id='{{data-id}}'>{{blogContent}}</div></div></div>";
var data;
$.ajax({
	url: "http://localhost:8080" + requestUrl + "blogJson",
	method: "POST",
	dataType: "JSON",
	success: function (res) {
		data = res.blogs;
		for (let i = 0; i < data.length; i++) {
			let blog = data[i];

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
		blogContent = hiddenContent();
	}
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