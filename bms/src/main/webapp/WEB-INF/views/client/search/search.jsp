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

.introText {
	font-size: initial;
	display: inline;
	overflow: hidden;
	padding-left: 40px;
	width: 350px;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.searchResult {
	padding-bottom: 10px;
	font-weight: 500;
	font-style: italic;
}
</style>
</head>
<body>
	<div class="container" style="width: 700px; width: 700px; height: 30rem; padding-top: 10px;">
		<div class="searchResult">${searchKeyword } · ${searchWord} &ensp;검색 결과</div>
		<div class="row mb-5">
			<c:if test="${empty searchList }">
				<hr>
				<p>검색 결과가 없습니다.</p>
			</c:if>
			<c:if test="${searchKeyword eq '작성자'}">
				<hr>
				<c:forEach var="member" items="${searchList }">
					<div>
						<div class="mb-3">
								<div class="col-md-8" style="width: 100%">
									<div style="padding: 0.1rem;">
										<img
											src="${contextPath }/member/thumbnails?profileName=${member.profile}"
											class="w-px-40 rounded-circle profileImg">
										<a href="${contextPath}/feed?id=${member.id }" style="padding: inherit;">${member.nickname }(${member.id })</a>
										<span class="introText">${member.intro }</span>
									</div>
								</div>
						</div>
					</div>
					<hr>
				</c:forEach>
			</c:if>
			<c:if test="${searchKeyword eq '블로그명'}">
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
										<img src="${contextPath }/member/thumbnails?profileName=${blog.profile}"
											class="w-px-40 rounded-circle profileImg"> 
											<a href="${contextPath}/feed?id=${blog.id }"
											style="padding: inherit;">${blog.nickname }</a>
									</p>
							</div>
						</div>
					</div>
					<hr>
				</c:forEach>
			</c:if>
			<c:if test=""><p></p></c:if>
		</div>
	</div>
</body>
</html>