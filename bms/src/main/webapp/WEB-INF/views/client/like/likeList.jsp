<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script>
<script>
	var memberId = '<%=(String)session.getAttribute("memberId")%>'
	
	function deleteLikePost(postId){
		$.ajax({
			type : "get",
			url : "${contextPath}/notLikePost?memberId=" + memberId + "&postId=" + postId,
			success : function(){
				history.go(0)
			}			
		})	
	}
</script>
<body>
	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xl-6" style="width: 100%;">
					<h4 class="text-muted" style="color: #8e8e8e;">즐겨찾기</h4>
					<div class="nav-align-top mb-4" style="padding-top: 15px;">
						<ul class="nav nav-pills mb-3" role="tablist">
							<li class="nav-item">
								<button type="button" class="nav-link active" role="tab" style="box-shadow: none;"
									data-bs-toggle="tab" data-bs-target="#navs-top-home"
									aria-controls="navs-top-home" aria-selected="true">
									회원</button>
							</li>
							<li class="nav-item">
								<button type="button" class="nav-link" role="tab" style="box-shadow: none;"
									data-bs-toggle="tab" data-bs-target="#navs-top-profile"
									aria-controls="navs-top-profile" aria-selected="false">
									게시글</button>
							</li>
						</ul>
						<div class="tab-content" style="box-shadow: none; padding: inherit;">
							<div class="tab-pane fade active show" id="navs-top-home"
								role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr>
												<th style="padding-left: 30px;">nickname(ID)</th>
												<th>Actions</th>
											</tr>
										</thead>
										<tbody class="table-border-bottom-0">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
													<strong>어솨(qkqkl)</strong></td>
												<td style="padding-left: 30px;">
													<button type="button" style="width: 1.5rem; height: 1.5rem;"
														class="btn btn-icon btn-outline-danger">
														<i class='bx bx-x'></i>
													</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="tab-pane fade" id="navs-top-profile" role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr>
												<th style="padding-left: 35px;">ID</th>
												<th>Title</th>
												<th>Content</th>
												<th>Actions</th>
											</tr>
										</thead>
										<c:if test="${not empty likePostList }">
											<c:forEach var="list" items="${likePostList }">
												<tbody class="table-border-bottom-0">
													<tr>
														<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
															<strong>${list.memberId }</strong></td>
														<td><a href="${contextPath }/feed/detailPost?postId=${list.postId}">${list.title }</a></td>
														<td>${list.content }</td>
														<td>
															<button type="button" onclick="deleteLikePost('${list.postId}')"
																style="width: 1.5rem; height: 1.5rem;"
																class="btn btn-icon btn-outline-danger">
																<i class='bx bx-x'></i>
															</button>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</c:if>
										<c:if test="${empty likePostList }">
											<tbody class="table-border-bottom-0">
												<tr>
													<td colspan="4" style="text-align-last: center;">
														좋아하는 게시글이 없습니다.
													</td>
												</tr>
											</tbody>
										</c:if>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<nav aria-label="Page navigation" style="align-self: center;">
			<ul class="pagination">
				<li class="page-item prev">
					<a class="page-link" href="javascript:void(0);">
					<i class="tf-icon bx bx-chevron-left"></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);">1</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);">2</a>
				</li>
				<li class="page-item active">
					<a class="page-link" href="javascript:void(0);">3</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);">4</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);">5</a>
				</li>
				<li class="page-item next">
					<a class="page-link" href="javascript:void(0);"> 
						<i class="tf-icon bx bx-chevron-right"></i>
					</a>
				</li>
			</ul>
		</nav>
	</div>
</body>
</html>