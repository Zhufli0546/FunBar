<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#reportProcess { letter-spacing: 2px;}
#reportProcess .showComment { cursor: pointer;}
#reportProcess .showComment:hover { color: red;}
.box {
	box-shadow: 0 0 5px rgba(0,0,0,0.2);
	padding: 5px 15px;
	margin-bottom: 10px;
}
</style>
<body>
<!-- Header -->
<jsp:include page="admin_header.jsp" />

<!-- content 區塊 -->
<div style="margin-top:80px; margin-bottom:120px" class="container">
  	<table id="reportProcess" class="table table-dark table-hover" id="demo"></table>
  	<ul id="showProcess" class="pagination"></ul>
</div>

<!-- showComment Modal -->
  <div class="modal fade" id="showComment">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title blogTitle">{{comment.blog.blogTitle}}</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body row">
          <div class="offset-md-2 col-md-8 box">
          	<p class="commentName">留言者: {{comment.commentName}}</p>
          	<p class="commentCreatedTime">留言時間: {{commentCreatedTime}}</p>
          </div>
          
          <div class="offset-md-2 col-md-8 box">
          	<p class="commentContent">留言內容: {{comment.commentContent}}</p>
          </div>
          
          <div class="offset-md-2 col-md-8 box">
          	<p class="reportName">檢舉人: {{comment.reports[i].reportName}}</p>
          	<p class="reportContent">檢舉原因: {{comment.reports[i].reportContent}}</p>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

<!-- Footer -->
<div style="display:none; " class="requestUrl">${pageContext.request.contextPath}</div>
<jsp:include page="admin_footer.jsp" />
<script src="<c:url value='/js/admin_report.js' />"></script>
</body>
</html>