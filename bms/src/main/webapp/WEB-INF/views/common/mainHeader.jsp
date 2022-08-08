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
			<span class="app-brand-text demo menu-text fw-bolder ms-2">sim8log</span>
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
			<c:choose>
				<c:when test="${sessionScope.memberId eq null }"> <!-- 가져올 세션이 없다면, 로그인한 회원이 없다면 -->
					<li class="nav-item">
                        <a class="nav-link" style="display: inline-block;" href="${contextPath }/member/register">
                        <i class="bx bxs-user me-2" style="color:#878787; display: inline-block;"></i>회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" style="display: inline-block;">
                        <i class="bx bx-key me-2" style="color:#878787; display: inline-block; "></i>ID/PW 찾기</a>
                    </li>
					<li class="nav-item">
						<a class="nav-link" style="display: inline-block;"href="${contextPath }/member/login">
						<i class="bx bx-power-off me-2" style="display: inline-block;"></i> 로그인</a>
					</li>		
				</c:when>
				<c:when test="${sessionScope.role eq 'client' }"> <!-- 세션이 있고 클라이언트 계정이라면 -->			
					<ul class="navbar-nav me-auto mb-2 mb-lg-0" style="font-size: 13px">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="javascript:void(0)" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="bx bxs-user me-2" style="color:#878787; display: inline-block;"></i>${sessionScope.memberNickname } 님
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <li><a class="dropdown-item" href="${contextPath }/member/modify?id=${sessionScope.memberId}"><i class="bx bx-user me-2"></i>내 정보 수정</a></li>
                          <li><a class="dropdown-item" href="${contextPath }/member/logout">
								<i class="bx bx-power-off me-2"></i>로그아웃</a>
						  </li>
                        </ul>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="${contextPath }/blog">내 블로그</a>
                      </li>
                    </ul>
				</c:when>
				<c:otherwise> <!-- 세션이 있고 관리자 계정이라면 -->
					<li><a class="dropdown-item" href="#"> 
						<i class="bx bxs-user me-2"></i> <span class="align-middle">회원 관리</span>
					</a></li>
					<li class="nav-item navbar-dropdown dropdown-user dropdown">
						<a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown" aria-expanded="false"> 
							<span>${sessionScope.memberId } 님</span>
						</a>
					<ul class="dropdown-menu dropdown-menu-end">
						<li>
							<a class="dropdown-item" href="#"> 
								<i class="bx bx-user me-2"></i> 
								<span class="align-middle">내 정보 수정</span>
						</a></li>
						<li><a class="dropdown-item" href="${contextPath }/member/logout">
								<i class="bx bx-power-off me-2"></i> <span class="align-middle">로그아웃</span>
						</a></li>
					</ul></li>
				</c:otherwise>
			</c:choose>
		</ul>
		<!--/ User -->
	</nav>
	<!-- Navbar End -->
	<br><br>
</body>
</html>