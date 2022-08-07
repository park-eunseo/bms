<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-primary"
			style="width: 3rem; height: 3rem;" role="status">
			<span class="sr-only">Loading</span>
		</div>
	</div>
	<!-- Spinner End -->

	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
		<a href="${contextPath }/main"
			class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
			<span class="app-brand-text demo menu-text fw-bolder ms-2">simplog</span>
		</a>
		<!-- Search -->
		<div class="navbar-nav align-items-center">
			<div class="btn-group">
				<button type="button"
					class="btn btn-outline-primary dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">
					전체</button>
				<ul class="dropdown-menu">
					<li><button class="dropdown-item">작성자</button></li>
					<li><a class="dropdown-item" href="javascript:void(0);">블로그명</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);">제목</a></li>
					<li><a class="dropdown-item" href="javascript:void(0);">내용</a></li>
				</ul>
			</div>
			&ensp;&ensp;&ensp;&ensp;
			<div class="nav-item d-flex align-items-center">
				<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
					class="form-control border-0 shadow-none" placeholder="검색어를 입력하세요." />
			</div>
		</div>
		<!-- /Search -->

		<ul class="navbar-nav flex-row align-items-center ms-auto">
			<!-- Place this tag where you want the button to render. -->

			<!-- User -->
			<li><a class="dropdown-item" href="${contextPath }/member/register"> <i
					class="bx bxs-user me-2"></i> <span class="align-middle">회원가입</span>
			</a></li>
			<li><a class="dropdown-item" href="#"> <i
					class="bx bx-key me-2"></i> <span class="align-middle">비밀번호 찾기</span>
			</a></li>
			<li><a class="dropdown-item" href="${contextPath }/member/login"> <i
					class="bx bx-power-off me-2"></i> <span class="align-middle">로그인</span>
			</a></li>
		</ul>
		<!--/ User -->
	</nav>
	<!-- Navbar End -->
	<br><br>
</body>
</html>