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
		class="layout-menu menu-vertical menu bg-menu-theme">
		<div class="app-brand demo">
			<a href="${contextPath }/main" class="app-brand-link"> 
				<span class="app-brand-text demo menu-text fw-bolder ms-2">simplog</span>
			</a> 
			<a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
				<i class="bx bx-chevron-left bx-sm align-middle"></i>
			</a>
		</div>

		<div class="menu-inner-shadow"></div>

		<!-- 사이드 메뉴 -->
		<ul class="menu-inner py-1">
			<!-- Dashboard -->
			<li class="menu-item active">
				<!-- 본 카테고리 --> 
			 	<a href="index.html" class="menu-link"> 
					<i class="menu-icon tf-icons bx bx-home-circle"></i>
					<div data-i18n="Analytics">전체</div>
			 	</a>
			</li>

			<!-- Layouts -->
			<li class="menu-item">
				<!-- 카테고리 열면 class 변경함 --> 
				<a href="javascript:void(0);" class="menu-link menu-toggle"> 
					<i class="menu-icon tf-icons bx bx-layout"></i>
					<div data-i18n="Layouts">Layouts</div>
				</a>

				<ul class="menu-sub">
					<!-- 서브 카테고리 -->
					<li class="menu-item">
						<a href="layouts-without-menu.html" class="menu-link">
							<div data-i18n="Without menu">Without menu</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="layouts-without-navbar.html" class="menu-link">
							<div data-i18n="Without navbar">Without navbar</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="layouts-container.html" class="menu-link">
							<div data-i18n="Container">Container</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="layouts-fluid.html" class="menu-link">
							<div data-i18n="Fluid">Fluid</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="layouts-blank.html" class="menu-link">
							<div data-i18n="Blank">Blank</div>
					</a></li>
				</ul>
			</li>
			<li class="menu-item">
				<a href="javascript:void(0);" class="menu-link menu-toggle"> 
					<i class="menu-icon tf-icons bx bx-dock-top"></i>
					<div data-i18n="Account Settings">Account Settings</div>
				</a>
				<ul class="menu-sub">
					<li class="menu-item">
						<a href="pages-account-settings-account.html" class="menu-link">
							<div data-i18n="Account">Account</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="pages-account-settings-notifications.html" class="menu-link">
							<div data-i18n="Notifications">Notifications</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="pages-account-settings-connections.html" class="menu-link">
							<div data-i18n="Connections">Connections</div>
						</a>
					</li>
				</ul>
			</li>
			<li class="menu-item">
				<a href="javascript:void(0);" class="menu-link menu-toggle"> 
					<i class="menu-icon tf-icons bx bx-lock-open-alt"></i>
					<div data-i18n="Authentications">Authentications</div>
				</a>
				<ul class="menu-sub">
					<li class="menu-item">
						<a href="auth-login-basic.html" class="menu-link" target="_blank">
							<div data-i18n="Basic">Login</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="auth-register-basic.html" class="menu-link" target="_blank">
							<div data-i18n="Basic">Register</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="auth-forgot-password-basic.html" class="menu-link" target="_blank">
							<div data-i18n="Basic">Forgot Password</div>
						</a>
					</li>
				</ul>
			</li>
			<li class="menu-item">
				<a href="javascript:void(0);" class="menu-link menu-toggle"> 
				<i class="menu-icon tf-icons bx bx-cube-alt"></i>
					<div data-i18n="Misc">Misc</div>
				</a>
				<ul class="menu-sub">
					<li class="menu-item">
						<a href="pages-misc-error.html" class="menu-link">
							<div data-i18n="Error">Error</div>
						</a>
					</li>
					<li class="menu-item">
						<a href="pages-misc-under-maintenance.html" class="menu-link">
							<div data-i18n="Under Maintenance">Under Maintenance</div>
						</a>
					</li>
				</ul></li>
			<li class="menu-item">
				<a href="cards-basic.html" class="menu-link"> 
					<i class="menu-icon tf-icons bx bx-collection"></i>
					<div data-i18n="Basic">Cards</div>
				</a>
			</li>
		</ul>
	</aside>
</body>
</html>