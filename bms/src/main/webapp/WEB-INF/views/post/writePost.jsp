<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>
	function uploadSummernoteImageFile(file, el){
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "${contextPath}/post/fileUpload",
			contentType : false,
			enctype : "multipart/form-data",
			processData : false,
			success : function(data){
				$(el).summernote('editor.insertImage', data.url);
			},
			error : function(e){
				console.log(e);
			}
		});
	}
</script>
</head>
<body>
		<!-- HTML5 Inputs -->
		<form action="#" onsubmit="" method="post" enctype="multipart/form-data">
		<div class="mb-4" style="width: max-content;">
			<div class="card-body" style="width: max-content;">
				<div class="mb-3 row">
					<label class="col-md-2 col-form-label" style="width: 100%">제목</label>
					<div class="col-md-10" style="width: 900px;">
						<input class="form-control" type="text" placeholder="제목을 입력하세요." name="title" id="title">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-md-2 col-form-label" style="width: 100%">내용</label>
					<div class="col-md-10" style="width: 900px;">
						<textarea id="content" name="content" cols="50"></textarea>
						<script type="text/javascript">
							$("#content").summernote({
								height : 500, // 에디터 높이
								minHeight : null, // 최소 높이
								maxHeight : null, // 최대 높이
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
								fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
								callbacks : { // 이미지 url로 첨부
									onImageUpload : function(files, editor, welEditable){
										// 파일 다중 업로드를 위해
										for(var i = files.length - 1; i >= 0; i--){
											uploadSummernoteImageFile(files[i], this);
										}
									}
								}	
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