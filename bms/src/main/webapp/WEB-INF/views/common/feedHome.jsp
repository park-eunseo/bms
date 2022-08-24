<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<style>
.postTitle {
	height: 19.792px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis
}

.lock {
	font-size: 1rem;
	color: gray;
}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	var memberId = '<%=(String)session.getAttribute("memberId")%>'
</script>
</head>

<body>

	<!-- 블로그 카드 시작 부분 -->
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
			<c:if test="${not empty memberPostList }">
				<c:forEach var="post" items="${memberPostList }">
					<div class="col-md-6 col-lg-4 mb-3">
						<div class="card">
							<a href="${contextPath }/feed/detailPost?postId=${post.postId}">
								<c:if test="${not empty post.thumbnail}">
									<img class="card-img-top"
										style="height: 160px; object-fit: cover;"
										src="${contextPath }/feed/thumbnails?thumbnail=${post.thumbnail}"
										alt="Card image cap">
								</c:if>
								<div class="card-body" style="padding: 1.2rem">
									<div style="display: flex; justify-content: space-between;">
										<h5 class="card-title postTitle" style="">${post.title }</h5>
										<c:if test="${post.postPrivate eq 'Y' }"> <i class='bx bxs-lock-alt lock'></i></c:if>
									</div>
									<p class="card-text" id="content">${post.content }</p>
									<small class="text-muted">${post.categoryTitle} | ${post.regDate }</small>
									<div style="text-align: end;">
									<!-- 좋아요 -->
										<small id="likeBtn${post.postId}" class='bx bx-heart' style="color: red; font-size: 1.1rem;"></small> 
										<small id="likeCount${post.postId}" style="font-size: 0.8rem;">0</small>&ensp;
										<script>
											$().ready(function(){
												$.ajax({
													type : "get",
													url : "${contextPath}/feed/getLikePost?memberId=" + memberId + "&postId=" + ${post.postId},
													success : function(data){
														if(data){ document.getElementById("likeBtn${post.postId}").classList.replace('bx-heart', 'bxs-heart') } 
													}
												})
												
												$.ajax({
													type : "get",
													url : "${contextPath}/feed/getLikeCount?memberId=" + memberId + "&postId=" + ${post.postId},
													success : function(data){
														document.getElementById("likeCount${post.postId}").innerText = data
													}
												})
											})
										</script>
										<!-- 댓글 -->
										<small><i class="bx bx-message-rounded-dots" style="font-size: 1.1rem;"></i></small>
										<small id="replyCount${post.postId }" style="font-size: 0.8rem;">0</small>
										<script>
											$().ready(function(){
												$.ajax({
													type : "get",
													url : "${contextPath}/feed/getReplyCount?postId=" + ${post.postId},
													success : function(data){
														$("#replyCount" + ${post.postId}).text(data)
													}
												});
											})
										</script>
									</div>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<c:if test="${empty memberPostList}">
			<h6 style="text-align-last: center;">게시글이 없습니다.</h6>
		</c:if>
	</div>