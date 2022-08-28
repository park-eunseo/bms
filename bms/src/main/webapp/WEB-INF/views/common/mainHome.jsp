<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<style>
.profileImg {
	width: 1.5rem;
	height: 1.5rem;
	margin-right: 0.2rem;
}

.contentText {
	font-size: initial;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	margin-block: 10px;
	min-height: 57px;
}

.randomContent {
	font-size: initial;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.thumbnail {
	height: 9.5rem;
	width: 95%;
	object-fit: cover;
}

.comment {
	text-align: justify;
	color: black;
	font-weight: 200;
	margin-bottom: 0px;
}

.title {
	margin-block: 10px;
	font-size: large;
	font-weight: 500;
	color: black;
}

.id {
	padding: inheritl;
	vertical-align: text-top;
}

.sideText {
	display: flex;
	justify-content: space-between;
	margin-block-start: 10px;
}

.pageBlock {
	justify-content: center;
	margin-block-start: 4rem;
}

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
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	var memberId = '<%=(String) session.getAttribute("memberId")%>'
	
	$().ready(function(){
		$("#currentBlock${currentPage}").addClass("active")	
	})
</script>
</head>
<body>
	<div class="content-wrapper">
		<div class="container-xxl container-p-y" style="width: 900px;">
			<h6 class="comment">/ 추천 게시글 /</h6>
			<br>
			<div class="card-group mb-5">
			 <c:forEach var="list" items="${randomList }">
					<div class="card">
						<c:if test="${not empty list.thumbnail }">
							<img class="card-img-top" style="height: 100px; object-fit: cover;"
								src="${contextPath }/feed/thumbnails?thumbnail=${list.thumbnail}"
								onclick="location.href='${contextPath }/feed/detailPost?id=${list.id}&postId=${list.postId}'">
						</c:if>
						<div>
							<img
								src="${contextPath }/member/thumbnails?profileName=${list.profile}"
								class="w-px-40 rounded-circle profileImg" style="margin: 0.7rem;"> <a
								href="${contextPath}/feed?id=${list.id }" class="id">${list.nickname }</a>
						</div>
						<div class="card-body" style="padding: 1rem 1rem; padding-top: 0;">
							<a href="${contextPath }/feed/detailPost?id=${list.id}&postId=${list.postId}">
								<h5 class="card-title postTitle">${list.title }</h5>
								<p class="card-text randomContent"
									style="<c:if test="${empty list.thumbnail}">-webkit-line-clamp: 6;</c:if>">${list.content }</p>
							</a>
						</div>
						<div style="padding: 1rem 1rem;">
							<small class="text-muted">${list.regDate }</small>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- Service Start -->

		<c:if test="${empty sessionScope.memberId }">
			<div class="text-center mx-auto mb-5 fadeInUp" data-wow-delay="0.1s"
				style="height: 300px;">
				<p style="font-size: large; padding-top: 30px;">로그인하고 즐겨찾는 회원의
					소식을 확인하세요 🙌
				</h5>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.memberId }">

			<div class="container" style="width: 700px; min-height: 300px; background-color: white;">
				<c:if test="${not empty postList }">
					<h6 class="comment">즐겨찾는 회원의 최신 글을 확인해 보세요 🙌</h6>
				</c:if>
				<c:if test="${empty postList }">
					<h6 class="comment" style="text-align:center;">회원을 즐겨찾기하고 소식을 확인해 보세요 🙌</h6>
				</c:if>

				<div class="row mb-5">
					<c:if test="${not empty postList }">
						<c:forEach var="post" items="${postList }">
							<div>
								<hr>
								<div class="<c:if test="${not empty post.thumbnail }">row</c:if>" >
									<div class="col-md-8"
										style="<c:if test="${empty post.thumbnail }">width:100%;</c:if>">
										<div>
											<div>
												<img
													src="${contextPath }/member/thumbnails?profileName=${post.profile}"
													class="w-px-40 rounded-circle profileImg"> <a
													href="${contextPath}/feed?id=${post.id }" class="id">${post.nickname }</a>
											</div>
											<a
												href="${contextPath }/feed/detailPost?id=${post.id}&postId=${post.postId}">
												<p class="title">${post.title }</p> <span
												class="card-text contentText">${post.content }</span>
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
									<c:if test="${not empty post.thumbnail }">
										<div class="col-md-4">
											<img class="thumbnail"
												src="<c:if test="${not empty post.thumbnail }">${contextPath }/feed/thumbnails?thumbnail=${post.thumbnail}</c:if>"
												alt="Card image">
										</div>
									</c:if>
								</div>
							</div>
						</c:forEach>
						<c:if test="${totalPostCount gt 0 }">
							<div>
								<ul class="pagination pageBlock">
									<c:if test="${startPageBlock gt 5 }">
										<li class="page-item prev"><a class="page-link"
											href="${contextPath }/?currentPage=${startPageBlock-5}">
												<i class="tf-icon bx bx-chevron-left"></i>
										</a></li>
									</c:if>
									<c:forEach var="i" begin="${startPageBlock }"
										end="${endPageBlock }">
										<li class="page-item" id="currentBlock${i }"><a
											class="page-link"
											href="${contextPath }/?currentPage=${i}">${i }</a>
										</li>
									</c:forEach>
									<c:if
										test="${endPageBlock le totalPostCount && endPageBlock ge 5 && endPageBlock ne totalPageBlock}">
										<li class="page-item next"><a class="page-link"
											href="${contextPath }/?currentPage=${startPageBlock+5}">
												<i class="tf-icon bx bx-chevron-right"></i>
										</a></li>
									</c:if>
								</ul>
							</div>
						</c:if>
					</c:if>
				</div>
			</div>
		</c:if>
	</div>
	<!-- Service End -->
</body>
</html>