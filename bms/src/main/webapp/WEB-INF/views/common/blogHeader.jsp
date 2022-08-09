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
	<nav
		class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
		id="layout-navbar">
		<div
			class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
			<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
				<i class="bx bx-menu bx-sm"></i>
			</a>
		</div>

		<div class="navbar-nav-right d-flex align-items-center"
			id="navbar-collapse">

			<!-- Search -->
			<div class="navbar-nav align-items-center">
				<div class="btn-group" style="display: inline-block;">
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
				<div class="nav-item d-flex align-items-center"  style="display: inline-block;">
					<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
						class="form-control border-0 shadow-none"
						placeholder="검색어를 입력하세요." />
				</div>
			</div>
			<!-- /Search -->

			<ul class="navbar-nav flex-row align-items-center ms-auto">
				<!-- Place this tag where you want the button to render. -->

				<!-- User -->


				<!--/ User -->
			</ul>
		</div>
	</nav>
</body>
</html>