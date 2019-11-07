<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>blog</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/blog.css"/>">
</head>
<style>
	.box {
		width: 90%;
		padding: 5px 15px;
	    box-shadow: 0 0 5px rgba(0,0,0,0.2);
	    transition: 1s;
	}

	.categoryBlock { 
		border: 1px solid #eee;
		text-align: center; padding: 2px 10px;
		margin: 1px;
		cursor: pointer;
		transition: .5s;
	}

	.categoryBlock:hover { background-color: #eee;}
</style>
<body>
<!-- Header -->
<jsp:include page="header.jsp" />

<!-- content 區塊 -->
<div class="container page">
    <div class="row col-md-12">
        <div class="row col-md-9 blogs">
        </div>
        <div class="col-md-3">
            <button type="button" class="btn btn-info page-btn" data-toggle="modal"
                data-target="#createBlog">新增文章</button>
            <button type="button" class="btn btn-light page-btn allBlogs">全部文章</button>
            
            <!-- Sidebar Widgets Column -->
            
            <!-- Search Widget -->
	        <div class="card my-4">
	          <h5 class="card-header">Search</h5>
	          <div class="card-body">
	            <div class="input-group">
	              <input type="text" class="form-control searchValue" placeholder="Search for...">
	              <span class="input-group-btn">
	                <button class="btn btn-secondary searchClick" type="button">Go!</button>
	              </span>
	            </div>
	          </div>
	        </div>
			
			<!-- Categories Widget -->
			<div class="card my-4">
				<h5 class="card-header">Categories</h5>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-12">
							<ul class="list-unstyled mb-0 row">
								<c:forEach var="category" items="${categoryList}">
									<li class="categoryBlock categoryClick col-md-3" data-category="${category.categoryId}">
										<a href="javascript:;">${category.categoryName}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
        </div>
    </div>
    <ul id="show" class="pagination"></ul>
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
<script src="<c:url value='/vendor/ckeditor/ckeditor.js'/>"></script>
<script src="<c:url value='/js/blog.js'/>"></script>
<script>
$(document).ready(function () {
    CKEDITOR.replace('blogContent', {
        height: 400,
        filebrowserUploadUrl: '${pageContext.request.contextPath}/blogInsert',
        filebrowserBrowseUrl: '${pageContext.request.contextPath}/blogBrowse'
    });
})
</script>
</body>
</html>