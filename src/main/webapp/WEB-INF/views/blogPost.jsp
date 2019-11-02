<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <title>blogPost</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/blog.css"/>">
</head>

<body>
    <!-- Header -->
    <jsp:include page="header.jsp" />

    <!-- content 區塊 -->
    <div class="container page blog">
        <form enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-2">
                    <!-- 圖片區域 -->
                    <label style="cursor: pointer; background-color: #eee; padding: 2px; border-radius: 2px;">
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
                        <label for="categoryId" class="col-md-2">文章分類:</label> <select class="form-control col-md-5"
                            id="categoryId" name="categoryId">
                            <c:forEach var="category" items="${categoryList}">
                                <option value="">${category.categoryName}</option>
                            </c:forEach>

                        </select>
                    </div>

                    <div class="form-group row">
                        <label for="blogTitle" class="col-md-2">文章標題:</label> <input type="text" id="blogTitle"
                            name="blogTitle" class="form-control col-md-5">
                    </div>

                    <div class="form-group row">
                        <label for="blogContent" class="col-md-2">文章內容:</label> <input type="text" id="blogContent"
                            name="blogContent" class="form-control col-md-5">
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- Footer -->
    <jsp:include page="footer.jsp" />

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
</script>
</body>

</html>