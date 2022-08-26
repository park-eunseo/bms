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
    height: 25px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    font-size: 18px;
    font-weight: 500;
    color: black;
}

.lock {
	font-size: 1rem;
	color: gray;
}

.sideText {
	display: flex;
	justify-content: space-between;
	margin-block-start: 10px;
}

.title {
    margin-block: 10px;
    font-size: larger;
    font-weight: 500;
    color: #384d65;
}

.contentText {
	font-size: initial;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	margin-block: 10px;
}

.pageBlock {
	justify-content: center;
	margin-block-start: 4rem;
}

.thumbnail {
	height: 10.2rem;
	width: 95%;
	object-fit: cover;
}

</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>	
	var memberId = '<%=(String)session.getAttribute("memberId")%>'
		
	$().ready(function(){
		$("#currentBlock" + ${currentPage}).addClass("active")	
	})
</script>
</head>

<body>

	<!-- 블로그 카드 시작 부분 -->
	<div class="container-xxl flex-grow-1 container-p-y" style="width: 90%">
		<div class="row" style="justify-content: center;">
		<span style="padding-left: 20px">전체(${totalPostCount })</span>
			<c:if test="${not empty postList }">
				<c:forEach var="post" items="${postList }">
					<hr style="margin: 0.2rem; width: 95%;">
					<div style="padding: 0.8rem 1.5rem;">
						<div class="<c:if test="${not empty post.thumbnail }">row</c:if>">
							<div class="col-md-8"
								style="<c:if test="${empty post.thumbnail }">width:100%;</c:if>">
								<div>
									<a
										href="${contextPath }/feed/detailPost?id=${post.memberId}&postId=${post.postId}">
										<span>${post.categoryTitle}</span>
										<p class="postTitle">
											<c:if test="${post.postPrivate eq 'Y' }">
												<i class='bx bxs-lock-alt lock'></i>
											</c:if>
											${post.title }
										</p><span class="card-text contentText" style="min-height: <c:if test="${not empty post.thumbnail }">70px</c:if>">
											${post.content }</span>
									</a>
									<div class="sideText">
										<small class="text-muted">${post.regDate }</small>
										<div>
											<!-- 좋아요 -->
											<small id="likeBtn${post.postId}" class='bx bx-heart'
												style="color: red; font-size: 0.9rem;"></small> <small
												style="font-size: 0.8rem;">${post.likeCount }</small>&ensp;
											<script>
														$().ready(function(){
															$.ajax({
																type : "get",
																url : "${contextPath}/feed/getLikePost?memberId=" + memberId + "&postId=" + ${post.postId},
																success : function(data){
																	if(data){ document.getElementById("likeBtn${post.postId}").classList.replace('bx-heart', 'bxs-heart') } 
																}
															})
														})
													</script>
											<!-- 댓글 -->
											<small><i class="bx bx-message-rounded-dots"
												style="font-size: 0.9rem;"></i></small> <small
												style="font-size: 0.8rem;">${post.replyCount }</small>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4"
								style="display: <c:if test="${empty post.thumbnail }">none</c:if>">
								<img class="thumbnail"
									src="${contextPath }/feed/thumbnails?thumbnail=${post.thumbnail}"
									alt="Card image">
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<c:if test="${empty postList}">
			<h6 style="text-align-last: center;">게시글이 없습니다.</h6>
		</c:if>
	</div>
	<c:if test="${totalPostCount gt 0 }">
		<div>
			<ul class="pagination pageBlock">
				<c:if test="${startPageBlock gt 5 }">
					<li class="page-item prev"><a class="page-link"
						href="${contextPath }/feed?id=${memberInfo.id }&currentPage=${startPageBlock-5}&
							<c:if test="${empty nowCategory }">searchWord=${searchWord}</c:if>
							<c:if test="${not empty nowCategory }">category=${nowCategory}</c:if>">
							<i class="tf-icon bx bx-chevron-left"></i>
					</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPageBlock }" end="${endPageBlock }">
					<li class="page-item" id="currentBlock${i }"><a
						class="page-link"
						href="${contextPath }/feed?id=${memberInfo.id }&currentPage=${i}&
							<c:if test="${empty nowCategory }">searchWord=${searchWord}</c:if>
							<c:if test="${not empty nowCategory }">category=${nowCategory}</c:if>">${i }</a>
					</li>
				</c:forEach>
				<c:if
					test="${endPageBlock le totalPostCount && endPageBlock ge 5 && endPageBlock ne totalPageBlock}">
					<li class="page-item next"><a class="page-link"
						href="${contextPath }/feed?id=${memberInfo.id }&currentPage=${startPageBlock+5}&
								<c:if test="${empty nowCategory }">searchWord=${searchWord}</c:if>
								<c:if test="${not empty nowCategory }">category=${nowCategory}</c:if>">
							<i class="tf-icon bx bx-chevron-right"></i>
					</a></li>
				</c:if>
			</ul>
		</div>
	</c:if>