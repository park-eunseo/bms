<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.headerHr {
	width: 0.7px;
	height: 30px;
	margin-left: 2px;
	margin-right: 2px;
}

.headerBtn {
	padding: 0.4375rem 0.5rem;
	display: list-item;
	margin-left: auto;
	color: #3d3d3d;
	background: none;
	border-color: #fff;
	box-shadow: none;
}
</style>
<script>
	function search(){
		var searchWord = document.getElementById("searchWord")
		location.href = "${contextPath}/feed?id=${memberInfo.id}&searchWord=" + searchWord.value
	}
</script>
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
      
		<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">

			<!-- Search -->
			<div class="navbar-nav align-items-center" style="display: -webkit-inline-box;">
			 <!-- 현재 페이지인 블로그 범위 -->
					<div class="input-group">
						<input type="text" id="searchWord" class="form-control" placeholder="Search">
						<button type="button" class="input-group-text" onclick="search()">
							<i class="tf-icons bx bx-search"></i>
						</button>
					</div>
			</div>
			<hr>
			<!-- /Search -->
			
			<div class="navbar-nav align-items-center" style="display: -webkit-inline-box; margin-left: auto; margin-right: -15px;">
				<c:choose>
					<c:when test="${memberInfo.id eq  sessionScope.memberId}">
						<button type="button" class="btn rounded-pill headerBtn"
							onclick="location.href='${contextPath}/feed/writePost'">
							<span class="tf-icons bx bx-pencil"></span>
						</button>
						<hr style="	width: 0.7px; height: 30px; margin-left: 2px; margin-right: 2px;">
						<button type="button" class="btn rounded-pill headerBtn"
							onclick="location.href='${contextPath}/manage/manageList'">
							<span class="tf-icons bx bxs-star"></span>
						</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn rounded-pill headerBtn"
							onclick="location.href='${contextPath}/feed?id=${sessionScope.memberId }'">
							<span class="tf-icons bx bxs-home"></span>
						</button>
					</c:otherwise>
				</c:choose>
				<hr style="	width: 0.7px; height: 30px; margin-left: 2px; margin-right: 2px;">
				<button type="button" class="btn rounded-pill headerBtn"
					onclick="location.href='#'">
					<span class="tf-icons bx bxs-bell"></span>
					<span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20" style="top: -8px; margin-left: -5px;">4</span>
				</button>
			</div>
		</div>
	</nav>
</body>
</html>