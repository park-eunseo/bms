<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.text {
	font-size: initial;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
}

.pageBlock {
	justify-content: center;
}
</style>
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
		var dMember = confirm("선택한 회원의 즐겨찾기를 해제하시겠습니까?")
		
		if(dMember){
			$.ajax({
				type : "get",
				url : "${contextPath}/feed/notLikeMember?memberId=" + memberId + "&favoriteId=" + favoriteId,
				success : function(){
					history.go(0)
				}			
			})
		} else { return false }
	}
	
	function deleteReply(replyId){
		var dReply = confirm("선택한 댓글을 삭제하시겠습니까?")
		
		if(dReply){
			$.ajax({
				type : "get",
				url : "${contextPath}/feed/deleteReply?replyId=" + replyId,
				success : function(){
					history.go(0)
				}			
			})	
		} else{
			return false
		}
	}
	
	function manage(btn){
		var btn = $(btn).attr("id")
		location.href = "${contextPath}/manage/manageList?manage=" + btn		
	}
	
	$().ready(function(){
		$("#currentBlock" + ${currentPage}).addClass("active")	
	})
</script>
<body>
	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xl-6" style="width: 100%;">
					<h4 class="text-muted" style="color: #8e8e8e;">내 활동 관리</h4>
					<div class="nav-align-top mb-4" style="padding-top: 15px;">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<button type="button" class="nav-link <c:if test="${manage eq 'member' }">active</c:if>" role="tab" style="box-shadow: none;"
									data-bs-toggle="tab" data-bs-target="#memberList" id="member"
									onclick="manage(this)">
									회원</button>
							</li>
							<li class="nav-item">
								<button type="button" class="nav-link <c:if test="${manage eq 'post' }">active</c:if>" role="tab" style="box-shadow: none;"
									data-bs-toggle="tab" data-bs-target="#postList" id="post"
									onclick="manage(this)">
									게시글</button>
							</li>
							<li class="nav-item">
								<button type="button" class="nav-link <c:if test="${manage eq 'reply' }">active</c:if>" role="tab" style="box-shadow: none;"
									data-bs-toggle="tab" data-bs-target="#replyList" id="reply"
									onclick="manage(this)">
									댓글</button>
							</li>
						</ul>
						<span style="margin-top: 1rem;">전체(${totalRowCount })</span>
						<div class="tab-content" style="box-shadow: none; padding: 0;">
							<div class="tab-pane fade <c:if test="${manage eq 'member' }">active show</c:if>" id="memberList"
								role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr >
												<th style="padding-left: 35px;">번호</th>
												<th>블로그명</th>
												<th style="padding-left: 35px;">닉네임(ID)</th>
												<th>삭제</th>
											</tr>
										</thead>
										<c:if test="${manage eq 'member' && not empty manageList }">
											<c:forEach var="list" items="${manageList }" varStatus="status">
												<tbody class="table-border-bottom-0">
													<tr>
														<td style="padding-left: 35px;">${(currentPage-1)*10 + status.count}</td>
														<td>
															<a href="${contextPath }/feed?id=${list.id}">
																${list.blogName }
															</a></td>		
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
										<c:if test="${manage eq 'member' && empty manageList }">
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
							<div class="tab-pane fade <c:if test="${manage eq 'post' }">active show</c:if>" id="postList" role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>번호</th>
												<th>작성자</th>
												<th>제목</th>
												<th>내용</th>
												<th>삭제</th>
											</tr>
										</thead>
										<c:if test="${manage eq 'post' && not empty manageList }">
											<c:forEach var="list" items="${manageList }" varStatus="status">							
												<tbody class="table-border-bottom-0">
													<tr>
														<td>${(currentPage-1)*10 + status.count}</td>
														<td><a href="${contextPath }/feed?id=${list.id}">${list.id }</a></td>
														<td><a href="${contextPath }/feed/detailPost?id=${list.id }&postId=${list.postId}" class="text">${list.title }</a></td>
														<td><a href="${contextPath }/feed/detailPost?id=${list.id }&postId=${list.postId}" class="text">${list.content }</a></td>
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
										<c:if test="${manage eq 'post' && empty manageList }">
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
							<div class="tab-pane fade <c:if test="${manage eq 'reply' }">active show</c:if>" id="replyList" role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>번호</th>
												<th>작성자</th>
												<th>제목</th>
												<th>댓글</th>
												<th>삭제</th>
											</tr>
										</thead>
										<c:if test="${manage eq 'reply' && not empty manageList }">
											<c:forEach var="list" items="${manageList }" varStatus="status">
												<tbody class="table-border-bottom-0">
													<tr>
														<td>${(currentPage-1)*10 + status.count}</td>
														<td><a href="${contextPath }/feed?id=${list.id}">${list.id }</a></td>
														<td><a href="${contextPath }/feed/detailPost?id=${list.id }&postId=${list.postId}" class="text">${list.title }</a></td>
														<td><span class="text">${list.reply }</span></td>
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
										<c:if test="${manage eq 'reply' && empty manageList }">
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
		<c:if test="${totalRowCount gt 0 }">
			<div>
				<ul class="pagination pageBlock">
					<c:if test="${startPageBlock gt 5 }">
						<li class="page-item prev"><a class="page-link"
							href="${contextPath }/manage/manageList?manage=${manage}&currentPage=${startPageBlock-5}">
								<i class="tf-icon bx bx-chevron-left"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPageBlock }"
						end="${endPageBlock }">
						<li class="page-item" id="currentBlock${i }"><a
							class="page-link"
							href="${contextPath }/manage/manageList?manage=${manage}&currentPage=${i}">${i }</a>
						</li>
					</c:forEach>
					<c:if
						test="${endPageBlock le totalRowCount && endPageBlock ge 5 && endPageBlock ne totalPageBlock}">
						<li class="page-item next"><a class="page-link"
							href="${contextPath }/manage/manageList?manage=${manage}&currentPage=${startPageBlock+5}">
								<i class="tf-icon bx bx-chevron-right"></i>
						</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>