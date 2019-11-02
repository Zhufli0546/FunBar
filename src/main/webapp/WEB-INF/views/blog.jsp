<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>blog</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/blog.css"/>">
</head>
<body>
    <!-- Header -->
    <jsp:include page="header.jsp" />

    <!-- content 區塊 -->
    <div class="container page">
        <div class="row col-md-12">
            <div class="row col-md-10">
                <div class="col-md-5">
                    <img src="https://cdn.jevelin.shufflehound.com/wp-content/uploads/2016/02/Blog_1-1024x683.jpg" />
                </div>
                <div class="col-md-7">
                    <div>The team watchers</div>
                    <p>
                        <span>by allen</span>
                        <span>2019-10-29</span>
                        <span>文章分類:寵物</span>
                    </p>
                    <p class="blog-content">
                        Vivamus condimentum purus in lorem molestie fermentum. Nulla suscipit nibh eu ultricies
                        pellentesque. Fusce consectetur velit eu tristique dapibus. Donec et lobortis massa, vitae
                        lacinia elit. Proin dolor dui, tempus eu leo vitae, congue venenatis augue. Morbi pharetra urna
                        quis lectus pulvinar, non tincidunt purus…
                    </p>
                </div>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-info page-btn" data-toggle="modal"
                    data-target="#createBlog">新增文章</button>
                <button type=" button" class="btn btn-light page-btn">全部文章</button>
            </div>
        </div>
        <hr>
        <div class="row col-md-12">
            <div class="row col-md-10">
                <div class="col-md-5">
                    <img src="https://cdn.jevelin.shufflehound.com/wp-content/uploads/2016/02/Blog_1-1024x683.jpg" />
                </div>
                <div class="col-md-7">
                    <div>The team watchers</div>
                    <p>
                        <span>by allen</span>
                        <span>2019-10-29</span>
                        <span>文章分類:寵物</span>
                    </p>
                    <p class="blog-content">
                        Vivamus condimentum purus in lorem molestie fermentum. Nulla suscipit nibh eu ultricies
                        pellentesque. Fusce consectetur velit eu tristique dapibus. Donec et lobortis massa, vitae
                        lacinia elit. Proin dolor dui, tempus eu leo vitae, congue venenatis augue. Morbi pharetra urna
                        quis lectus pulvinar, non tincidunt purus…
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal right fade" id="createBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                </div>

                <div class="modal-body">
                    <form enctype="multipart/form-data" method="post" action="blogPost">
                        <div class="row">
                            <div class="col-md-2">
                                <!-- 圖片區域 -->
                                <label
                                    style="cursor: pointer; background-color: #eee; padding: 2px; border-radius: 2px;">
                                    <input type="file" name="blogImage" id="blog_img" style="display: none;"> <i
                                        class="fa fa-photo"></i>上傳圖片
                                </label>
                                <!-- 圖片顯示區塊 -->
                                <div id="imgArea" title="" style="padding: 20px;">
                                    <img class="imgArea" style="width: 100px; height: auto">
                                </div>
                            </div>

                            <div class="col-md-10">
                                <div class="form-group row">
                                    <label for="categoryId" class="col-md-2">文章分類:</label> <select
                                        class="form-control col-md-5" id="categoryId" name="categoryId">
                                        <c:forEach var="category" items="${categoryList}">
                                            <option value="${category.categoryId}">${category.categoryName}</option>
                                        </c:forEach>

                                    </select>
                                </div>

                                <div class="form-group row">
                                    <label for="blogTitle" class="col-md-2">文章標題:</label> <input type="text"
                                        id="blogTitle" name="blogTitle" class="form-control col-md-5">
                                </div>

                                <div class="form-group row">
                                    <label for="blogContent" class="col-md-2">文章內容:</label>
                                    <textarea id="blogContent" name="blogContent"></textarea>
                                </div>
                                <input type="submit" class="bth btn-info" value="提交" />
                            </div>
                        </div>
                    </form>
                </div>

            </div><!-- modal-content -->
        </div><!-- modal-dialog -->
    </div><!-- modal -->


    <!-- Footer -->
    <jsp:include page="footer.jsp" />
    <script src="<c:url value="/vendor/ckeditor/ckeditor.js"/>"> </script>
    <script>
	    $(".blog-content").each(function(){
	  		let id = $(this).attr('data-id');
	  		let len = 100;
	  		let txt=$(this).text().trim();
		    if(txt.length>len){
		      txt=txt.substr(0,len);
		    }
		    $(this).html(txt+' .........<a class="btn btn-info page-btn" href="index.jsp?page=blog_detail.php&blog_id='+id+'">閱讀詳細內容</a>');
	    });
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
        
        $(document).ready(function() {
        	CKEDITOR.replace('blogContent',{
        		height: 400,
        		filebrowserUploadUrl: '${pageContext.request.contextPath}/blogInsert',
        		filebrowserBrowseUrl: '${pageContext.request.contextPath}/blogBrowse'		
        	});
        })
    </script>

    </body>

</html>