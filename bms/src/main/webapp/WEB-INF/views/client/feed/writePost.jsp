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
			url : "${contextPath}/blog/fileUpload",
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
	
	function postCheck(){
		var title = document.getElementById("title")
		var content = document.getElementById("content")	

		if(title.value == ""){
			document.getElementById("titleAlert").innerText = "제목을 입력해 주세요."
			title.focus()
			return false
		}

		if(title.value.length > 50){
			document.getElementById("titleAlert").innerText = "제목은 50자 이하로 작성해 주세요."
			title.focus()
			return false
		}	

		if(content.value == ""){
			document.getElementById("contentAlert").innerText = "내용을 입력해 주세요."
			return false
		}	
	}
	

	function checkTitle(obj) {
		var max = 50
		var text_len = obj.value.length
		
		var msg = document.getElementById("titleAlert")
		var len = document.getElementById("titleLen")

		if (text_len > max) {
			len.innerText = "(50/50byte)"
			msg.innerText = "50자 이하로 작성해 주세요."
		} else {
			len.innerText = "(" + text_len + "/50byte)"
			msg.innerText = ""
		}
	}

</script>
</head>
<body>
<!-- HTML5 Inputs -->
	<form id="formAuthentication" action="${contextPath }/feed/writePost" enctype="multipart/form-data" onsubmit="return postCheck()" name="postForm" method="post" >
		<div class="card-body" style="width: max-content;">
			<div class="mb-3">
				<label class="col-md-2 col-form-label" style="width: 100%">카테고리</label>
					<div class="col-md-10" style="width: 900px;">
						<select class="form-select form-select-sm" name="categoryTitle"
							style="display: inline-block; box-shadow: none; max-width: max-content;">
							<option value="전체" selected="selected">전체</option>
							<c:forEach var="category" items="${categoryList }">
								<option value="${category.categoryTitle }">${category.categoryTitle }</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="mb-3">
					<label class="col-md-2 col-form-label" style="width: 100%">제목</label>
					<div class="col-md-10" style="width: 900px;">
						<input class="form-control" onkeyup="checkTitle(this)" type="text" placeholder="제목을 입력하세요." name="title" id="title">
						<small id="titleLen">(0/50byte)</small>
	                	<br>
	               		<small id="titleAlert" style="color:red"></small>
					</div>
				</div>
				<div class="mb-3">
					<label class="col-md-2 col-form-label" style="width: 100%">대표 사진 설정&ensp;
						<small class="text-muted"> 내용에 첨부되지 않습니다.</small></label>
					<div class="col-md-10" style="width: 900px;">
						<input type="file" accept="image/png, image/jpeg" class="form-control" id="inputGroupFile02" name="thumbnail">
					</div>
				</div>
				<div class="mb-3">
					<label class="col-md-2 col-form-label" style="width: 100%">내용</label>
					<div class="col-md-10" style="width: 900px;">
						<textarea id="content" name="content"></textarea>
						<br>
	               		<small id="contentAlert" style="color:red"></small>
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
									},
									onKeyup : function(){
										var text_len = content.value.length	

										if (text_len > 0) {	
											document.getElementById("contentAlert").innerText = ""
										}
									}
								}	
							});
						</script>
					</div>
				</div>
				<div class="form-check form-check-inline mt-3" >
					<input class="form-check-input" type="radio" name="postPrivate" value="N" checked="checked"> 
						<label class="form-check-label" for="inlineRadio1">공개</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="postPrivate" value="Y"> 
						<label class="form-check-label" for="inlineRadio2">비공개</label>
				</div>
				<br><br>
				<button class="btn rounded-pill btn-outline-dark" >저장</button>
			</div>
		<input type="hidden" name="memberId" value="${sessionScope.memberId }">
	</form>
</body>
</html>