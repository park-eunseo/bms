<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>

<!-- beautify ignore:start -->
<html lang="en" class="light-style customizer-hide" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
</head>

<body>
	<!-- Content -->
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y"
			style="min-height: fit-content;">
			<div class="authentication-inner py-4">
				<!-- Register -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">로그인 🚀</h4>
						<p class="mb-4">로그인하고 심플로그를 이용해 보세요.</p>
						<form id="formAuthentication" class="mb-3"
							action="${contextPath }/member/login" method="post">
							<div class="mb-3">
								<label for="userId" class="form-label">ID</label> <input
									type="text" class="form-control" id="id" name="id"
									placeholder="ID를 입력하세요." autofocus />
							</div>
							<div class="mb-3 form-password-toggle">
								<div class="d-flex justify-content-between">
									<label class="form-label" for="password">Password</label> <a
										href="${contextPath }/member/forgotPassword"> <small>비밀번호
											찾기</small>
									</a>
								</div>
								<div class="input-group input-group-merge">
									<input type="password" id="password" class="form-control"
										name="password" placeholder="비밀번호를 입력하세요."
										aria-describedby="password" /> <span
										class="input-group-text cursor-pointer"><i
										class="bx bx-hide"></i></span>
								</div>
							</div>
							<div class="mb-3">
								<button class="btn btn-primary d-grid w-100" type="submit">로그인</button>
							</div>
						</form>
						<p class="text-center">
							<span>심플로그를 처음 이용하시나요? </span> <a
								href="${contextPath }/member/register"> <span> 회원가입 </span>
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /Register -->
	</div>

	<!-- / Content -->

</body>
</html>
