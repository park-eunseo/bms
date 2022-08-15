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
		
		<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
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
						data-bs-toggle="dropdown" aria-expanded="false" style="padding: 0.4rem 1rem;">
						전체</button>
					<ul class="dropdown-menu">
						<li><button class="dropdown-item">작성자</button></li>
						<li><a class="dropdown-item" href="javascript:void(0);">블로그명</a></li>
						<li><a class="dropdown-item" href="javascript:void(0);">제목</a></li>
						<li><a class="dropdown-item" href="javascript:void(0);">내용</a></li>
					</ul>
				</div>
				&ensp;
				<form class="d-flex" onsubmit="return false">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-primary bx bx-search-alt-2" type="submit" style="padding: 0.4rem 0.8rem;"></button>
				</form>
			</div>
			<!-- /Search -->

			<button type="button" class="btn btn-primary"
				style="padding: 0.4375rem 0.7rem; margin-left: auto;" onclick="location.href='#'">
				<span class="tf-icons bx bx-pencil"></span>
			</button>
			<button type="button" class="btn btn-primary"
				style="padding: 0.4375rem 0.7rem; margin-left: 0.8rem" onclick="location.href='#'">
				<span class="tf-icons bx bxs-heart"></span>
			</button>
			<button type="button" class="btn btn-primary" style="padding: 0.4375rem 0.7rem;margin-left: auto;color: #696cff;background: #fff;border-color: #fff;box-shadow: none;" onclick="location.href='#'">
				<span class="tf-icons bx bxs-bell"></span>
			</button>
		</div>
	</nav>
</body>
</html>