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
}

.thumbnail {
	height: 10.5rem;
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
	margin-block: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	var memberId = '<%=(String)session.getAttribute("memberId")%>'
</script>
</head>
<body>
<div class="content-wrapper">
	<div class="container-xxl container-p-y" style="width: 900px;">
	<h6 class="comment"> / 추천 게시글 /</h6>
	<hr>
		<div class="card-group mb-5">
                <div class="card">
                  <img class="card-img-top" src="../assets/img/elements/4.jpg" alt="Card image cap">
                  <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">
                      This is a wider card with supporting text below as a natural lead-in to additional content. This
                      content is a little bit longer.
                    </p>
                  </div>
                  <div class="card-footer">
                    <small class="text-muted">Last updated 3 mins ago</small>
                  </div>
                </div>
                <div class="card">
                  <img class="card-img-top" src="../assets/img/elements/5.jpg" alt="Card image cap">
                  <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">
                      This card has supporting text below as a natural lead-in to additional content.
                    </p>
                  </div>
                  <div class="card-footer">
                    <small class="text-muted">Last updated 3 mins ago</small>
                  </div>
                </div>
                <div class="card">
                  <img class="card-img-top" src="../assets/img/elements/1.jpg" alt="Card image cap">
                  <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">
                      This is a wider card with supporting text below as a natural lead-in to additional content. This
                      card has even longer content than the first to show that equal height action.
                    </p>
                  </div>
                  <div class="card-footer">
                    <small class="text-muted">Last updated 3 mins ago</small>
                  </div>
                </div>
              </div>
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

		<div class="container" style="width: 700px; background-color: white;">
			<c:if test="${not empty postList }">
				<h6 class="comment">즐겨찾는 회원의 최신 글을 확인해 보세요 🙌</h6>
			</c:if>
			<c:if test="${empty postList }">
				<h6 class="comment">회원을 즐겨찾기하고 소식을 확인해 보세요 🙌</h6>
			</c:if>

			<div class="row mb-5">
				<c:if test="${not empty postList }">
					<c:forEach var="post" items="${postList }">
						<!-- 썸네일 있는 카드 -->
						<c:if test="${not empty post.thumbnail }">
							<div>
								<hr>
								<div class="row">
									<div class="col-md-8">
										<div style="padding: 0.5rem;">
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
													<small id="likeBtn${post.postId}" class='bx bx-heart' style="color: red; font-size: 0.9rem;"></small> 
													<small style="font-size: 0.8rem;">${post.likeCount }</small>&ensp;
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
													<small><i class="bx bx-message-rounded-dots" style="font-size: 0.9rem;"></i></small> 
													<small style="font-size: 0.8rem;">${post.replyCount }</small>
												</div>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<img class="thumbnail"
											src="${contextPath }/feed/thumbnails?thumbnail=${post.thumbnail}"
											alt="Card image">
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${empty post.thumbnail }">
							<!-- 썸네일 없는 카드 -->
							<div>
								<hr>
								<div class="g-0">
									<div class="col-md-8" style="width: 100%;">
										<div style="padding: 0.5rem;">
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
													<small id="likeBtn${post.postId}" class="bx bx-heart" style="color: red; font-size: 0.9rem;"></small> 
													<small style="font-size: 0.8rem;">${post.likeCount }</small>&ensp;
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
													<small><i class="bx bx-message-rounded-dots" style="font-size: 0.9rem;"></i></small> 
													<small id="replyCount${post.postId }" style="font-size: 0.8rem;">${post.replyCount }</small>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</c:if>
	<!-- Service End -->

</body>
</html>