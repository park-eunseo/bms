<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>

<!-- beautify ignore:start -->
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Layout container -->
        <div class="layout-page" style="padding-left: 0px;">
          <!-- Content wrapper -->
          <div class="content-wrapper">
          <!-- 블로그 카드 시작 부분 -->
			 <div class="container-xxl flex-grow-1 container-p-y">
				<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
				  <div class="col">
				    <div class="card h-100">
				      <img class="card-img-top" src="${contextPath }/resources/bootstrap/img/bridge-g0e9719a63_1920.jpg" alt="Card image cap">
				      <div class="card-body">
				        <h5 class="card-title">Card title</h5>
				        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				      </div>
				    </div>
				  </div>
				  <div class="col">
				    <div class="card h-100">
				      <img class="card-img-top" src="${contextPath }/resources/bootstrap/img/bridge-g0e9719a63_1920.jpg" alt="Card image cap">
				      <div class="card-body">
				        <h5 class="card-title">Card title</h5>
				        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				      </div>
				    </div>
				  </div>
				  <div class="col">
				    <div class="card h-100">
				      <img class="card-img-top" src="${contextPath }/resources/bootstrap/img/bridge-g0e9719a63_1920.jpg" alt="Card image cap">
				      <div class="card-body">
				        <h5 class="card-title">Card title</h5>
				        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content.</p>
				      </div>
				    </div>
				  </div>
				  <div class="col">
				    <div class="card h-100">
				      <img class="card-img-top" src="${contextPath }/resources/bootstrap/img/wallpaperbetter.jpg" alt="Card image cap">
				      <div class="card-body">
				        <h5 class="card-title">Card title</h5>
				        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				      </div>
				    </div>
				  </div>
				  <div class="col">
				    <div class="card h-100">
				      <img class="card-img-top" src="${contextPath }/resources/bootstrap/img/lake-5538757_1280.jpg" alt="Card image cap">
				      <div class="card-body">
				        <h5 class="card-title">Card title</h5>
				        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				      </div>
				    </div>
				  </div>
				  <div class="col">
				    <div class="card h-100">
				      <img class="card-img-top" src="${contextPath }/resources/bootstrap/img/lake-5538757_1280.jpg" alt="Card image cap">
				      <div class="card-body">
				        <h5 class="card-title">Card title</h5>
				        <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
				      </div>
				    </div>
				  </div>
				</div>
			 </div>
            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->  
  </body>
</html>
