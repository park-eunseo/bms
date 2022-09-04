<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.memberSearch {
	width: 35%;
	padding: 1rem;
}

.pageBlock {
	justify-content: center;
	margin-block-start: 4rem;
}

.notice {
	text-align-last: end;
	margin-right: 3rem;
	margin-top: -15px;
	margin-bottom: 1rem;
	font-weight: 600;
}
</style>
<script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script>
<script>
	$().ready(function() {
		$("#currentBlock${currentPage}").addClass("active")
	})

	function search() {
		if (window.event.keyCode == 13) {
			var searchWord = document.getElementById("searchWord")
			location.href = "${contextPath}/admin?searchWord="
					+ searchWord.value
		}
	}

	function deleteMember(memberId) {
		var deleteMember = confirm("해당 회원의 정보가 전부 삭제됩니다. 탈퇴시키겠습니까?")

		if (deleteMember) {
			$.ajax({
				type : "get",
				url : "${contextPath}/admin/deleteMember?id=" + memberId,
				success : function() {
					alert("회원 강제 탈퇴가 완료되었습니다.")
					history.go(0)
				}
			})
		} else {
			return false
		}
	}
</script>
</head>
<body>
	<div class="notice">
		<a href="${contextPath }/admin/noticeList"><i class="bx bx-chevron-right"></i> 공지사항 목록</a><br> 
		<a href="${contextPath }/admin/writeNotice"><i class="bx bx-chevron-right"></i> 공지사항 작성</a>
	</div>
	<div class="card"
		style="width: 95%; min-height: 400px; margin-inline: auto;">
		<h5 class="card-header" style="padding-bottom: 0;">회원 관리 목록</h5>
		<div class="input-group memberSearch">
			<span class="input-group-text"><i
				class="tf-icons bx bx-search"></i></span> <input type="text"
				class="form-control" id="searchWord" onkeyup="search()"
				placeholder="검색할 회원 ID를 입력하세요.">
		</div>
		<div class="table-responsive text-nowrap"
			style="padding: 1rem; padding-top: 0;">
			<span>전체(${totalMemberCount })</span>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>ID(블로그명)</th>
						<th>전화번호</th>
						<th>email</th>
						<th>생년월일</th>
						<th>성별</th>
						<th>가입일</th>
						<th>최근 접속일</th>
						<th>강제 탈퇴</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${not empty memberList }">
						<c:forEach var="member" items="${memberList }" varStatus="status">
							<tbody class="table-border-bottom-0">
								<tr>
									<td>${(currentPage-1)*10 + status.count}</td>
									<td><a
										href="${contextPath }/admin/memberPostList?id=${member.id}">${member.id }(${member.blogName })</a></td>
									<td>${member.tel }</td>
									<td>${member.email }</td>
									<td>${member.birth }</td>
									<td>${member.gender }</td>
									<td>${member.regDate }</td>
									<td>${member.recentLogin }</td>
									<td>
										<button type="button" onclick="deleteMember('${member.id}')"
											style="width: 1.5rem; height: 1.5rem;"
											class="btn btn-icon btn-outline-danger">
											<i class='bx bxs-user-minus'></i>
										</button>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tbody class="table-border-bottom-0">
							<tr>
								<td colspan="9" style="text-align-last: center;">가입한 회원이
									없습니다.</td>
							</tr>
						</tbody>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<c:if test="${totalMemberCount gt 0 }">
			<div>
				<ul class="pagination pageBlock">
					<c:if test="${startPageBlock gt 5 }">
						<li class="page-item prev"><a class="page-link"
							href="${contextPath }/admin?currentPage=${startPageBlock-5}">
								<i class="tf-icon bx bx-chevron-left"></i>
						</a></li>
					</c:if>
					<c:forEach var="i" begin="${startPageBlock }"
						end="${endPageBlock }">
						<li class="page-item" id="currentBlock${i }"><a
							class="page-link"
							href="${contextPath }/admin?currentPage=${startPageBlock-5}">${i }</a>
						</li>
					</c:forEach>
					<c:if
						test="${endPageBlock le totalMemberCount && endPageBlock ge 5 && endPageBlock ne totalPageBlock}">
						<li class="page-item next"><a class="page-link"
							href="${contextPath }/admin?currentPage=${startPageBlock-5}">
								<i class="tf-icon bx bx-chevron-right"></i>
						</a></li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>