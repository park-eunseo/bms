<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<script src="${contextPath }/resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="${contextPath }/resources/summernote/summernote-lite.js"></script>

<link rel="stylesheet" href="${contextPath }/resources/summernote/summernote-lite.css">
</head>
<body>
		<!-- HTML5 Inputs -->
		<form action="#" onsubmit="" method="post" enctype="multipart/form-data">
		<div class="mb-4" style="width: max-content;">
			<div class="card-body" style="width: max-content;">
				<div class="mb-3 row">
					<label class="col-md-2 col-form-label" style="width: 100%">제목</label>
					<div class="col-md-10" style="width: 100%;">
						<input class="form-control" type="text" placeholder="제목을 입력하세요." name="title" id="title">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-md-2 col-form-label" style="width: 100%">내용</label>
					<div class="col-md-10" style="width: 100%;">
						<textarea id="content" name="content"></textarea>
						<script type="text/javascript">
							$("#content").summernote({
								height : 500, // 에디터 높이
								minHeight : null, // 최소 높이
								maxHeight : null, // 최대 높이
								lang : "ko-KR",
								toolbar: [
									    // [groupName, [list of button]]
									    ['fontname', ['fontname']],
									    ['fontsize', ['fontsize']],
									    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
									    ['color', ['forecolor','color']],
									    ['table', ['table']],
									    ['para', ['ul', 'ol', 'paragraph']],
									    ['height', ['height']],
									    ['insert',['picture','link','video']],
									    ['view', ['fullscreen', 'help']]
									  ],
									fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
									fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
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