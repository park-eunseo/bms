<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.pageBlock {
	justify-content: center;
	margin-block-start: 4rem;
}

.text {
	font-size: initial;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
}
</style>
<script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script>
<script>
	$().ready(function() {
		$("#currentBlock${currentPage}").addClass("active")
	})

</script>
</head>
<body>
	<div class="card"
		style="width: 95%; min-height: 400px; margin-inline: auto;">
		<a href="/bms/admin" style="padding-inline: 1rem;">
			<i class="bx bx-chevron-left"></i>회원 목록</a>
		<a href="/bms/admin/writeNotice" style="padding-inline: 1rem;">
			<i class="bx bx-chevron-left"></i>공지사항 작성</a>
		<h5 class="card-header">공지사항 목록</h5>
		<div class="table-responsive text-nowrap"
			style="padding: 1rem; padding-top: 0;">
			<span style="padding-left: 8px;">전체(${totalNoticeCount })</span>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>관리자 ID</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
						<th>삭제</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${not empty noticeList }">
						<c:forEach var="notice" items="${noticeList }" varStatus="status">
							<tbody class="table-border-bottom-0">
								<tr>
									<td>${(currentPage-1)*10 + status.count}</td>
									<td>${notice.managerId }</td>
									<td><a
										href="${contextPath }/admin/detailNotice?noticeId=${notice.noticeId}">${notice.title }</a></td>
									<td><span class="text">${notice.content }</span></td>
									<td>${notice.regDate }</td>
									<td>
										<button type="button" onclick="deleteNotice('${notice.noticeId}')"
											style="width: 1.5rem; height: 1.5rem;"
											class="btn btn-icon btn-outline-danger">
											<i class='bx bxs-user-minus'></i>
										</button>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tbody class="table-border-bottom-0">
							<tr>
								<td colspan="9" style="text-align-last: center;">작성한 공지사항이 없습니다.</td>
							</tr>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<c:if test="${totalNoticeCount gt 0 }">
			<div>
				<ul class="pagination pageBlock">
					<c:if test="${startPageBlock gt 5 }">
						<li class="page-item prev"><a class="page-link"
							href="${contextPath }/admin/noticeList?currentPage=${startPageBlock-5}">
								<i class="tf-icon bx bx-chevron-left"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPageBlock }"
						end="${endPageBlock }">
						<li class="page-item" id="currentBlock${i }"><a
							class="page-link"
							href="${contextPath }/admin/noticeList?currentPage=${startPageBlock-5}">${i }</a>
						</li>
					</c:forEach>
					<c:if
						test="${endPageBlock le totalNoticeCount && endPageBlock ge 5 && endPageBlock ne totalPageBlock}">
						<li class="page-item next"><a class="page-link"
							href="${contextPath }/admin/noticeList?currentPage=${startPageBlock-5}">
								<i class="tf-icon bx bx-chevron-right"></i>
						</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>