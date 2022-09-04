<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.memberSearch {
	width: 35%;
	padding: 1rem;
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

.pageBlock {
	justify-content: center;
	margin-block-start: 4rem;
}
</style>
<script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script>
<script>
	$().ready(function(){
		$("#currentBlock${currentPage}").addClass("active")	
	})
	
	function deletePost(postId){
		var deletePost = confirm("선택한 게시글이 삭제되며 복구할 수 없습니다. 삭제하시겠습니까?")
		
		if(deletePost){
			$.ajax({
				type:"get",
				url:"${contextPath}/admin/deletePost?postId=" + postId,
				success:function(){
					alert("게시글 삭제가 완료되었습니다.")
					history.go(0)
				}
			})
		} else {
			return false
		}
	}
</script>
</head>
<body>
	<div class="card"
		style="width: 95%; min-height: 400px; margin-inline: auto;">
		<a href="${contextPath }/admin" style="padding-inline: 1rem;">
			<i class='bx bx-chevron-left'></i>회원 목록</a>
		<h5 class="card-header">${memberId }님의 글 목록</h5>
		<div class="table-responsive text-nowrap" style="padding: 1rem; padding-top: 0;">
			<span style="padding-left: 8px">전체(${totalPostCount })</span>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>게시글 번호</th>
						<th>회원</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>내용</th>
						<th>비공개</th>
						<th>작성일</th>
						<th>강제 삭제</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${not empty postList }">
						<c:forEach var="post" items="${postList }" varStatus="status">
							<tbody class="table-border-bottom-0">
								<tr>
									<td>${(currentPage-1)*10 + status.count}</td>
									<td>${post.postId }</td>
									<td>${post.memberId }</td>
									<td>${post.categoryTitle }</td>
									<td><a class="text" href="${contextPath }/feed/detailPost?id=${post.memberId}&postId=${post.postId}">
													${post.title }</a></td>
									<td><a class="text">${post.content }</a></td>
									<td><c:if test="${post.postPrivate eq 'Y'}">비공개</c:if>
										<c:if test="${post.postPrivate eq 'N'}">공개</c:if>
									</td>
									<td>${post.regDate }</td>
									<td>
										<button type="button" onclick="deletePost('${post.postId}')"
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
								<td colspan="9" style="text-align-last: center;">작성한 게시글이 없습니다.</td>
							</tr>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<c:if test="${totalPostCount gt 0 }">
			<div>
				<ul class="pagination pageBlock">
					<c:if test="${startPageBlock gt 5 }">
						<li class="page-item prev"><a class="page-link"
							href="${contextPath }/admin/postList?id=${memberId }&currentPage=${startPageBlock-5}">
								<i class="tf-icon bx bx-chevron-left"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPageBlock }"
						end="${endPageBlock }">
						<li class="page-item" id="currentBlock${i }"><a
							class="page-link"
							href="${contextPath }/admin/postList?id=${memberId }&currentPage=${i }">${i }</a>
						</li>
					</c:forEach>
					<c:if
						test="${endPageBlock le totalPostCount && endPageBlock ge 5 && endPageBlock ne totalPageBlock}">
						<li class="page-item next"><a class="page-link"
							href="${contextPath }/admin/postList?id=${memberId }&currentPage=${startPageBlock-5}">
								<i class="tf-icon bx bx-chevron-right"></i>
						</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>