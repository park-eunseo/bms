<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="${contextPath }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
		<!-- HTML5 Inputs -->
		<form action="#" onsubmit="" method="post">
		<div class="mb-4" style="width: max-content;">
			<div class="card-body" style="width: max-content;">
				<div class="mb-3 row">
					<label class="col-md-2 col-form-label" style="width: 100%">제목</label>
					<div class="col-md-10">
						<input class="form-control" type="text" placeholder="제목을 입력하세요." name="title" id="title">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-md-2 col-form-label" style="width: 100%">내용</label>
					<div class="col-md-10">
						<textarea id="content" name="content" id="content"></textarea>
						<script type="text/javascript">
							// 글쓰기 editor 및 사진 업로드 기능
							    CKEDITOR.replace('content',{
							        filebrowserUploadUrl: '/common/ckeditor/fileUpload', // 이미지 업로드 처리하는 컨트롤러명
							        font_names : "맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana",
							        font_defaultLabel : "맑은 고딕/Malgun Gothic",
							        fontSize_defaultLabel : "12",
							        language : "ko"
   							    });
						</script>
					</div>
				</div>
				<button type="submit" class="btn rounded-pill btn-outline-dark" >완료</button>
			</div>
		</div>
	</form>
</body>
</html>