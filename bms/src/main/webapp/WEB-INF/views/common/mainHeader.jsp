<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.selectBox {
	display: inline-block;
	box-shadow: none;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
	border-right: none;
	max-width: max-content;
}

.searchText {
	border-start-start-radius: 0px;
	border-bottom-left-radius: 0px;
}
</style>
<script>
	function searchEnter() {
		var searchKeyword = $("#searchKeyword").val()
		var searchWord = $("#searchWord").val()

		if (window.event.keyCode == 13) { // 엔터 
			if (searchWord == "") {
				alert("검색어를 입력해 주세요.")
				return false
			}

			location.href = "${contextPath}/search?searchKeyword="
					+ searchKeyword + "&searchWord=" + searchWord
		}
	}

	function search() {
		var searchKeyword = $("#searchKeyword").val()
		var searchWord = $("#searchWord").val()

		if (searchWord == "") {
			alert("검색어를 입력해 주세요.")
			return false
		}

		location.href = "${contextPath}/search?searchKeyword=" + searchKeyword
				+ "&searchWord=" + searchWord

	}
</script>
</head>
<body>
	<!-- Navbar Start -->
	<nav class="navbar navbar-expand-lg navbar-light sticky-top p-0"
		style="background-color: #f4f4f4; margin-bottom: 2rem;">
		<a
			href="${contextPath }/<c:if test="${sessionScope.role eq 'admin' }">admin</c:if>"
			class="navbar-brand d-flex align-items-center px-4"> <span
			class="app-brand-text demo menu-text fw-bolder ms-2">sim8log</span>
		</a>

		<button type="button" class="navbar-toggler me-4 collapsed"
			data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
			aria-expanded="false">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- Search -->
		<div class="navbar-collapse collapse" id="navbarCollapse">
			<div>
				<c:if test="${sessionScope.role ne 'admin' }">
					<!-- 전체 회원 범위 -->
					<div class="input-group" style="box-shadow: none">
						<select id="searchKeyword" name="searchKeyword"
							class="form-select selectBox form-select-sm"
							style="box-shadow: none">
							<option value="member">작성자</option>
							<option value="blogName">블로그명</option>
							<option value="post">게시글</option>
						</select> <input type="text" id="searchWord" name="searchWord"
							onkeypress="searchEnter()" class="form-control searchText"
							placeholder="Search">
						<button type="button" onclick="search()" class="input-group-text">
							<i class="tf-icons bx bx-search"></i>
						</button>
					</div>
				</c:if>
			</div>
			<c:choose>
				<c:when test="${sessionScope.memberId eq null }">
					<!-- 가져올 세션이 없다면, 로그인한 회원이 없다면 -->
					<div class="navbar-nav ms-auto p-4 p-lg-0" style="">
						<a href="${contextPath }/member/register"
							class="nav-item nav-link" style="font-size: initial;">회원가입</a> <a
							href="${contextPath }/member/login" class="nav-item nav-link"
							style="font-size: initial;">로그인</a>
					</div>
				</c:when>
				<c:when test="${sessionScope.role eq 'client' }">
					<!-- 세션이 있고 클라이언트 계정이라면 -->
					<div class="navbar-nav ms-auto p-4 p-lg-0" style="">
						<a
							href="${contextPath }/feed?id=${sessionScope.memberId}&searchWord="
							class="nav-item nav-link">내 블로그</a>
						<div class="nav-item dropdown">
							<a href="#" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">${sessionScope.memberNickname } 님</a>
							<div class="dropdown-menu bg-light m-0" style="right: 0px;">
								<a
									href="${contextPath }/member/modify?id=${sessionScope.memberId}"
									class="dropdown-item">내 정보 수정</a> <a
									href="${contextPath }/member/logout" class="dropdown-item">로그아웃</a>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 세션이 있고 관리자 계정이라면 -->
					<div class="navbar-nav ms-auto p-4 p-lg-0" style="right: 0px;">
						<div class="nav-item dropdown">
							<a href="${contextPath }/feed" class="nav-link dropdown-toggle"
								data-bs-toggle="dropdown">관리자 님</a>
							<div class="dropdown-menu bg-light m-0">
								<a href="${contextPath }/member/logout" class="dropdown-item">로그아웃</a>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!-- /Search -->
	</nav>
	<!-- Navbar End -->
</body>
</html>