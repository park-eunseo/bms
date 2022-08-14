<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function pwAlert(){
		var pw = document.getElementById("password")
		
		if(pw.value.length < 8 || pw.value.length > 20){
			document.getElementById("pwAlert").innerText = "8~20자의 영문 소문자, 숫자를 입력해 주세요."
		} else {
			document.getElementById("pwAlert").innerText = ""
		}
	}
	
	function pwAlert2(){
		var pw = document.getElementById("password")
		var pw2 = document.getElementById("password2")
		
		if(pw.value == pw2.value) {
			document.getElementById("pwAlert2").innerText = "비밀번호 확인이 완료되었습니다."
			document.getElementById("pwAlert2").style.color = "green"
		} else {
			document.getElementById("pwAlert2").innerText = "비밀번호를 다시 확인해 주세요."
			document.getElementById("pwAlert2").style.color = "red"
		}
	}
	
	function pwInputCheck(){
		var pw = document.inputForm.password
		var pw2 = document.inputForm.password2
		
		if(pw.value == "") {
				document.getElementById("pwAlert").innerText = "비밀번호는 필수 입력값입니다."
				pw.focus()
				return false
			}
			
		if(pw2.value == "") {
			document.getElementById("pwAlert2").innerText = "비밀번호 확인은 필수입니다."
			pw2.focus()
			return false
		}
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
							<a href="${contextPath }/main" class="app-brand-link gap-2">
								<span class="app-brand-text demo text-body fw-bolder">sim8log</span>
							</a>
						</div>
						<!-- /Logo -->
						<h4 class="mb-2">Create a new password. 🔒</h4>
						<p class="mb-4">새 비밀번호를 생성해 주세요.</p>

						<form id="formAuthentication" onsubmit="return pwInputCheck()" class="mb-3" action="" method="POST">
							<div class="mb-3 form-password-toggle">
								<label class="form-label" for="password">PASSWORD</label> <span
									style="color: #e44444">*</span>
								<div class="input-group input-group-merge">
									<input type="password" id="password" class="form-control"
										name="password" onblur="pwAlert()" placeholder="Password"
										aria-describedby="password" /> 
									<span class="input-group-text cursor-pointer">
									<i class="bx bx-hide"></i></span>
								</div>
								<small id="pwAlert" style="color: red"></small>
							</div>

							<div class="mb-3 form-password-toggle">
								<!-- 비밀번호 2차 확인 -->
								<label class="form-label" for="password">CHECK PASSWORD</label>
								<span style="color: #e44444">*</span>
								<div class="input-group input-group-merge">
									<input type="password" id="password2" class="form-control"
										aria-describedby="password" placeholder="Check password"
										onblur="pwAlert2()" /> 
									<span class="input-group-text cursor-pointer">
										<i class="bx bx-hide"></i></span>
								</div>
								<small id="pwAlert2"></small>
							</div>
							<p>
								<button class="btn btn-primary d-grid w-100">저장하기</button>
							</p>
						</form>
						<div class="text-center">
							<a href="${contextPath }/member/main" class="d-flex align-items-center justify-content-center"> 
								<i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i> 취소
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