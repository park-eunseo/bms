<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.author {
	margin-left: 3px;
	padding: 1px 8px;
	border-width: 1px 1px 1px 1px;
	border-style: solid;
	border-radius: 18px;
	font-size: 10px;
	color: burlywood;
}

.category {
	text-align-last: center;
	color: #515050ed;
	font-weight: 200;
	padding-bottom: 10px;
}

.replyBtn {
	font-size: smaller;
	padding-block: 2px;
	padding-inline: 8px;
}

.profileImg {
	width: 1.5rem;
	height: 1.5rem;
	margin-right: 0.2rem;
}

.nickname {
	display: inline-block;
	font-size: inherit;
	vertical-align: sub;
	margin-bottom: 0.5rem
}

.re_reply {
	display: inline-grid;
	margin-left: -1.5rem;
}

.re_right {
	color: #afafaf;
	font-size: 1rem;
	font-weight: 100;
}

.mention {
	font-size: medium;
	font-weight: 600;
}

.basicTReply {
	resize: none;
	height: 60px;
	margin-bottom: 15px;
	margin-top: 8px;
}

.count {
	vertical-align: bottom;
	display: inline;
	font-size: 15px;
	color: #626262;
}
</style>
<script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script>
<script>
	var memberId = '<%=(String) session.getAttribute("memberId")%>'
	var likeClick = false // 기본값 false
	
	// 좋아요 버튼값 
	$.ajax({
		type : "get",
		url : "${contextPath}/feed/getLikePost?memberId=" + memberId + "&postId=${detailPost.postId}",
		success : function(data){
			if(data) { 
				document.getElementById("likePost").classList.replace('bx-heart', 'bxs-heart') 
				likeClick = true
				
				likeCount()
			};
		}
	});
	
	function likeCount() { // 좋아요 개수
		$.ajax({
			type : "get",
			url : "${contextPath}/feed/getLikeCount?postId=${detailPost.postId}",
			success : function(data){
				document.getElementById("likeCount").innerText = data
			}
		});
	}
	
	function replyCount() { // 댓글 개수
		$.ajax({
			type : "get",
			url : "${contextPath}/feed/getReplyCount?postId=${detailPost.postId}",
			success : function(data){
				document.getElementById("replyCount").innerText = data
			}
		});
	}
	
	function likePost(){ // 좋아요 버튼 눌렀을 때 이벤트
		if(memberId == null || memberId == 'null'){
			alert("로그인 후 이용 가능합니다.")
			location.href = "${contextPath}/member/login"
			return false
		}
	
		if(likeClick){ // 좋아요 O -> 좋아요 X(좋아요 개수 - 1)
			$.ajax({
				type : "get",
				async : false, // async : true가 기본 설정(비동기식 처리: 병렬적), false(동기식 처리: 직렬적)
				url : "${contextPath}/manage/notLikePost?memberId=" + memberId + "&postId=${detailPost.postId}" // 회원의 해당 게시글 좋아요한 행 제거한 후
			});
			// 비동기식 방식 사용 시 1차 결과값을 기다리지 않고 다음 함수와 같이 실행되기 때문에 2차로 받고자 하는 값을 정확하게 받지 못한다.
			
			likeCount()
			document.getElementById("likePost").classList.replace('bxs-heart', 'bx-heart')
			likeClick = false
		} else { // 좋아요 X -> 좋아요 O(좋아요 개수 + 1) & 작성자에게 알림
			$.ajax({
				type : "get",
				async : false, 
				url : "${contextPath}/manage/likePost?memberId=" + memberId + "&postId=${detailPost.postId}"
			})
			
			if(memberId != '${detailPost.memberId}'){ // 본인이 본인 게시글에 누르면 알림 X
				$.ajax({
					type : "post",
					url : "${contextPath}/notice/addNotice?fromId=" + memberId + "&toId=${detailPost.memberId}&postId=${detailPost.postId}&category=like"
				})
			}
			
			likeCount()
			document.getElementById("likePost").classList.replace('bx-heart', 'bxs-heart')	
			likeClick = true;
		}
	}
	
	function deletePost(){
		var check = confirm("삭제하시겠습니까?")
		
		if(check){
			location.href="${contextPath }/feed/deletePost?postId=${detailPost.postId}"
		} else {
			history.go(0)
		}
	}
	
	function replyCheck(action){  // 작성자에게 알림
		var content = document.getElementById("content")	
		
		if(memberId == null || memberId == 'null'){
			alert("로그인 후 이용 가능합니다.")
			location.href = "${contextPath}/member/login"
			return false
		}
		
		if(content.value == ""){
			alert("댓글은 한 글자 이상으로 작성해 주세요.")
			return false
		}
		
		replyCount()

		if(memberId != '${detailPost.memberId}' && action != 'modify'){ // 본인이 본인 게시글에 단 댓글과 수정한 댓글은 알림 X
			$.ajax({
				type : "post",
				url : "${contextPath}/notice/addNotice?fromId=" + memberId + "&toId=${detailPost.memberId}&postId=${detailPost.postId}&category=reply"
			})
		}
	}
	
	function re_replyCheck(replyId, replyMemberId){ // 댓글 입력값 체크 후 폼 이동(replyId: 상위 댓글 INDEX ID,replyMemberId: 상위 댓글 회원 ID)
		if(memberId == null || memberId == 'null'){
			alert("로그인 후 이용 가능합니다.")
			location.href = "${contextPath}/member/login"
			return false
		}
		
		if($("#reContent" + replyId).val() == ""){
			alert("댓글은 한 글자 이상으로 작성해 주세요.")
			return false
		}	
		
		replyCount()
		
		// 상위 댓글 ID와 게시글 작성자 ID와 일치하다면 답댓글 알림 X 댓글 알림만
		if(memberId != replyMemberId && '${detailPost.memberId}' != replyMemberId){	
			// 답댓글 단 상위 댓글에게 답댓글 알림
			$.ajax({
				type : "post",
				url : "${contextPath}/notice/addNotice?fromId=" + memberId 
						+ "&toId=" + replyMemberId +"&postId=${detailPost.postId}&replyId=" + replyId + "&category=re_reply"
			})
		}
		
		// 본인이 본인 게시글에 단 댓글 알림 X
		if(memberId != '${detailPost.memberId}'){ 
			// 답댓글 달린 글 작성자에게 댓글 알림
			$.ajax({
				type : "post",
				url : "${contextPath}/notice/addNotice?fromId=" + memberId 
						+ "&toId=${detailPost.memberId}&postId=${detailPost.postId}&replyId=" + replyId + "&category=reply"
			})
		}
	}
	
	function re_reply(replyId){ // 답글 버튼 누르면 입력란 보이게
		$("#re_reply" + replyId).css("display", "")
		
		$("#reCancel" + replyId).click(function(){
			$("#re_reply" + replyId).css("display", "none")
		})
	}
	
	
	function deleteReply(replyId, topReplyId){
		var del = confirm("선택하신 댓글을 삭제하시겠습니다?")
		
		if(del){
			location.href = "${contextPath}/feed/deleteReply?replyId=" + replyId + "&topReplyId=" + topReplyId + "&postId=" + ${detailPost.postId}
		}
	}
	
	function modifyReply(replyId, postId){ // 댓글 수정 버튼을 누르면
		var content = $("#content" + replyId).text() // 기존 댓글 가져오고
		var changeHtml = $("#modifyReply" + replyId) // html 변경할 요소 id 가져오고
		var origin = $("#modifyReply" + replyId).html() // 기존 html 
		
		$("#replySetting" + replyId).hide() // 댓글 수정, 삭제 버튼 숨기고

		var replyHtml = "<form action='${contextPath}/feed/modifyReply?id=${detailPost.memberId}' onsubmit='return replyCheck('modify')' method='post'>"
					+ "<input type='text' class='form-control' style='margin-top: 0.5rem;' name='content' id='content' value='" + content +"'>"
					+ "<input type='hidden' name='replyId' value='" + replyId +"'>"
					+ "<input type='hidden' name='postId' value='" + postId +"'>"
					+ "<div class='form-group' style='text-align-last: end; '>"
					+ "<input type='button' value='취소' id='modifyCancel' class='btn' style='padding: 3px 10px;'>"
					+ "<input type='submit' value='등록' class='btn' style='padding: 3px 10px;'>"
					+ "</div>"
					+ "</form>"
					
		changeHtml.html(replyHtml)
		
		$("#modifyCancel").click(function(){ // 답글 다는 것을 취소하면
			changeHtml.html(origin)			// 입력란 없애고 원래 댓글로
			$("#replySetting" + replyId).show()	// 댓글 설정 버튼 보이게
		})
	}

