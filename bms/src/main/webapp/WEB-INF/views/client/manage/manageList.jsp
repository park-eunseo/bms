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
			url : "${contextPath}/feed/notLikePost?memberId=" + memberId + "&postId=" + postId,
			success : function(){
				history.go(0)
			}			
		})	
	}
	
	function deleteListMember(favoriteId){
		$.ajax({
			type : "get",
			url : "${contextPath}/feed/notLikeMember?memberId=" + memberId + "&favoriteId=" + favoriteId,
			success : function(){
				history.go(0)
			}			
		})	

	}
	
	function deleteReply(replyId){
		$.ajax({
			type : "get",
			url : "${contextPath}/feed/deleteReply?replyId=" + replyId,
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
					<h4 class="text-muted" style="color: #8e8e8e;">관리</h4>
					<div class="nav-align-top mb-4" style="padding-top: 15px;">
						<ul class="nav nav-pills mb-3" role="tablist">
							<li class="nav-item">
								<button type="button" class="nav-link active" role="tab" style="box-shadow: none;"
									data-bs-toggle="tab" data-bs-target="#member"
									aria-controls="member" aria-selected="true">
									회원</button>
							</li>
							<li class="nav-item">
								<button type="button" class="nav-link" role="tab" style="box-shadow: none;"
									data-bs-toggle="tab" data-bs-target="#post"
									aria-controls="post" aria-selected="false">
									게시글</button>
							</li>
							<li class="nav-item">
								<button type="button" class="nav-link" role="tab" style="box-shadow: none;"
									data-bs-toggle="tab" data-bs-target="#reply"
									aria-controls="reply" aria-selected="false">
									댓글</button>
							</li>
						</ul>
						<div class="tab-content" style="box-shadow: none; padding: inherit;">
							<div class="tab-pane fade active show" id="member"
								role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr >
												<th style="padding-left: 35px;">번호</th>
												<th style="padding-left: 35px;">nickname(ID)</th>
												<th>삭제</th>
											</tr>
										</thead>
										<c:if test="${not empty likeMemberList }">
											<c:forEach var="list" items="${likeMemberList }">
											<c:set var="count" value="${count+1 }"></c:set>
												<tbody class="table-border-bottom-0">
													<tr>
														<td style="padding-left: 35px;">${count }</td>
														<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
															<a href="${contextPath }/feed?id=${list.id}">
																<strong>${list.nickname }(${list.id })</strong>
															</a>
														</td>
														<td style="padding-left: 20px;">
															<button type="button"
																onclick="deleteListMember('${list.id}')"
																style="width: 1.5rem; height: 1.5rem;"
																class="btn btn-icon btn-outline-danger">
																<i class='bx bxs-user-minus'></i>
															</button>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</c:if>
										<c:if test="${empty likeMemberList }">
											<tbody class="table-border-bottom-0">
												<tr>
													<td colspan="4" style="text-align-last: center;">
														즐겨찾는 회원이 없습니다.</td>
												</tr>
											</tbody>
										</c:if>
									</table>
								</div>
							</div>
							<div class="tab-pane fade" id="post" role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>번호</th>
												<th style="padding-left: 35px;">ID</th>
												<th>제목</th>
												<th>내용</th>
												<th>삭제</th>
											</tr>
										</thead>
										<c:if test="${not empty likePostList }">
											<c:forEach var="list" items="${likePostList }">
											<c:set var="count2" value="${count2 + 1 }"></c:set>
												<tbody class="table-border-bottom-0">
													<tr>
														<td>${count2}</td>
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
							<div class="tab-pane fade" id="reply" role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>댓글</th>
												<th>삭제</th>
											</tr>
										</thead>
										<c:if test="${not empty myReplyList }">
											<c:forEach var="list" items="${myReplyList }">
											<c:set var="count3" value="${count3 + 1 }"></c:set>
												<tbody class="table-border-bottom-0">
													<tr>
														<td>${count3}</td>
														<td><a href="${contextPath }/feed/detailPost?postId=${list.postId}">${list.title }</a></td>
														<td>${list.reply }</td>
														<td>
															<button type="button" onclick="deleteReply('${list.replyId}')"
																style="width: 1.5rem; height: 1.5rem;"
																class="btn btn-icon btn-outline-danger">
																<i class='bx bx-x'></i>
															</button>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</c:if>
										<c:if test="${empty myReplyList }">
											<tbody class="table-border-bottom-0">
												<tr>
													<td colspan="4" style="text-align-last: center;">
														작성한 댓글이 없습니다.
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