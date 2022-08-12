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
		 // 가입 정보 기입에 필요한 조건 불충족 시 알림
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
 		
 		function inputCheck(){
 			var pw = document.inputForm.password
 			var pw2 = document.inputForm.password2
 			var tel = document.inputForm.tel
 			var email = document.inputForm.email
 			var intro = document.inputForm.intro
 			
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
 			
 			if(intro.value.length > 50){
 	 			document.getElementById("intro").focus()
 	 			return false
 			}
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
 		
 		function basicProfile(){ // 프로필 초기화
 			document.getElementById("profileImg").src = "${contextPath }/resources/bootstrap/img/profile/basicImg.png"
 			document.getElementById("upload").disabled = true
 		}
 		
 		function fileDisabled(){ 
 			document.getElementById("upload").disabled = false
 		}
 		
 		function profileChange(event){ // 프로필 변경
 			var reader = new FileReader() // 비동기적으로 파일의 내용을 읽은 데 사용
 			
 			reader.onload = function(event){ // 읽기 동작이 성공적으로 완료되었을 때
 				var img = document.getElementById("profileImg");
 				img.setAttribute("src", event.target.result);	
 			}
 			
 			reader.readAsDataURL(event.target.files[0]) // 바이너리 파일을 encode 문자열로 반환
 		}
 	</script>
  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register Card -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="${contextPath }/main" class="app-brand-link gap-2">
                  <span class="app-brand-text demo text-body fw-bolder">sim8log</span>
                </a>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">정보 수정 📝</h4>
              <br>
              <div class="divider">
          			<div class="divider-text">PERSONAL INFO</div>
        	  </div>
        		
              <form id="formAuthentication" class="mb-3"  name="inputForm" enctype="multipart/form-data" onsubmit="return inputCheck()" action="${contextPath }/member/modify" method="post">
                <div class="mb-3">
                  <label for="userId" class="form-label">ID</label>
                  <span style="color:#e44444">*</span>
                  <br>
                  <input
                    type="text"
                    class="form-control"
                    id="id"
                    name="id"
                    readonly="readonly"
                    value = "${memberDto.id }"
                  />
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
                      onkeyup="pwAlert2()"
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
                    value = "${memberDto.name }"
                    readonly="readonly"
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
                    value = "${memberDto.tel }"
                    onblur="telAlert()"
                  />
                  <small id="telAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
                  <label for="email" class="form-label">EMAIL</label>
                  <span style="color:#e44444">*</span>
                  <input type="email" class="form-control" value="${memberDto.email }"
                  		id="email" name="email" onblur="emailAlert()"placeholder="sim8log@naver.com" />
                  <small id="emailAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
               	  <label for="birth" class="form-label">BIRTH</label>
               	  <span style="color:#e44444">*</span>
                  <input class="form-control" type="date" value="${memberDto.birth }"
                  		id="html5-date-input" name="birth" onblur="birthAlert()" disabled="disabled" />
                  <small id="birthAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
               	  <label for="gender" class="form-label">GENDER</label>
               	  <span style="color:#e44444">*</span><br>
                     <div class="form-check form-check-inline mt-3">
                        <input class="form-check-input" type="radio" name="gender" value="F" 
                        	<c:if test="${memberDto.gender eq 'F'}">checked</c:if> disabled="disabled">
                        <label class="form-check-label" for="inlineRadio1">여자</label>
                     </div> &ensp;&ensp;
                     <div class="form-check form-check-inline">
                         <input class="form-check-input" type="radio" name="gender" value="M"
                         	<c:if test="${memberDto.gender eq 'M'}">checked</c:if> disabled="disabled">
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
			       <img src="${contextPath }/resources/bootstrap/img/profile/${memberDto.profileName}" id="profileImg" alt="user-avatar" class="d-block rounded" height="100" width="100" >
			          <div class="button-wrapper">
           				<label for="upload" class="btn btn-primary me-2 mb-4" onclick="fileDisabled()" tabindex="0" style="display: inline-flex; ">
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
                    value = "${memberDto.blogName }"
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
                    value = "${memberDto.nickname }"
                    placeholder="미입력 시 입력하신 ID로 자동 설정됩니다."
                  />
                </div>
                <div class="mb-3">
                  <label for="intro" class="form-label">INTRO</label>
                  <textarea class="form-control" id="intro" onkeyup="checkIntro(this)" rows="3" name="intro"
                  		placeholder="간단한 소개글을 남겨주세요." style="resize: none">${memberDto.intro }</textarea>
                  <small id="introLen">(0/50byte)</small>
                  <br>
                  <small id="introAlert" style="color:red"></small>
                </div>
                <br>
               <button class="btn btn-primary d-grid w-100">저장하기</button>
              </form>
            </div>
          </div>
          <!-- Register Card -->
        </div>
      </div>
    </div>
    <!-- / Content -->
  </body>
</html>
