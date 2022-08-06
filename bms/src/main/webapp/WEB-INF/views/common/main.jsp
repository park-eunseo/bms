<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Main</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/fonts/boxicons.css" />
    
    <!-- Core CSS -->
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/demo.css" />

    <!-- Template Stylesheet -->
    <link href="${contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading</span>
        </div>
    </div>
    <!-- Spinner End -->
    
    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
        <a href="index.html" class="navbar-brand d-flex align-items-center border-end px-4 px-lg-5">
           <span class="app-brand-text demo menu-text fw-bolder ms-2">simplog</span>
        </a>
			<!-- Search -->
            <div class="navbar-nav align-items-center">
               <div class="btn-group">
                   <button
                        type="button"
                        class="btn btn-outline-primary dropdown-toggle"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                      >
                        전체
                   </button>
                   <ul class="dropdown-menu">
	                   <li><button class="dropdown-item">작성자</button></li>
	                   <li><a class="dropdown-item" href="javascript:void(0);">블로그명</a></li>
	                   <li><a class="dropdown-item" href="javascript:void(0);">제목</a></li>
	                   <li><a class="dropdown-item" href="javascript:void(0);">내용</a></li>
                   </ul>
                </div>
                &ensp;&ensp;&ensp;&ensp;
                <div class="nav-item d-flex align-items-center">
                  <i class="bx bx-search fs-4 lh-0"></i>
                  <input
                    type="text"
                    class="form-control border-0 shadow-none"
                    placeholder="검색어를 입력하세요."
                  />
                </div>
              </div>
              <!-- /Search -->

              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
				
                <!-- User -->
                  <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bxs-user me-2"></i>
                        <span class="align-middle">회원가입</span>
                      </a>
                    </li>
                  <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-key me-2"></i>
                        <span class="align-middle">ID/PW 찾기</span>
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="auth-login-basic.html">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">로그인</span>
                      </a>
                    </li>
                  </ul>
                <!--/ User -->
          </nav>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-3 text-white mb-3 animated slideInDown">simPLOG</h1>
        </div>
    </div>
    <!-- Page Header End -->


	<!-- Service Start -->
		<div class="container">
			<div class="text-center mx-auto mb-5 fadeInUp"
				data-wow-delay="0.1s" style="max-width: 600px;">
				<h1 class="mb-4" style="font-size: 2em;">친구들의 소식을 둘러보세요.</h1>
			</div>


			<!-- card -->
			<div class="row mb-5">
				<div class="col-md-6 col-lg-4 mb-3">
					<div class="card h-100">
						<img class="card-img-top"
							src="${contextPath }/resources/bootstrap/img/elements/2.jpg"
							alt="Card image cap" />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="javascript:void(0)" class="btn btn-outline-primary">Go
								somewhere</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 mb-3">
					<div class="card h-100">
						<img class="card-img-top"
							src="${contextPath }/resources/bootstrap/img/elements/13.jpg"
							alt="Card image cap" />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="javascript:void(0)" class="btn btn-outline-primary">Go
								somewhere</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4 mb-3">
					<div class="card h-100">
						<img class="card-img-top"
							src="${contextPath }/resources/bootstrap/img/elements/1.jpg"
							alt="Card image cap" />
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="javascript:void(0)" class="btn btn-outline-primary">Go
								somewhere</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!-- Service End -->

	<!-- Footer Start -->
	<div class="container-fluid bg-dark text-body footer mt-5 data-wow-delay="0.1s">
		<div class="container py-5">
			<div class="row g-5">
				<div class="col-lg-3 col-md-6">
					<h5 class="text-white mb-4">Address</h5>
					<p class="mb-2">
						<i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA
					</p>
					<p class="mb-2">
						<i class="fa fa-phone-alt me-3"></i>+012 345 67890
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope me-3"></i>info@example.com
					</p>	
				</div>
			</div>
		</div>
		<div class="container">
			<div class="copyright">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
						&copy; <a href="#">Your Site Name</a>, All Right Reserved.
					</div>
					<div class="col-md-6 text-center text-md-end">
						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By <a href="https://htmlcodex.com">HTML Codex</a> <br>Distributed
						By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath }/resources/bootstrap/js/main.js"></script>
</body>

</html>