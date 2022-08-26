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
				<hr>
				<c:forEach var="post" items="${searchList }">
					<div>
						<div class="mb-3">
							<div class="col-md-8" style="width: 100%">
								<p>
									<img
										src="${contextPath }/member/thumbnails?profileName=${post.profile}"
										class="w-px-40 rounded-circle profileImg"> <a
										href="${contextPath}/feed?id=${post.memberId }" class="id">
										${post.nickname } · ${post.blogName }</a>
								</p>
								<a
									href="${contextPath }/feed/detailPost?id=${post.memberId }&postId=${post.postId}">
									<h6 style="margin-block: 10px;">${post.title }</h6> <span
									class="contentText">${post.content }</span>
								</a> <small>${post.regDate }</small>
							</div>
						</div>
					</div>
					<hr>
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