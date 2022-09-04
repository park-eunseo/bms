<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script>

	function noticeCheck(){
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
<div style="margin: auto; width: fit-content;">
	<form id="formAuthentication" action="${contextPath }/admin/writeNotice"
		enctype="multipart/form-data" onsubmit="return noticeCheck()"
		name="postForm" method="post">
		<div class="card-body" style="width: max-content; padding-top: 0">
			<h4>공지사항 작성</h4>
			<div class="mb-3">
				<label class="col-md-2 col-form-label" style="width: 100%">제목</label>
				<div class="col-md-10" style="width: 900px;">
					<input class="form-control" onkeyup="checkTitle(this)" type="text"
						placeholder="제목을 입력하세요." name="title" id="title"> <small
						id="titleLen">(0/50byte)</small> <br> <small id="titleAlert"
						style="color: red"></small>
				</div>
			</div>
			<div class="mb-3">
				<label class="col-md-2 col-form-label" style="width: 100%">내용</label>
				<div class="col-md-10" style="width: 900px;">
					<textarea id="content" name="content"></textarea>
					<br> <small id="contentAlert" style="color: red"></small>
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
								onKeyup : function(){
									var text_len = content.value.length	
									if (text_len > 0) {	
										document.getElementById("contentAlert").innerText = ""
									}
								}	
							});
						</script>
				</div>
			</div>
			<button class="btn rounded-pill btn-outline-dark">저장</button>
		</div>
		<input type="hidden" name="managerId" value="${sessionScope.memberId }">
	</form>
</div>
</body>
</html>