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
	<aside id="layout-menu"
		class="layout-menu menu-vertical menu bg-menu-theme" data-bg-class="bg-menu-theme">
		<div class="app-brand demo">
			<a href="${contextPath }/" class="app-brand-link"> 
				<span class="app-brand-text demo menu-text fw-bolder ms-2">sim8log</span>
			</a> 
			<a href="javascript:void(0);" style="left: 14rem;" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
				<i class="bx bx-chevron-left bx-sm align-middle"></i>
			</a>
		</div>
		<br>
		
		<!-- 프로필(닉네임, 소개글) -->
		<div style="flex-direction: column;">
			<div class="avatar" style="display: block;margin: auto;height: 80px;width: 80px;">
				<img src="${contextPath }/member/thumbnails?profileName=${memberInfo.profileName}" onclick="location.href='${contextPath}/feed?id=${memberInfo.id }'"
					class="w-px-40 rounded-circle"/>
			</div>
			<div class="text-center mb-3">
				<div style="padding-top:10px;">
                   <a class="nav-link dropdown-toggle" href="javascript:void(0)" style="font-size: 14px; font-weight: 500; color:#000000"
                   		id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          	${memberInfo.nickname}
                   </a>
                   <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="margin-top: -5px; transform: translate3d(30px, 55px, 0px);">
                       <li><a class="dropdown-item" href="${contextPath }/member/modify?id=${sessionScope.memberId}">
                       		<i class="bx bx-user me-2"></i>내 정보 수정</a></li>
                       <li><a class="dropdown-item" href="${contextPath }/member/logout">
							<i class="bx bx-power-off me-2"></i>로그아웃</a>
						</li>
                     </ul>
					<p class="card-text" style="padding-left: 1rem;padding-right: 1rem; color:#555555">${memberInfo.intro}</p>
				</div>
			</div>
		</div>
		<div style="align-self: self-end;"> <!-- 카테고리 설정 -->
			<button class="btn" onclick="location.href='${contextPath}/category/set'"><i class='bx bxs-cog' style="font-size: 1.3rem; color:#4e4e4e"></i></button>
		</div>
		<div>
		<!-- 사이드 메뉴 -->
		<ul class="menu-inner py-1">
			<!-- Dashboard -->
			<li class="menu-item active">
				<!-- 본 카테고리 --> 
			 	<a href="index.html" class="menu-link"> 
					<i class="menu-icon tf-icons bx bx-home-alt"></i>
					전체
			 	</a>
			</li>

			<!-- Layouts -->
			<li class="menu-item">
				<!-- 카테고리 열면 class 변경함 --> 
				<a href="javascript:void(0);" class="menu-link"> 
					<i class="menu-icon tf-icons bx bx-chevron-right bx-flip-vertical"></i>
						여행
				</a>
			</li>
		</ul>
		</div>
	</aside>
</body>
</html>