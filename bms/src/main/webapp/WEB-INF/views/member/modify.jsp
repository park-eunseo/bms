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
              
              <form id="formAuthentication" class="mb-3"  name="inputForm" 
              		onsubmit="return inputCheck()" action="${contextPath }/member/modify" method="post">
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
                  <label class="form-label" for="password">Password</label>
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
                  <label class="form-label" for="password">Check Password</label>
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
                  <label for="userName" class="form-label">이름</label>
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
                  <label for="userTel" class="form-label">Tel</label>
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
                  <label for="email" class="form-label">Email</label>
                  <span style="color:#e44444">*</span>
                  <input type="email" class="form-control" value = "${memberDto.email }"
                  		id="email" name="email" onblur="emailAlert()"placeholder="sim8log@naver.com" />
                  <small id="emailAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
               	  <label for="birth" class="form-label">Birth</label>
               	  <span style="color:#e44444">*</span>
                  <input class="form-control" type="date" value = "${memberDto.birth }"
                  		id="html5-date-input" name="birth" onblur="birthAlert()" readonly="readonly" />
                  <small id="birthAlert" style="color:red"></small>
                </div>
                
                <div class="mb-3">
               	  <label for="gender" class="form-label">Gender</label>
               	  <span style="color:#e44444">*</span><br>
                     <div class="form-check form-check-inline mt-3">
                        <input class="form-check-input" type="radio" name="gender" value="F" checked="checked" readonly="readonly">
                        <label class="form-check-label" for="inlineRadio1">여자</label>
                     </div> &ensp;&ensp;
                     <div class="form-check form-check-inline">
                         <input class="form-check-input" type="radio" name="gender" value="M" readonly="readonly">
                         <label class="form-check-label" for="inlineRadio2">남자</label>
                     </div>
                     <small id="genderAlert" style="color:red"></small>
                </div>
                <br>
                <div class="dropdown-divider"></div>
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
                  <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" 
                  		name="intro" placeholder="간단한 소개글을 남겨주세요." style="resize: none">${memberDto.intro }</textarea>
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
