<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.category {
	text-align-last: center;
	color: red;
	font-weight: 200;
	padding-bottom: 10px;
}

.noticeBody {
	width: 85%;
	margin-top: -20px;
	color: black;
	min-height: 40rem;
}
</style>
<script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script>
<script>
	function deleteNotice() {
		var check = confirm("삭제하시겠습니까?")

		if (check) {
			location.href = "${contextPath }/admin/deleteNotice?noticeId=${detailNotice.noticeId}"
		} else {
			history.go(0)
		}
	}
</script>
</head>
<body>
	<div style="text-align: -webkit-center;">
		<div class="col-lg-8 px-md-5 py-5 noticeBody">
			<c:if test="${sessionScope.memberId eq detailNotice.managerId}">
				<div style="text-align-last: end;">
					<div class="btn-group">
						<button type="button" style="width: 2rem; height: 2rem;"
							class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow"
							data-bs-toggle="dropdown" aria-expanded="false">
							<i class="bx bx-dots-vertical-rounded"></i>
						</button>
						<ul class="dropdown-menu dropdown-menu-end"
							style="text-align-last: start; min-inline-size: auto;">
							<li><a class="dropdown-item" href="${contextPath }/admin/modifyNotice?noticeId=${detailNotice.noticeId}">수정하기</a></li>
							<li><button class="dropdown-item" onclick="deleteNotice()">삭제하기</button></li>
						</ul>
					</div>
				</div>
			</c:if>
			<div class="row pt-md-4" style="margin-top: -20px;">
				<h4 class="category">[공지사항]</h4>
				<h2 class="mb-3"
					style="text-align-last: center; word-break: break-all; padding-bottom: 20px; color: #000000">${detailNotice.title }</h2>
				<span class="text-muted" style="text-align: -webkit-left;">${detailNotice.regDate }</span>
				<hr style="height: 0.03rem; margin-top: 1rem;">
				<p style="text-align-last: center; color: #000000">${detailNotice.content }</p>
			</div>
		</div>
	</div>
</body>
</html>