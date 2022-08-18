<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
 	<script>
 		function idAlert(){ // 가입 정보 기입에 필요한 조건 불충족 시 알림
 			var id = document.getElementById("id")
 			
 			if(id.value.length < 5 || id.value.length > 12){
 				document.getElementById("idAlert").innerText = "5~12자의 영문 소문자, 숫자를 입력해 주세요."
 				document.getElementById("idAlert").style.color = "red"
 			} else {
 				document.getElementById("idAlert").innerText = ""
 			} 		
 		}
 		
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
 		
 		function nameAlert(){
 			var name = document.getElementById("name")
 			
 			if(name.value != ""){
 				document.getElementById("nameAlert").innerText = ""
 			}
 		}
 		
 		function telAlert(){
 			var tel = document.getElementById("tel")
 			
 			if(tel.value == "" || tel.value.length < 11){
 				document.getElementById("telAlert").innerText = "전화번호 11자리 이상 입력해 주세요."
 			} else {
 				document.getElementById("telAlert").innerText = ""
 			}
 		}
 		
 		function emailAlert(){
 			var email = document.getElementById("email")
 			
 			if(email.value != ""){
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
 			var terms =  document.inputForm.terms
 			var intro = document.inputForm.intro
 			
 			var idMsg = document.getElementById("idAlert")
 			
 			if(id.value == "") {
 				document.getElementById("idAlert").innerText = "ID는 필수 입력값입니다."
 				document.getElementById("idAlert").style.color = "red"
 				id.focus()
 				return false
 			}
 			
 			if(idMsg.style.color != "green"){
 				alert("ID를 다시 확인해 주세요.")
 				id.focus()
 				return false
 			}
 			
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
 			
 			if(name.value == "") {
 				document.getElementById("nameAlert").innerText = "이름은 필수 입력값입니다."
 				name.focus()
 				return false
 			}
 			
 			if(tel.value == "") {
 				document.getElementById("telAlert").innerText = "전화번호는 필수 입력값입니다."
 				tel.focus()
 				return false
 			}
 			
 			if(email.value == "") {
 				document.getElementById("emailAlert").innerText = "이메일은 필수 입력값입니다."
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
 			
 			if(terms.checked == false ){
 				document.getElementById("termAlert").innerText = "약관에 동의해야 가입할 수 있습니다."
 				terms.focus()
 				return false
 			}
 			
 			
 		}
 		
 		function isIdCheck(){ // 회원 아이디 중복 확인
 			var id = document.getElementById("id")
 			
 			if(id.value.length < 5 || id.value.length > 12){
 				document.getElementById("idAlert").innerText = "5~12자의 영문 소문자, 숫자를 입력해 주세요."
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
 				
 		function basicProfile() {
 			document.getElementById("profileImg").src = "${contextPath }/member/thumbnails?profileName=basicImg.png";
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
  	<div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5" >
            <h1 class="display-3 text-white mb-3 animated slideInDown" style="font-size: 30px;">Welcome to sim8log! 👋</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a class="text-white">가입하고 다양한 친구들과 소통해 보세요.</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <div class="container-xxl">
        <div class="app-brand justify-content-center">           
          <span class="app-brand-text demo text-body">회원가입</span>
    	</div>
      <div class="authentication-wrapper authentication-basic container-p-y" style="min-height: fit-content;">
        <div>
          <!-- Register Card -->
                <div class="divider">
          			<div class="divider-text">PERSONAL INFO</div>
        		</div>
        		
              <form id="formAuthentication" class="mb-3"  name="inputForm" enctype="multipart/form-data"
              		onsubmit="return inputCheck()" action="${contextPath }/member/register" method="post">
                <div class="mb-3">
                  <label for="userId" class="form-label">ID</label>
                  <span style="color:#e44444">*</span>
                  <br>
                  <input
                    type="text"
                    class="form-control"
                    id="id"
                    name="id"
                    onblur="idAlert()"
                    placeholder="ID"
                    style="width:460px; display: inline-block;"
                  />
                   <button type="button" class="btn btn-primary" onclick="isIdCheck()"
                   		style="padding: 0.4rem 1rem; font-size: 0.8rem;display: inline-block;">ID Check</button>
                   <br><small id="idAlert"></small>
                </div>
               
                
                <div class="mb-3 form-password-toggle">
                  <label class="form-label" for="password">PASSWORD</label>
                  <span style="color:#e44444">*</span>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="password"
                      class="form-control"
                      name="password"
                      onblur="pwAlert()"
                      placeholder = "Password"
                      aria-describedby="password"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                  <small id="pwAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3 form-password-toggle"> <!-- 비밀번호 2차 확인 -->
                  <label class="form-label" for="password">CHECK PASSWORD</label>
                  <span style="color:#e44444">*</span>
                  <div class="input-group input-group-merge">
                    <input
                      type="password"
                      id="password2"
                      class="form-control"
                      aria-describedby="password"
                      placeholder = "Check password"
                      onblur="pwAlert2()"
                    />
                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                  </div>
                  <small id="pwAlert2"></small>
                </div>
                
                <div class="mb-3">
                  <label for="userName" class="form-label">NAME</label>
                  <span style="color:#e44444">*</span>
                  <input
                    type="text"
                    class="form-control"
                    id="name"
                    name="name"
                    placeholder="심플로그"
                    onblur="nameAlert()"
                  />
                  <small id="nameAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
                  <label for="userTel" class="form-label">TEL</label>
                  <span style="color:#e44444">*</span>
                  <input
                    type="text"
                    class="form-control"
                    id="tel"
                    name="tel"
                    placeholder="'-'는 제외하고 입력해 주세요."
                    onblur="telAlert()"
                  />
                  <small id="telAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
                  <label for="email" class="form-label">EMAIL</label>
                  <span style="color:#e44444">*</span>
                  <input type="email" class="form-control" id="email" name="email" onblur="emailAlert()" placeholder="sim8log@naver.com" />
                  <small id="emailAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
               	  <label for="birth" class="form-label">BIRTH</label>
               	  <span style="color:#e44444">*</span>
                  <input class="form-control" type="date" id="html5-date-input" name="birth" onblur="birthAlert()">
                  <small id="birthAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
               	  <label for="gender" class="form-label">GENDER</label>
               	  <span style="color:#e44444">*</span><br>
                     <div class="form-check form-check-inline mt-3">
                        <input class="form-check-input" type="radio" name="gender" value="F" checked="checked">
                        <label class="form-check-label" for="inlineRadio1">여자</label>
                     </div> &ensp;&ensp;
                     <div class="form-check form-check-inline">
                         <input class="form-check-input" type="radio" name="gender" value="M">
                         <label class="form-check-label" for="inlineRadio2">남자</label>
                     </div>
                     <small id="genderAlert" style="color:red"></small>
                </div>
                
                <br>
                <div class="divider">
          			<div class="divider-text">BLOG INFO</div>
        		</div>
                <br>
                
                <div class="d-flex align-items-start align-items-sm-center gap-4">
			       <img src="${contextPath }/member/thumbnails?profileName=basicImg.png" id="profileImg" alt="user-avatar" class="d-block rounded" height="100" width="100" >
			          <div class="button-wrapper">
           				<label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0" onclick="fileDisabled()" style="display: inline-flex; ">
              				<i class="bx bx-upload" style="align-self: center;"></i><span class="d-none d-sm-block" style="padding-left: 4px;">사진 선택</span>
              				<input type="file" id="upload" name="profileName" onchange="profileChange(event)" class="account-file-input" hidden="" accept="image/png, image/jpeg" >
            			</label>
            			<button type="button" class="btn btn-outline-secondary account-image-reset mb-4" onclick="basicProfile()" style="display: inline-flex;">
              				<i class="bx bx-reset" style="align-self: center;"></i>
              				<span class="d-none d-sm-block" style="padding-left: 4px;">기본 설정</span>
            			</button>
						<p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
          			</div>
			    </div>
			    <br>
                <div class="mb-3">
                  <label for="blogName" class="form-label">블로그명</label>
                  <input
                    type="text"
                    class="form-control"
                    id="blogName"
                    name="blogName"
                    placeholder="미입력 시 입력하신 ID로 자동 설정됩니다."
                  />
                </div>
                
                <div class="mb-3">
                  <label for="nickname" class="form-label">닉네임</label>
                  <input
                    type="text"
                    class="form-control"
                    id="nickname"
                    name="nickname"
                    placeholder="미입력 시 입력하신 ID로 자동 설정됩니다."
                  />
                </div>
                <div class="mb-3">
                  <label for="intro" class="form-label">INTRO</label>
                  <textarea class="form-control" id="intro" onkeyup="checkIntro(this)" rows="3" name="intro"
                  		placeholder="간단한 소개글을 남겨주세요." style="resize: none"></textarea>
                  <small id="introLen">(0/50byte)</small>
                  <br>
                  <small id="introAlert" style="color:red"></small>
                </div>
				<div class="mb-3">
					<div class="form-check" style="box-shadow: none;">
						<input class="form-check-input" type="checkbox" id="terms" />
						<button class="btn btn-primary" type="button" style="padding: revert; background-color: #00000000; color: #2e2e2e;"
							data-bs-toggle="offcanvas" data-bs-target="#offcanvasStart"
							aria-controls="offcanvasStart">개인 정보 수집 동의</button>
						<br>
						<small id="termAlert" style="color: red"></small>
						<div class="offcanvas offcanvas-start" tabindex="-1"
							id="offcanvasStart" aria-labelledby="offcanvasStartLabel"
							style="visibility: hidden;" aria-hidden="true">
							<div class="offcanvas-header">
								<h5 id="offcanvasStartLabel" class="offcanvas-title">정보 수집 약관 어쩌고</h5>
									<button type="button" class="btn-close text-reset"
										data-bs-dismiss="offcanvas" aria-label="Close"></button>
							</div>
							<div class="offcanvas-body my-auto mx-0 flex-grow-0">
								<p class="text-center">Lorem ipsum, or lipsum as it is
									sometimes known, is dummy text used in laying out print,
									graphic or web designs. The passage is attributed to an
									unknown typesetter in the 15th century who is thought to have
									scrambled parts of Cicero's De Finibus Bonorum et Malorum for
									use in a type specimen book.</p>
							</div>
						</div>
						</div>
					</div>
					<br>
                <button class="btn btn-primary d-grid w-100">회원가입</button>
              </form>

              <p class="text-center">
                <span>이미 계정이 있으신가요? </span>
                <a href="${contextPath }/member/login">
                  <span>로그인</span>
                </a>
              </p>
            </div>
          </div>
          <!-- Register Card -->
        </div>
    <!-- / Content -->
  </body>
</html>
