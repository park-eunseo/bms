<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script>
<script>
	var memberId = '<%=(String)session.getAttribute("memberId")%>'
	var likeClick = false // 기본값 false
	
	$().ready(function(){
		$.ajax({
			type : "get",
			url : "${contextPath}/getLikePost?memberId=" + memberId + "&postId=" + ${detailPost.postId},
			success : function(data){
				if(data){ // 버튼을 이미 눌렀었다면
					document.getElementById("likePost").classList.replace('bx-heart', 'bxs-heart')
					likeClick = true
				} 
			}
		});
	});

	function deletePost(){
		var check = confirm("삭제하시겠습니까?")
		
		if(check){
			location.href="${contextPath }/feed/deletePost?postId=${detailPost.postId}"
		} else {
			history.go(0)
		}
	}
	
	function likePost(){ 
		if(likeClick == true){ // 좋아요 O -> 좋아요 X
			$.ajax({
				type : "get",
				url : "${contextPath}/notLikePost?memberId=" + memberId + "&postId=" + ${detailPost.postId} 
			});
		
			document.getElementById("likePost").classList.replace('bxs-heart', 'bx-heart')
			likeClick = false
		} else { // 좋아요 X -> 좋아요 O
			$.ajax({
				type : "get",
				url : "${contextPath}/likePost?memberId=" + memberId + "&postId=" + ${detailPost.postId} 
			});
		
			document.getElementById("likePost").classList.replace('bx-heart', 'bxs-heart')	
			likeClick = true;
		}
	}
</script>
</head>
<body>
	<div class="row d-flex">
		<div class="col-lg-8 px-md-5 py-5" style="width: 100%; margin-top: -20px; color: black;">
			<div style="text-align-last: end;">
				<div class="btn-group">
					<button type="button" style="width: 2rem; height: 2rem;"
						class="btn btn-primary btn-icon rounded-pill dropdown-toggle hide-arrow"
						data-bs-toggle="dropdown" aria-expanded="false">
						<i class="bx bx-dots-vertical-rounded"></i>
					</button>
					<ul class="dropdown-menu dropdown-menu-end"
						style="text-align-last: start; min-inline-size: auto;">
						<li><a class="dropdown-item"
								href="${contextPath }/feed/modifyPost?postId=${detailPost.postId}">수정하기</a></li>
						<li><button class="dropdown-item" onclick="deletePost()">삭제하기</button></li>
					</ul>
				</div>
			</div>
			<div>
				
			</div>
			<div class="row pt-md-4" style="margin-top: -20px;">
			<h4 style="text-align-last: center;color: #7676767d;font-weight: 200; padding-bottom: 10px;">
						[${detailPost.categoryTitle }]</h4>
				<h2 class="mb-3"
					style="text-align-last: center; word-break: break-all; padding-bottom: 20px; color:#000000">${detailPost.title }</h2>
				<span class="text-muted">${detailPost.regDate }</span>
				<hr style="height: 0.03rem; margin-top: 1rem;">
				<p style="text-align-last: center; color:#000000">${detailPost.content }</p>
				
				
				<div class="pt-5 mt-5">
					<!-- 댓글 시작 -->
					<div>
						<!-- 게시글 좋아요 -->
						<button type="button" onclick="likePost()" id="likePost"
								class="btn bx bx-heart" style="font-size: 1.2rem; color: red; margin-bottom: -15px; margin-left: -20px;">
						</button>
						<h6 id="likePostCount" style="margin-left: -22px; vertical-align: bottom; display: inline; font-size: 15px; color: #626262;">2</h6>
						&ensp;
						<!-- 댓글 -->
						<i class="bx bx-message-rounded-dots" style="font-size: 1.2rem; margin-bottom: -15px;"></i>
						<h6 style=" vertical-align: bottom; display: inline; font-size: 15px; color: #626262;">3</h6>
					</div>
					<hr>
					<ul class="comment-list">
						<li class="comment">
							<div class="comment-body">
								<img src="#" style="display: inlin-block;">
								<h6 style="display: inline-block;">John Doe</h6>
								<div class="meta">입력 날짜</div>
								<p>댓글 내용</p>
								<p>
									<a href="#" class="reply">답글달기</a>
								</p>
							</div>

							<ul class="children">
								<!-- 대댓글 -->
								<li class="comment">
									<div class="comment-body">
										<img src="#" style="display: inlin-block;">
										<h6 style="display: inline-block;">John Doe</h6>
										<div class="meta">October 03, 2018 at 2:21pm</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Pariatur quidem laborum necessitatibus, ipsam impedit
											vitae autem, eum officia, fugiat saepe enim sapiente iste
											iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
										<p>
											<a href="#" class="reply">Reply</a>
										</p>
									</div>
								</li>
							</ul>
						</li>
					</ul>
					<!-- END comment-list -->

					<div class="comment-form-wrap pt-5">
						<form action="#" class="p-3 p-md-5 bg-light" style="margin-top: -40px;">
							<div class="form-group">
								<i class="bx bx-message-rounded-dots"></i> &ensp;<label for="message">댓글</label>
								<textarea name="" id="message"
									style="resize: none; height: 60px; margin-bottom: 15px; margin-top: 8px;" placeholder="댓글을 남겨보세요."
									cols="30" rows="5" class="form-control"></textarea>
							</div>
							<div class="form-group" style="text-align-last: end;">
								<input type="submit" value="작성" class="btn btn-primary">
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>