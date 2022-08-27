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
<style>
.termsBtn {
	padding: 0;
	border-bottom: white;
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
	border-bottom-style: groove;
	border-bottom-width: 1px;
	color: black;
}
</style>
<meta charset="utf-8" />
<script>
		var idRegExp = /^[a-zA-Z0-9]{5,12}$/; //아이디 유효성 검사 
		var pwRegExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/
		var nameRegExp= RegExp(/^[가-힣]+$/)
		var mailRegExp = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/)
		var telRegExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
 	
 		function idAlert(){ // 가입 정보 기입에 필요한 조건 불충족 시 알림
 			var id = document.getElementById("id")
 			
 			if(!idRegExp.test(id.value)){
 				document.getElementById("idAlert").innerText = "5~12자의 영문 대소문자, 숫자를 입력해 주세요."
 				document.getElementById("idAlert").style.color = "red"
 			} else {
 				document.getElementById("idAlert").innerText = ""
 			} 		
 		}
 		
 		function pwAlert(){
 			var pw = document.getElementById("password")
 			
 			if(!pwRegExp.test(pw.value)){
 				document.getElementById("pwAlert").innerText = "영문 대소문자, 숫자, 특수문자를 포함한 8~20자를 입력해 주세요."
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
 		
 		function nameAlert(){
 			var name = document.getElementById("name")
 			
 			if(!nameRegExp.test(name.value)){
 				document.getElementById("nameAlert").innerText = "이름은 한글로 입력해 주세요."
 			} else {
 				document.getElementById("nameAlert").innerText = ""
 			}
 		}
 		
 		function telAlert(){
 			var tel = document.getElementById("tel")
 			
 			if(!telRegExp.test(tel.value)){
 				document.getElementById("telAlert").innerText = "전화번호를 '-'를 포함해 다시 입력해 주세요."
 			} else {
 				document.getElementById("telAlert").innerText = ""
 			}
 		}
 		
 		function emailAlert(){
 			var email = document.getElementById("email")
 			
 			if(!mailRegExp.test(email.value)){
 				document.getElementById("emailAlert").innerText = "이메일을 다시 입력해 주세요."
 			} else {
 				document.getElementById("emailAlert").innerText = ""
 			}
 		}
 		
 		function birthAlert(){
 			var birth = document.getElementById("birth")
 			
 			if(birth.value != ""){
 				document.getElementById("birthAlert").innerText = ""
 			}
 		}
 		
 		function inputCheck(){
 			var id = document.inputForm.id
 			var pw = document.inputForm.password
 			var pw2 = document.inputForm.password2
 			var name = document.inputForm.name
 			var tel = document.inputForm.tel
 			var email = document.inputForm.email
 			var birth = document.inputForm.birth
 			var termss =  document.inputForm.termss
 			var intro = document.inputForm.intro
 			
 			var idMsg = document.getElementById("idAlert")
 			
 			if(id.value == "" || !idRegExp.test(id.value)) {
 				document.getElementById("idAlert").innerText = "5~12자의 영문 대소문자, 숫자를 입력해 주세요."
 				document.getElementById("idAlert").style.color = "red"
 				id.focus()
 				return false
 			}
 			
 			if(idMsg.style.color != "green"){
 				alert("ID를 다시 확인해 주세요.")
 				id.focus()
 				return false
 			}
 			
 			if(pw.value == "" || !pwRegExp.test(pw.value)) {
 				document.getElementById("pwAlert").innerText = "5~12자의 영문 대소문자, 숫자를 입력해 주세요."
 				pw.focus()
 				return false
 			}
 			
 			if(pw2.value == "") {
 				document.getElementById("pwAlert2").innerText = "비밀번호 확인은 필수입니다."
 				pw2.focus()
 				return false
 			}
 			
 			if(name.value == "" || !nameRegExp.test(name.value)) {
 				document.getElementById("nameAlert").innerText = "이름은 한글로 입력해 주세요."
 				name.focus()
 				return false
 			}
 			
 			if(tel.value == "" || !telRegExp.test(tel.value)) {
 				document.getElementById("telAlert").innerText = "전화번호는 '-'를 포함하여 입력해 주세요."
 				tel.focus()
 				return false
 			}
 			
 			if(email.value == "" || !mailRegExp.test(email.value)) {
 				document.getElementById("emailAlert").innerText = "이메일을 다시 입력해 주세요."
 				email.focus()
 				return false
 			}
 			
 			if(birth.value == "") {
 				document.getElementById("birthAlert").innerText = "생년월일은 필수 입력값입니다."
 				birth.focus()
 				return false
 			}	
 			
 			if(intro.value.length > 50){
 	 			document.getElementById("intro").focus()
 	 			return false
 			}
 			
 			if(termss.checked == false ){
 				document.getElementById("termsAlert").innerText = "약관에 동의해야 가입할 수 있습니다."
 				termss.focus()
 				return false
 			}	
 		}
 		
 		function isIdCheck(){ // 회원 유효성 검사
 			var id = document.getElementById("id")
 			
 			if(id.value.length < 5 || id.value.length > 12 ){
 				document.getElementById("idAlert").innerText = "5~12자의 영문 대소문자, 숫자를 입력해 주세요."
 				document.getElementById("idAlert").style.color = "red"
 	 			id.focus()
 	 			
 	 			return false
 			}
 		
 			$.ajax({
 				type : "get", // HTTP 요청 방식(GET, POST)
 				url : "${contextPath}/member/registerIdCheck?id=" + id.value, // 요청이 전송될 URL 주소
 				success : function(data){ // 통신 성공할 경우 실행되는 함수
 					if(data == "true"){
 						document.getElementById("idAlert").innerText = '사용 가능한 ID입니다.';
 		 				document.getElementById("idAlert").style.color = "green"
 					} else {
 	 					document.getElementById("idAlert").innerText = '중복된 ID입니다.';
 	 	 	 			document.getElementById("idAlert").style.color = "red"
 	 	 			}
 				}
 			})
 		}
 		
 		function checkIntro(obj){ // 소개글 작성 글자수 체크
 			var max = 50 
 			var text_len = obj.value.length
 			
 			var msg = document.getElementById("introAlert")
 			var len = document.getElementById("introLen")
 				
			if(text_len > max){
 				len.innerText = "(50/50byte)"
 				msg.innerText = "50byte 이하로 작성해 주세요."			
 			} else {
 				len.innerText = "(" + text_len + "/50byte)"
 				msg.innerText = ""
 			}
 		}
 		
 		function termsClick(){
 			$("#terms").prop("checked", true)
 			
 		}
 		
 		function basicProfile() {
 			document.getElementById("profileImg").src = "${contextPath }/member/thumbnails?profileName=basicImg.jpg";
 			document.getElementById("upload").disabled = true
 		}
 		
 		function fileDisabled(){ // 기본 프로필 선택 시 file 요소 사용 불가능
 			document.getElementById("upload").disabled = false
 		}
 		
 		function profileChange(event){
 			var reader = new FileReader() // 비동기적으로 파일의 내용을 읽은 데 사용
 			
 			reader.onload = function(event){ // 읽기 동작이 성공적으로 완료되었을 때
 				var img = document.getElementById("profileImg");
 				img.setAttribute("src", event.target.result);	// 사용자가 가져온 파일로 img src 변경			
 			}
 			
 			reader.readAsDataURL(event.target.files[0]) // 바이너리 파일을 encode 문자열로 반환
 		}
 		
 	</script>
<body>
	<!-- Content -->
	<div class="container-xxl">
		<div class="authentication-wrapper authentication-basic"
			style="min-height: fit-content;">
			<div class="authentication-inner py-4">
				<div class="card">
					<div class="card-body">
						<h4 class="mb-2">회원가입 👋</h4>
						<p class="mb-4">가입하고 다양한 친구들과 소통해 보세요.</p>
						<!-- Register Card -->
						<div class="divider">
							<div class="divider-text">PERSONAL INFO</div>
						</div>

						<form id="formAuthentication" class="mb-3" name="inputForm"
							enctype="multipart/form-data" onsubmit="return inputCheck()"
							action="${contextPath }/member/register" method="post">
							<div class="mb-3">
								<label for="userId" class="form-label">ID</label> <span
									style="color: #e44444">*</span> <br> <input type="text"
									class="form-control" id="id" name="id" onblur="idAlert()"
									placeholder="ID" style="width: 460px; display: inline-block;" />
								<button type="button" class="btn btn-primary"
									onclick="isIdCheck()"
									style="padding: 0.4rem 1rem; font-size: 0.8rem; display: inline-block;">ID
									Check</button>
								<br> <small id="idAlert"></small>
							</div>


							<div class="mb-3 form-password-toggle">
								<label class="form-label" for="password">PASSWORD</label> <span
									style="color: #e44444">*</span>
								<div class="input-group input-group-merge">
									<input type="password" id="password" class="form-control"
										name="password" onblur="pwAlert()" placeholder="Password"
										aria-describedby="password" /> <span
										class="input-group-text cursor-pointer"><i
										class="bx bx-hide"></i></span>
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
										onblur="pwAlert2()" /> <span
										class="input-group-text cursor-pointer"><i
										class="bx bx-hide"></i></span>
								</div>
								<small id="pwAlert2"></small>
							</div>

							<div class="mb-3">
								<label for="userName" class="form-label">NAME</label> <span
									style="color: #e44444">*</span> <input type="text"
									class="form-control" id="name" name="name" placeholder="심플로그"
									onblur="nameAlert()" /> <small id="nameAlert"
									style="color: red"></small>
							</div>

							<div class="mb-3">
								<label for="userTel" class="form-label">TEL</label> <span
									style="color: #e44444">*</span> <input type="text"
									class="form-control" id="tel" name="tel"
									placeholder="'-'를 포함하여 입력해 주세요." onblur="telAlert()" /> <small
									id="telAlert" style="color: red"></small>
							</div>

							<div class="mb-3">
								<label for="email" class="form-label">EMAIL</label> <span
									style="color: #e44444">*</span> <input type="email"
									class="form-control" id="email" name="email"
									onblur="emailAlert()" placeholder="sim8log@naver.com" /> <small
									id="emailAlert" style="color: red"></small>
							</div>

							<div class="mb-3">
								<label for="birth" class="form-label">BIRTH</label> <span
									style="color: #e44444">*</span> <input class="form-control"
									type="date" id="html5-date-input" name="birth"
									onblur="birthAlert()"> <small id="birthAlert"
									style="color: red"></small>
							</div>

							<div class="mb-3">
								<label for="gender" class="form-label">GENDER</label> <span
									style="color: #e44444">*</span><br>
								<div class="form-check form-check-inline mt-3">
									<input class="form-check-input" type="radio" name="gender"
										value="F" checked="checked"> <label
										class="form-check-label" for="inlineRadio1">여자</label>
								</div>
								&ensp;&ensp;
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio" name="gender"
										value="M"> <label class="form-check-label"
										for="inlineRadio2">남자</label>
								</div>
								<small id="genderAlert" style="color: red"></small>
							</div>

							<br>
							<div class="divider">
								<div class="divider-text">BLOG INFO</div>
							</div>
							<br>

							<div class="d-flex align-items-start align-items-sm-center gap-4">
								<img
									src="${contextPath }/member/thumbnails?profileName=basicImg.jpg"
									id="profileImg" alt="user-avatar" class="d-block rounded"
									height="100" width="100">
								<div class="button-wrapper">
									<label for="upload" class="btn btn-primary me-2 mb-4"
										tabindex="0" onclick="fileDisabled()"
										style="display: inline-flex;"> <i class="bx bx-upload"
										style="align-self: center;"></i><span
										class="d-none d-sm-block" style="padding-left: 4px;">사진
											선택</span> <input type="file" id="upload" name="profileName"
										onchange="profileChange(event)" class="account-file-input"
										hidden="" accept="image/png, image/jpeg">
									</label>
									<button type="button"
										class="btn btn-outline-secondary account-image-reset mb-4"
										onclick="basicProfile()" style="display: inline-flex;">
										<i class="bx bx-reset" style="align-self: center;"></i> <span
											class="d-none d-sm-block" style="padding-left: 4px;">기본
											설정</span>
									</button>
								</div>
							</div>
							<br>
							<div class="mb-3">
								<label for="blogName" class="form-label">블로그명</label> <input
									type="text" class="form-control" id="blogName" name="blogName"
									placeholder="미입력 시 입력하신 ID로 자동 설정됩니다." />
							</div>

							<div class="mb-3">
								<label for="nickname" class="form-label">닉네임</label> <input
									type="text" class="form-control" id="nickname" name="nickname"
									placeholder="미입력 시 입력하신 ID로 자동 설정됩니다." />
							</div>
							<div class="mb-3">
								<label for="intro" class="form-label">INTRO</label>
								<textarea class="form-control" id="intro"
									onkeyup="checkIntro(this)" rows="3" name="intro"
									placeholder="간단한 소개글을 남겨주세요." style="resize: none"></textarea>
								<small id="introLen">(0/50byte)</small> <br> <small
									id="introAlert" style="color: red"></small>
							</div>

							<div class="mt-3">
								<input class="form-check-input" type="checkbox" id="terms"
									style="box-shadow: none;" />
								<button class="btn termsBtn" type="button"
									data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom"
									aria-controls="offcanvasBottom">개인정보 수집 및 이용 동의(필수)</button>
								<div class="offcanvas offcanvas-bottom" tabindex="-1"
									id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel"
									aria-hidden="true" style="visibility: hidden; height: 50%;">
									<div class="offcanvas-header" style="align-self: self-end;">
										<button type="button" class="btn-close text-reset"
											data-bs-dismiss="offcanvas" aria-label="Close"></button>
									</div>
									<div class="offcanvas-body">
										<p>
										<p>
											<span style="font-size: 12.8px;">개인정보보호법에 따라 심플로그에
												회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및
												이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기
												바랍니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">1. 수집하는 개인정보</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">이용자는 회원가입을 하지 않아도 정보
												검색을 이용할 수 있습니다. 이용자가 블로그와 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할
												경우, 심플로그는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">회원가입 시점에 심플로그가 이용자로부터
												수집하는 개인정보는 아래와 같습니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">- 회원 가입 시에 ‘아이디,
												비밀번호, 이름, 생년월일, 성별, 휴대전화번호, 이메일 주소'를 수집합니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">서비스 이용 과정에서 이용자로부터
												수집하는 개인정보는 아래와 같습니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">- 회원정보 또는 개별 서비스에서
												프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 아이디가
												별명으로 자동 입력됩니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;"></span>
										</p>
										<p>
											<span style="font-size: 12.8px;">- 심플로그 내의 개별 서비스 이용,
												이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다.
												추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목,
												개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">서비스 이용 과정에서 IP 주소,
												쿠키, 서비스 이용 기록&nbsp; 생성되어 수집될 수 있습니다. 또한 이미지가 수집될 수 있습니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">구체적으로 1) 서비스 이용 과정에서
												이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">2) 이용자 기기의 고유한 정보를
												원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수
												있으며,</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">심플로그에서 제공하는 위치기반 서비스에
												대해서는 '심플로그 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">이와 같이 수집된 정보는 개인정보와의
												연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;"></span>
										</p>
										<p>
											<span style="font-size: 12.8px;">2. 수집한 개인정보의 이용</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">심플로그 및 심플로그 관련 제반
												서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의
												목적으로만 개인정보를 이용합니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;"></span>
										</p>
										<p>
											<span style="font-size: 12.8px;">- 회원 가입 의사의 확인, 연령 확인
												및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등
												회원관리를 위하여 개인정보를 이용합니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">- 콘텐츠 등 기존 서비스 제공(광고
												포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간
												관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스
												개선 등을 위하여 개인정보를 이용합니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">- 서비스 이용기록과 접속 빈도 분석,
												서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를
												이용합니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">- 보안, 프라이버시, 안전 측면에서
												이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">3. 개인정보의 보관기간</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">회사는 원칙적으로 이용자의 개인정보를
												회원 탈퇴 시 지체없이 파기하고 있습니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">단, 이용자에게 개인정보 보관기간에
												대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안
												개인정보를 안전하게 보관합니다.</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">4. 개인정보 수집 및 이용 동의를
												거부할 권리</span>
										</p>
										<p>
											<span style="font-size: 12.8px;">이용자는 개인정보의 수집 및 이용
												동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및
												이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.</span>
										</p>
										<button type="button" class="btn btn-primary me-2" onclick="termsClick()">동의</button>
										<button type="button" class="btn btn-outline-secondary"
											data-bs-dismiss="offcanvas">취소</button>
									</div>
								</div>
							</div>
							<br>
							<button class="btn btn-primary d-grid w-100">회원가입</button>
						</form>

						<p class="text-center">
							<span>이미 계정이 있으신가요? </span> <a
								href="${contextPath }/member/login"> <span>로그인</span>
							</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Register Card -->
	</div>
	<!-- / Content -->
</body>
</html>
