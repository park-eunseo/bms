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
			<a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
				<i class="bx bx-chevron-left bx-sm align-middle"></i>
			</a>
		</div>
		<br>
		
		<!-- 프로필(닉네임, 소개글) -->
		<div style="flex-direction: column;">
			<div class="avatar" style="display: block;margin: auto;height: 80px;width: 80px;">
				<img src="${contextPath }/member/thumbnails?profileName=${memberInfo.profileName}" onclick="location.href='${contextPath}/blog?id=${memberInfo.id }'"
					class="w-px-40 h-auto rounded-circle"/>
			</div>
			<div class="text-center mb-3">
				<div style="padding-top:10px; padding-bottom: 2rem">
                   <a class="nav-link dropdown-toggle" href="javascript:void(0)" style="font-size: 14px; font-weight: 500;"
                   		id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          	${memberInfo.nickname} 님
                   </a>
                   <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="margin-top: -5px; transform: translate3d(30px, 55px, 0px);">
                       <li><a class="dropdown-item" href="${contextPath }/member/modify?id=${sessionScope.memberId}">
                       		<i class="bx bx-user me-2"></i>내 정보 수정</a></li>
                       <li><a class="dropdown-item" href="${contextPath }/member/logout">
							<i class="bx bx-power-off me-2"></i>로그아웃</a>
						</li>
                     </ul>
					<p class="card-text">${memberInfo.intro}</p>
				</div>
			</div>
		</div>
		
		<div>
		<!-- 사이드 메뉴 -->
		<ul class="menu-inner py-1">
			<!-- Dashboard -->
			<li class="menu-item active">
				<!-- 본 카테고리 --> 
			 	<a href="index.html" class="menu-link"> 
					<i class="menu-icon tf-icons bx bx-home-circle"></i>
					전체
			 	</a>
			</li>

			<!-- Layouts -->
			<li class="menu-item">
				<!-- 카테고리 열면 class 변경함 --> 
				<a href="javascript:void(0);" class="menu-link menu-toggle"> 
					<i class="menu-icon tf-icons bx bx-layout"></i>
						여행
				</a>

				<ul class="menu-sub">
					<!-- 서브 카테고리 -->
					<li class="menu-item">
						<a href="#" class="menu-link">
							부산
						</a>
					</li>
					<li class="menu-item">
						<a href="layouts-without-navbar.html" class="menu-link">
							강원도
						</a>
					</li>
					<li class="menu-item">
						<a href="layouts-container.html" class="menu-link">
							여수
						</a>
					</li>
					<li class="menu-item">
						<a href="layouts-fluid.html" class="menu-link">
							Fluid
						</a>
					</li>
					<li class="menu-item">
						<a href="layouts-blank.html" class="menu-link">
							Blank
					</a></li>
				</ul>
			</li>
			<li class="menu-item">
				<a href="javascript:void(0);" class="menu-link menu-toggle"> 
					<i class="menu-icon tf-icons bx bx-dock-top"></i>
						먹거리
				</a>
				<ul class="menu-sub">
					<li class="menu-item">
						<a href="pages-account-settings-account.html" class="menu-link">
							Account
						</a>
					</li>
					<li class="menu-item">
						<a href="pages-account-settings-notifications.html" class="menu-link">
							Notifications
						</a>
					</li>
					<li class="menu-item">
						<a href="pages-account-settings-connections.html" class="menu-link">
							Connections
						</a>
					</li>
				</ul>
			</li>
			<li class="menu-item">
				<a href="javascript:void(0);" class="menu-link menu-toggle"> 
					<i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
						방탈출
				</a>
				<ul class="menu-sub">
					<li class="menu-item">
						<a href="auth-login-basic.html" class="menu-link" target="_blank">
							Login
						</a>
					</li>
					<li class="menu-item">
						<a href="auth-register-basic.html" class="menu-link" target="_blank">
							Register
						</a>
					</li>
					<li class="menu-item">
						<a href="auth-forgot-password-basic.html" class="menu-link" target="_blank">
							Forgot Password
						</a>
					</li>
				</ul>
			</li>
			<li class="menu-item">
				<a href="javascript:void(0);" class="menu-link menu-toggle"> 
				<i class="menu-icon tf-icons bx bx-cube-alt"></i>
					가족
				</a>
				<ul class="menu-sub">
					<li class="menu-item">
						<a href="pages-misc-error.html" class="menu-link">
							Error
						</a>
					</li>
					<li class="menu-item">
						<a href="pages-misc-under-maintenance.html" class="menu-link">
							Under Maintenance
						</a>
					</li>
				</ul></li>
			<li class="menu-item">
				<a href="cards-basic.html" class="menu-link"> 
					<i class="menu-icon tf-icons bx bx-collection"></i>
					Cards
				</a>
			</li>
		</ul>
		</div>
	</aside>
</body>
</html>