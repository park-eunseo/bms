<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
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
	function search(){
		var searchKeyword = $("#searchKeyword").val()
		var searchWord = $("#searchWord").val()
		
		if(searchWord == "") {
			alert("검색어를 입력해 주세요.")
			return false
		}

		location.href = "${contextPath}/search?searchKeyword=" + searchKeyword + "&searchWord=" + searchWord
	}
</script>
</head>
<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-secondary" role="status">
			<span class="visually-hidden">Loading</span>
		</div>
	</div>
	<!-- Spinner End -->

	<!-- Navbar Start -->
	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0" style="margin-bottom: -35px;">
		<a href="${contextPath }/"
			class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
			<span class="app-brand-text demo menu-text fw-bolder ms-2">sim8log</span>
		</a>
		
		<button type="button" class="navbar-toggler me-4 collapsed" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-expanded="false">
            <span class="navbar-toggler-icon"></span>
        </button>
		<!-- Search -->
		<div class="navbar-collapse collapse" id="navbarCollapse">
			<div>
					<!-- 전체 회원 범위 -->
					<div class="input-group">
						<select id="searchKeyword" name="searchKeyword" class="form-select selectBox form-select-sm">
							<option value="member">작성자</option>
							<option value="blogName">블로그명</option>
							<option value="post">게시글</option>
						</select> 
						<input type="text" id="searchWord" name="searchWord" class="form-control searchText" placeholder="Search">
						<button type="button" onclick="search()" class="input-group-text">
							<i class="tf-icons bx bx-search"></i>
						</button>
					</div>
			</div>
			<c:choose>
				<c:when test="${sessionScope.memberId eq null }"> <!-- 가져올 세션이 없다면, 로그인한 회원이 없다면 -->
		            <div class="navbar-nav ms-auto p-4 p-lg-0" style="">
		                <a href="${contextPath }/member/register" class="nav-item nav-link" >회원가입</a>
		                <a href="${contextPath }/member/login" class="nav-item nav-link">로그인</a>        
		            </div>
		      </c:when>
				<c:when test="${sessionScope.role eq 'client' }"> <!-- 세션이 있고 클라이언트 계정이라면 -->
					 <div class="navbar-nav ms-auto p-4 p-lg-0" style="">
		                <a href="${contextPath }/feed?id=${sessionScope.memberId}&searchWord=" class="nav-item nav-link">내 블로그</a>
		                <div class="nav-item dropdown">
		                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">${sessionScope.memberNickname } 님</a>
		                    <div class="dropdown-menu bg-light m-0" style="right: 0px;">
		                        <a href="${contextPath }/member/modify?id=${sessionScope.memberId}"class="dropdown-item">내 정보 수정</a>
		                        <a href="${contextPath }/member/logout" class="dropdown-item">로그아웃</a>
		                    </div>
		                </div>         
					 </div>
				</c:when>
				<c:otherwise> <!-- 세션이 있고 관리자 계정이라면 -->	
				 <div class="navbar-nav ms-auto p-4 p-lg-0" style="right: 0px;">
		             <div class="nav-item dropdown">
		                <a href="${contextPath }/feed" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">${sessionScope.memberNickname } 님</a>
		                  <div class="dropdown-menu bg-light m-0">
		                      <a href="#" class="dropdown-item">회원 관리</a>
		                      <a href="${contextPath }/member/modify?id=${sessionScope.memberId}">내 정보 수정</a>
		                      <a href="${contextPath }/member/logout" class="dropdown-item">로그아웃</a>
		                  </div>
		              </div>         
		         </div>
		         </c:otherwise>
			</c:choose>
          </div>
		<!-- /Search -->

		<!--/ User -->
	</nav>
	<!-- Navbar End -->
	<br><br>
</body>
</html>