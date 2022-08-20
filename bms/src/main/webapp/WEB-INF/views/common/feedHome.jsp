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
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>

	</script>
</head>

<body>
	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Layout container -->
			<div class="layout-page" style="padding-left: 0px;">
				<!-- Content wrapper -->
				<div class="content-wrapper">
					<!-- 블로그 카드 시작 부분 -->
					<div class="container-xxl flex-grow-1 container-p-y">
						<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
							<c:if test="${not empty memberPostList }">
								<c:forEach var="post" items="${memberPostList }">
									<div class="col-md-6 col-lg-4 mb-3">
										<div class="card h-100">
											<a href="${contextPath }/feed/detailPost?postId=${post.postId}" >
												<c:if test="${not empty post.thumbnail}">
													<img class="card-img-top"
														src="${contextPath }/feed/thumbnails?thumbnail=${post.thumbnail}"
														alt="Card image cap">
												</c:if>
												<div class="card-body">
													<h5 class="card-title" 
														style="height:19.792px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis">${post.title }</h5>
													<p class="card-text" id="content"
														style="white-space: break-spaces; overflow: hidden; text-overflow: ellipsis">${post.content }</p>
													
													<small class="text-muted">${post.regDate }</small>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>
							</c:if>
						</div>
					 <c:if test="${empty memberPostList }"><h5 style="text-align-last: center;">게시글이 없습니다.</h5></c:if>
					</div>
				</div>
				<!-- Content wrapper -->
			</div>
			<!-- / Layout page -->
		</div>
	</div>
	<!-- / Layout wrapper -->
</body>
</html>
