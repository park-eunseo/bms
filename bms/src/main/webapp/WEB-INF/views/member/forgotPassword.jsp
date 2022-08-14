<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function isTelCheck(){
		document.getElementById("checkNumber").style.display = "inline-block"
	}
</script>
</head>
<body>
	<!-- Content -->

	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic container-p-y">
			<div class="authentication-inner py-4">
				<!-- Forgot Password -->
				<div class="card">
					<div class="card-body">
						<!-- Logo -->
						<div class="app-brand justify-content-center">
							<a href="${contextPath }/main" class="app-brand-link gap-2"> <span
								class="app-brand-text demo text-body fw-bolder">sim8log</span>
							</a>
						</div>
						<!-- /Logo -->
						<h4 class="mb-2">Forgot Password? 🔒</h4>
						<p class="mb-4">ID와 등록하신 전화번호를 입력하세요.</p>

						<form id="formAuthentication" onsubmit="return numCheck()" class="mb-3" action="#" method="POST"> <!-- 인증 번호 맞는지 확인 후 action, id 보내기 -->
							<div class="mb-3">
								<label for="id" class="form-label">ID</label> 
								<input type="text" class="form-control" id="id" name="id" placeholder="ID" autofocus />
							</div>
							<div class="mb-3">
								<label for="userTel" class="form-label">TEL</label> <br> 
								<input type="text" class="form-control" id="tel" name="tel"
									placeholder="'-'는 제외하고 입력해 주세요."
									style="width: 472px; display: inline-block;" />
								<button type="button" class="btn btn-primary"
									onclick="isTelCheck()"
									style="padding: 0.4rem 1rem; font-size: 0.8rem; display: inline-block;">인증번호 전송</button><!-- 번호 맞는지 확인 -->
								<br>
							</div>
							<div class="mb-3" style="text-align: left;">
								<input type="text" class="form-control" id="checkNumber" 
									name="checkNumber" placeholder="인증번호 6자리를 입력하세요." style="width: 180px; display: none;" />
								<small id="checkAlert"></small>
							</div>
							<p>
								<button class="btn btn-primary d-grid w-100">새 비밀번호 생성</button>
							</p>
						</form>
						<div class="text-center">
							<a href="${contextPath }/member/login"
								class="d-flex align-items-center justify-content-center"> 
								<i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i> 로그인
							</a>
						</div>
					</div>
				</div>
				<!-- /Forgot Password -->
			</div>
		</div>
	</div>
</body>
</html>