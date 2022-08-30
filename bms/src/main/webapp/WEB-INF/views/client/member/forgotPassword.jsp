<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function emailAlert() {
		var email = document.getElementById("email")
		var mailRegExp = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/)

		if (!mailRegExp.test(email.value)) {
			document.getElementById("emailAlert").innerText = "이메일을 다시 입력해 주세요."
			document.getElementById("emailAlert").style.color = "red"
		} else {
			document.getElementById("emailAlert").innerText = ""
		}
	}
	
	var codeNum;
	
	function mailSendBtn(){
		var id = $("#id").val()
		var email = $("#email").val()
			
		$.ajax({
			type:"post",
			url:"${contextPath}/member/forgotPassword?id=" + id + "&email=" + email,
			async: false,
			success:function(data){
				if(data != ""){
					$("#emailAlert").text("")
					$("#checkNumber").css("display", "inline")
					
					codeNum = data
		 			alert("해당 이메일로 인증번호가 발송되었습니다.")
				} else {
					$("#emailAlert").text("일치하는 정보가 없습니다. 다시 확인해 주세요.")
					$("#emailAlert").css("color", "red")	
				}
			}
		})	
	}
		
	function checkEmailNum(){
		var checkMsg = $("#checkAlert")
		console.log(codeNum + "/" + $("#checkNumber").val())
		if($("#checkNumber").val() == codeNum){
			checkMsg.text("인증이 완료되었습니다.")
			checkMsg.css("color", "green")
			$("#email").attr("readonly", true)
			$("#checkNumber").attr('readonly',true);
			$("#emailCheck").attr('disabled',true);
		} else {
			checkMsg.text("인증 번호가 일치하지 않습니다.")
			checkMsg.css("color", "red")
				
			return false
		}
	}
</script>
</head>
<body>
	<!-- Content -->

	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic">
			<div class="authentication-inner py-4">
				<!-- Forgot Password -->
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">비밀번호 찾기 🔒</h4>
						<p class="mb-4">ID와 등록하신 이메일을 입력하세요.</p>

						<form id="formAuthentication" onsubmit="return checkEmailNum()" class="mb-3" action="${contextPath }/member/newPassword" method="POST"> <!-- 인증 번호 맞는지 확인 후 action, id 보내기 -->
							<div class="mb-3">
								<label for="id" class="form-label">ID</label> 
								<input type="text" class="form-control" id="id" name="id" placeholder="ID" autofocus />
							</div>
							<div class="mb-3">
								<label for="userTel" class="form-label">EMAIL</label> <br> 
								<input type="text" class="form-control" id="email" name="email"
									style="width: 444px; display: inline-block;" onblur="emailAlert()" placeholder="sim8log@naver.com""/>
								<button type="button" class="btn btn-primary"
									onclick="mailSendBtn()"
									style="padding: 0.4rem 1rem; font-size: 0.7rem; display: inline-block;">인증번호 전송</button><!-- 번호 맞는지 확인 -->
								<br>
								<small id="emailAlert"></small>
							</div>
							<div class="mb-3" style="text-align: left;">
								<input type="text" class="form-control" id="checkNumber" 
									name="checkNumber" placeholder="인증번호 6자리를 입력하세요." style="width: 250px; display: none;" />
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