</script>
</head>
<body>
	<div style="text-align: -webkit-center;">
		<div class="col-lg-8 px-md-5 py-5"
			style="width: 85%; margin-top: -20px; color: black;">
			<c:if test="${sessionScope.memberId eq detailPost.memberId}">
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
			</c:if>
			<div class="row pt-md-4" style="margin-top: -20px;">
				<h4 class="category">[${detailPost.categoryTitle }]</h4>
				<h2 class="mb-3"
					style="text-align-last: center; word-break: break-all; padding-bottom: 20px; color: #000000">${detailPost.title }</h2>
				<span class="text-muted" style="text-align: -webkit-left;">${detailPost.regDate }
					<c:if test="${detailPost.postPrivate eq 'Y' }">&ensp;|&ensp;비공개</c:if>
				</span>
				<hr style="height: 0.03rem; margin-top: 1rem;">
				<p style="text-align-last: center; color: #000000">${detailPost.content }</p>


				<div class="pt-5 mt-5" style="text-align-last: left;">
					<div>
						<!-- 게시글 좋아요, 댓글 -->
						<button type="button" onclick="likePost()" id="likePost"
							class="btn bx bx-heart"
							style="font-size: 1.2rem; color: red; margin-bottom: -15px; margin-left: -20px;">
						</button>
						<h6 id="likeCount" class="count" style="margin-left: -22px;">${detailPost.likeCount }</h6>
						&ensp;
						<!-- 댓글 -->
						<i class="bx bx-message-rounded-dots"
							style="font-size: 1.2rem; margin-bottom: -15px;"></i>
						<h6 id="replyCount" class="count">${detailPost.replyCount }</h6>
					</div>
					<hr>
					<!-- 댓글 시작 -->
					<ul class="comment-list" id="replyStart"
						style="list-style: none; padding-left: 0px;">
						<li class="comment"><c:choose>
								<c:when test="${not empty replyList }">
									<c:forEach var="reply1" items="${replyList }">
										<!-- 1차 댓글 -->
										<c:if test="${empty reply1.topReplyId }">
											<!-- 내용이 있다면 -->
											<c:choose>
												<c:when test="${reply1.content ne ''}">
													<div class="comment-body" style="padding-inline: 0.5rem;">
														<div
															style="display: flex; justify-content: space-between;">
															<div>
																<img
																	src="${contextPath }/member/thumbnails?profileName=${reply1.profileName}"
																	onclick="location.href='${contextPath}/feed?id=${reply1.memberId }'"
																	class="w-px-40 rounded-circle profileImg">
																<h6 class="nickname">${reply1.nickname }</h6>
																<c:if test="${reply1.memberId eq detailPost.memberId }">
																	<span class="author">작성자</span>
																</c:if>
															</div>
															<c:if test="${reply1.memberId eq sessionScope.memberId}">
																<!-- 내 계정에서 쓴 댓글이면 수정 가능하게 -->
																<div class="btn-group"
																	id="replySetting${reply1.replyId }">
																	<button type="button"
																		style="width: 2rem; height: 2rem;"
																		class="btn btn-icon rounded-pill dropdown-toggle hide-arrow"
																		data-bs-toggle="dropdown" aria-expanded="false">
																		<i class="bx bx-dots-vertical-rounded"></i>
																	</button>
																	<ul class="dropdown-menu dropdown-menu-end"
																		style="text-align-last: start; min-inline-size: auto;">
																		<li><button class="dropdown-item"
																				onclick="modifyReply('${reply1.replyId }', '${reply1.postId }')">수정</button></li>
																		<li><button class="dropdown-item"
																				onclick="deleteReply('${reply1.replyId}')">삭제</button></li>
																	</ul>
																	<input type="hidden" name="replyId"
																		value="${reply1.replyId }">
																</div>
															</c:if>
														</div>
														<!--  댓글 정보, 답댓글 달 때 버튼(댓글 수정할 때 바뀌는 부분) -->
														<div id="modifyReply${reply1.replyId }">
															<p id="content${reply1.replyId }"
																style="margin-bottom: auto; text-align: -webkit-left;">${reply1.content }</p>
															<div style="margin-bottom: 0.6rem;">
																<span class="text-muted" style="font-size: smaller;">${reply1.regDate }</span>
															</div>
															<div class="form-group" style="margin-top: -4px;">
																<input type="submit" value="답글"
																	onclick="re_reply('${reply1.replyId}')"
																	class="btn btn-outline-dark replyBtn">
															</div>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<!-- 내용이 비어있으면 삭제된 것 -->
													<div class="comment-body" style="padding-inline: 0.5rem;">
														<span>삭제된 댓글입니다.</span>
													</div>
												</c:otherwise>
											</c:choose>
											<c:forEach var="reply2" items="${replyList }">
												<c:if test="${reply1.replyId eq reply2.topReplyId }">
													<hr>
													<div>
													<div class="comment-body" style="padding-left: 20px;">
														<div
															style="display: flex; justify-content: space-between;">
															<div>
																<span class="re_right">ㄴ</span> <img
																	src="${contextPath }/member/thumbnails?profileName=${reply2.profileName}"
																	onclick="location.href='${contextPath}/feed?id=${reply2.memberId }'"
																	class="w-px-40 rounded-circle profileImg">
																<h6 class="nickname">${reply2.nickname }</h6>
																<c:if test="${reply2.memberId eq detailPost.memberId }">
																	<span class="author">작성자</span>
																</c:if>
															</div>
															<c:if test="${reply2.memberId eq sessionScope.memberId}">
																<!-- 내 계정에서 쓴 댓글이면 수정 가능하게 -->
																<div class="btn-group"
																	id="replySetting${reply2.replyId }">
																	<button type="button"
																		style="width: 2rem; height: 2rem;"
																		class="btn btn-icon rounded-pill dropdown-toggle hide-arrow"
																		data-bs-toggle="dropdown" aria-expanded="false">
																		<i class="bx bx-dots-vertical-rounded"></i>
																	</button>
																	<ul class="dropdown-menu dropdown-menu-end"
																		style="text-align-last: start; min-inline-size: auto;">
																		<li><button class="dropdown-item"
																				onclick="modifyReply('${reply2.replyId }', '${reply2.postId }')">수정</button></li>
																		<li><button class="dropdown-item"
																				onclick="deleteReply('${reply2.replyId}', '${reply2.topReplyId }')">삭제</button></li>
																	</ul>
																	<input type="hidden" name="replyId"
																		value="${reply2.replyId }">
																</div>
															</c:if>
														</div>
														<!--  댓글 정보, 답댓글 달 때 버튼(댓글 수정할 때 바뀌는 부분) -->
														<div id="modifyReply${reply2.replyId }"
															style="padding-left: 17px;">
															<a href="${contextPath}/feed?id=${reply1.memberId }"
																class="mention">@${reply2.mention }</a>
															<p id="content${reply2.replyId }"
																style="margin-left: 0.4rem; display: inline;">${reply2.content }</p>
															<div style="margin-bottom: 0.6rem;">
																<span class="text-muted" style="font-size: smaller;">${reply2.regDate }</span>
															</div>
															<div class="form-group" style="margin-top: -4px;">
																<input type="submit" value="답글"
																	onclick="re_reply('${reply2.replyId}')"
																	class="btn btn-outline-dark replyBtn">
															</div>
														</div>
													</div>
												</div>
												
												<!-- 답댓글 작성란-->
												<div class="comment-form-wrap"
													id="re_reply${reply2.replyId }" style="display: none;">
													<form action="${contextPath }/feed/writeReply?id=${detailPost.memberId}"
														onsubmit="return re_replyCheck('${reply2.replyId }', '${reply2.memberId }')"
														method="post" class="bg-light">
														<div class="form-group">
															<textarea name="content" id="reContent${reply2.replyId }"
																style="resize: none; margin-bottom: 5px; margin-top: 8px;"
																placeholder="${reply2.nickname }님에게 댓글을 남겨보세요."
																cols="30" rows="2" class="form-control"></textarea>
														</div>
														<div class="form-group" style="text-align-last: end;">
															<input type="button" value="취소"
																id="reCancel${reply2.replyId }" class="btn"
																style="padding: 3px 10px;"> <input type="submit"
																value="등록" class="btn" style="padding: 3px 10px;">
														</div>
														<input type="hidden" name="memberId"
															value="${sessionScope.memberId }"> <input
															type="hidden" name="postId" value="${detailPost.postId }">
														<input type="hidden" name="topReplyId"
															value="${reply1.replyId }"> <input type="hidden"
															name="mention" value="${reply2.nickname }">
													</form>
												</div>
												</c:if>
											</c:forEach>
											
											<!-- 답댓글 작성란-->
											<div class="comment-form-wrap"
												id="re_reply${reply1.replyId }" style="display: none;">
												<form action="${contextPath }/feed/writeReply?id=${detailPost.memberId}"
													onsubmit="return re_replyCheck('${reply1.replyId }', '${reply1.memberId }')"
													method="post" class="bg-light">
													<div class="form-group">
														<textarea name="content" id="reContent${reply1.replyId }"
															style="resize: none; margin-bottom: 5px; margin-top: 8px;"
															placeholder="${reply1.nickname }님에게 댓글을 남겨보세요." cols="30"
															rows="2" class="form-control"></textarea>
													</div>
													<div class="form-group" style="text-align-last: end;">
														<input type="button" value="취소"
															id="reCancel${reply1.replyId }" class="btn"
															style="padding: 3px 10px;"> <input type="submit"
															value="등록" class="btn" style="padding: 3px 10px;">
													</div>
													<input type="hidden" name="memberId"
														value="${sessionScope.memberId }"> <input
														type="hidden" name="postId" value="${detailPost.postId }">
													<input type="hidden" name="topReplyId"
														value="${reply1.replyId }"> <input type="hidden"
														name="mention" value="${reply1.nickname }">
												</form>
											</div>
											<hr>
										</c:if>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="comment-body" style="text-align-last: center;">
										<span style="font-size: large; color: darkgray;">첫 댓글을
											남겨보세요.</span>
									</div>
								</c:otherwise>
							</c:choose></li>
					</ul>
					<!-- END comment-list -->

					<!-- 기본 댓글 -->
					<div class="comment-form-wrap pt-5">
						<form action="${contextPath }/feed/writeReply?id=${detailPost.memberId}"
							onsubmit="return replyCheck()" method="post" class="p-3 bg-light"
							style="margin-top: -40px;">
							<div class="form-group">
								<i class="bx bx-message-rounded-dots"></i> &ensp; <label
									for="message">댓글</label>
								<textarea name="content" id="content" placeholder="댓글을 남겨보세요."
									cols="30" rows="5" class="form-control basicTReply"></textarea>
								<small id="replyAlert" style="color: red;"></small>
							</div>
							<div class="form-group"
								style="text-align-last: end; margin-top: -5px;">
								<input type="submit" value="등록" class="btn btn-primary">
							</div>
							<input type="hidden" name="postId" value="${detailPost.postId }">
							<input type="hidden" name="memberId" value="${sessionScope.memberId }">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>