<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.profileImg {
	width: 1.5rem;
	height: 1.5rem;
	margin-right: 0.2rem;
}

.thumbnail {
	height: 9.5rem;
	width: 95%;
	object-fit: cover;
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

.introText {
	font-size: initial;
	display: inline;
	overflow: hidden;
	padding-left: 40px;
	width: 350px;
	text-overflow: ellipsis;
	white-space: nowrap;
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

.title {
	margin-block: 10px;
	font-size: large;
	font-weight: 500;
	color: black;
}

.searchResult {
	padding-bottom: 10px;
	font-weight: 500;
	font-style: italic;
}

.id {
	padding: inheritl;
	vertical-align: text-top;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
	function searchSort() {
		var sort = $("input[name=searchSort]:checked").val()

		location.href = "${contextPath}/search?searchKeyword=${searchKeyword}&searchWord=${searchWord}&sort=" + sort
	}
	
	$().ready(function(){
		$("#currentBlock" + ${currentPage}).addClass("active")	
	})
</script>
</head>
<body>
	<div class="container"
		style="width: 700px; min-height: 30rem; padding-top: 25px;">
		<div style="display: flex; justify-content: space-between;">
			<div class="searchResult">
				<span style="font-weight: 600;"> <c:if
						test="${searchKeyword eq 'member'}">작성자</c:if> <c:if
						test="${searchKeyword eq 'blogName'}">블로그명</c:if> <c:if
						test="${searchKeyword eq 'post'}">게시글</c:if>
					&ensp;·&ensp;${searchWord}
				</span>&ensp;검색 결과
				<span>&ensp;${totalResultCount}개</span>
			</div>
			<c:if test="${searchKeyword eq 'post'}">
				<div>
					<input class="form-check-input"
						<c:if test="${sort eq 'like' }">checked</c:if>
						style="box-shadow: none;" onclick="searchSort()" name="searchSort"
						type="radio" value="like"> <label>좋아요순</label>&ensp; <input
						class="form-check-input"
						<c:if test="${sort eq 'reply' }">checked</c:if>
						style="box-shadow: none;" onclick="searchSort()" name="searchSort"
						type="radio" value="reply"> <label>댓글순</label>
				</div>
			</c:if>
		</div>
		<div class="row mb-5">
			<c:if test="${empty searchList }">
				<hr>
				<p>검색 결과가 없습니다.</p>
			</c:if>
			<c:if test="${searchKeyword eq 'member'}">
				<hr>
				<c:forEach var="member" items="${searchList }">
					<div>
						<div class="mb-3">
							<div class="col-md-8" style="width: 100%">
								<div style="padding: 0.1rem;">
									<img
										src="${contextPath }/member/thumbnails?profileName=${member.profile}"
										class="w-px-40 rounded-circle profileImg"> 
									<a href="${contextPath}/feed?id=${member.id }" class="id">
										${member.nickname }(${member.id })</a>
									<span class="introText">${member.intro }</span>
								</div>
							</div>
						</div>
					</div>
					<hr>
				</c:forEach>
			</c:if>
			<c:if test="${searchKeyword eq 'blogName'}">
				<hr>
				<c:forEach var="blog" items="${searchList }">
					<div>
						<div class="mb-3">
							<div class="col-md-8" style="width: 100%">
								<a href="${contextPath}/feed?id=${blog.id }">
									<p style="font-size: larger; color: darkslategray;">${blog.blogName }</p>
								</a>
								<p>${blog.intro }</p>
								<p>
									<img
										src="${contextPath }/member/thumbnails?profileName=${blog.profile}"
										class="w-px-40 rounded-circle profileImg"> <a
										href="${contextPath}/feed?id=${blog.id }"
										style="padding: inherit;">${blog.nickname }</a>
								</p>
							</div>
						</div>
					</div>
					<hr>
				</c:forEach>
			</c:if>
			<c:if test="${searchKeyword eq 'post'}">
				<c:forEach var="post" items="${searchList }">
					<div>
						<hr>
						<div class="<c:if test="${not empty post.thumbnail }">row</c:if>">
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
			</c:if>
		</div>
	</div>
		<c:if test="${totalResultCount gt 0 }">
			<div>
					<ul class="pagination pageBlock">
						<c:if test="${startPageBlock gt 5 }">
							<li class="page-item prev">
								<a class="page-link" href="${contextPath }/search?currentPage=${startPageBlock-5}&searchKeyword=${searchKeyword}&searchWord=${searchWord}&sort=${sort}"> 
									<i class="tf-icon bx bx-chevron-left"></i>
								</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${startPageBlock }" end="${endPageBlock }">
							<li class="page-item" id="currentBlock${i }">
								<a class="page-link" 
									href="${contextPath }/search?currentPage=${i}&searchKeyword=${searchKeyword}&searchWord=${searchWord}&sort=${sort}">${i }</a>
							</li>
						</c:forEach>
						<c:if test="${endPageBlock le totalResultCount && endPageBlock ge 5 && endPageBlock ne totalPageBlock}">
							<li class="page-item next">
								<a class="page-link" href="${contextPath }/search?currentPage=${startPageBlock+5}&searchKeyword=${searchKeyword}&searchWord=${searchWord}&sort=${sort}"> 
									<i class="tf-icon bx bx-chevron-right"></i>
								</a>
							</li>
						</c:if>
					</ul>
			</div>
		</c:if>
</body>
</html>