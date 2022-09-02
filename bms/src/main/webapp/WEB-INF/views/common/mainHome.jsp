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

.containerBox {
	display: inline-flex;
	align-self: center;
	margin-left: 6rem;
}

.noticeHeader {
	background-color: #90cbf0;
	padding: 15px;
	font-size: larger;
}

.noticeBox {
	margin-bottom: 10px;
	padding: 8px;
	color: #525252;
	display: flex;
	justify-content: space-between;
}

.noticeTime {
	display: block;
	font-size: 10px;
	color: lightslategray;
}

.noNotice {
	text-align: -webkit-center;
	margin-top: 1rem;
	color: gray;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	var memberId = '<%=(String) session.getAttribute("memberId")%>'
	
	function timeForToday(value) { // 날짜 계산, 알림이 몇 분 전, 몇 시간 전 도착인지 이외는 날짜 표시
        const today = new Date();
        const timeValue = new Date(value);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금 전';
        if (betweenTime < 60) {  return betweenTime + "분 전"; }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) { return betweenTimeHour + "시간 전"; }

        return value;
 	}	
	
	function noticeClick(postId){ // 알림 클릭 시 제거
		$.ajax({
			type : "get",
			url : "${contextPath}/notice/deleteNotice?toId=" + memberId + "&postId=" + postId
		})
	}
	
	$().ready(function(){
		$("#currentBlock${currentPage}").addClass("active")	

		$.ajax({
			type : "get",
			url : "${contextPath}/notice/noticeList?id=" + memberId,
			dataType : "json",
			success : function(data){
				var list = ""

				if(data != ""){
					$(data).each(function(key, value){
							var category = value.category;
							
							list += "<div class='alert alert-secondary noticeBox' role='alert'>";
							list += "<div>";
							list += "<a href='${contextPath}/feed/detailPost?id=" + memberId +"&postId=" + value.postId + "'";
							list += "onclick='noticeClick(" + value.postId + ")' style='font-size: medium;'>";
							if(category == "like"){ list += value.fromId + " 님이 글에 좋아요를 눌렀습니다." }
							else if(category == "reply"){ list += value.fromId + " 님이 댓글을 남겼습니다." }
							else if(category == "re_reply"){ list += value.fromId + " 님이 답댓글을 남겼습니다." };
							list += "</a>";
							list += "<small class='noticeTime'>" + timeForToday(value.regDate) + "</small>";
							list += "</div>";
							list += "<div>";
							list += "<button type='button' onclick='noticeClick(" + value.postId + ")' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>";
							list += "</div>";
							list += "</div>";
					});
				} else {
					list += "<div class='noNotice'>새 알림이 없습니다.</div>"
				}
				$("#noticeList").html(list)
			}
		})
		
		$.ajax({
			type : "get",
			url : "${contextPath}/notice/noticeCount?id=" + memberId,
			success : function(data){
				$("#noticeCount").text(data)
			}
		})
	})
</script>
</head>
<body>
	<div class="content-wrapper">
		<div class="container-xxl container-p-y" style="width: 900px;">
			<h6 class="comment"># 추천 게시글</h6>
			<br>
			<div class="card-group mb-5">
				<c:forEach var="list" items="${randomList }">
					<div class="card">
						<c:if test="${not empty list.thumbnail }">
							<img class="card-img-top"
								style="height: 100px; object-fit: cover;"
								src="${contextPath }/feed/thumbnails?thumbnail=${list.thumbnail}"
								onclick="location.href='${contextPath }/feed/detailPost?id=${list.id}&postId=${list.postId}'">
						</c:if>
						<div>
							<img
								src="${contextPath }/member/thumbnails?profileName=${list.profile}"
								class="w-px-40 rounded-circle profileImg"
								style="margin: 0.7rem;"> <a
								href="${contextPath}/feed?id=${list.id }" class="id">${list.nickname }</a>
						</div>
						<div class="card-body" style="padding: 1rem 1rem; padding-top: 0;">
							<a
								href="${contextPath }/feed/detailPost?id=${list.id}&postId=${list.postId}">
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
					소식을 확인하세요 🙌</p>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.memberId }">
			<div class="containerBox">
				<div class="container"
					style="width: 700px; min-height: 300px; background-color: white;">
					<c:if test="${not empty postList }">
						<h6 class="comment">즐겨찾는 회원의 최신 글을 확인해 보세요 🙌</h6>
					</c:if>
					<c:if test="${empty postList }">
						<h6 class="comment" style="text-align: center;">회원을 즐겨찾기하고
							소식을 확인해 보세요 🙌</h6>
					</c:if>

					<div class="row mb-5">
						<c:if test="${not empty postList }">
							<c:forEach var="post" items="${postList }">
								<div>
									<hr>
									<div
										class="<c:if test="${not empty post.thumbnail }">row</c:if>">
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
									<hr>
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
												class="page-link" href="${contextPath }/?currentPage=${i}">${i }</a>
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
				<div class="card-body" style="width: 20rem;">
					<div class="card" style="min-height: 20rem;">
						<span class="card-header noticeHeader">내 소식</span>
						<div class="card-body" style="padding: 12px;" id="noticeList">
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<!-- Service End -->
</body>
</html>