<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
</head>
<body>
	<div class="container-fluid page-header py-5 mb-5">
		<div class="container py-5">
			<h1 class="display-3 text-white mb-3 animated slideInDown">Services</h1>
			<nav aria-label="breadcrumb animated slideInDown">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
					<li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
					<li class="breadcrumb-item text-white active" aria-current="page">Services</li>
				</ol>
			</nav>
		</div>
	</div>
	<!-- Service Start -->
	<div class="container" style="width: 700px;">
		<div class="text-center mx-auto mb-5 fadeInUp" data-wow-delay="0.1s"
			style="max-width: 600px;">
			<h1 class="mb-4" style="font-size: 2em;">친구들의 새로운 소식을 둘러보세요 🙌 </h1>
		</div>


		<!-- card -->
		<div class="row mb-5">
			<div>
				<div class="card mb-3">
					<div class="row g-0">
						<div class="col-md-4">
							<img class="card-img card-img-left" style=" height: 100%;"
								src="${contextPath }/resources/bootstrap/img/bridge-g0e9719a63_1920.jpg" alt="Card image">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-muted">Last updated 3 mins ago</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="card mb-3">
					<div class="row g-0">
						<div class="col-md-4">
							<img class="card-img card-img-left" style=" height: 100%;"
								src="${contextPath }/resources/bootstrap/img/lake-5538757_1280.jpg" alt="Card image">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-muted">Last updated 3 mins ago</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<div class="card mb-3">
					<div class="row g-0">
						<div class="col-md-4">
							<img class="card-img card-img-left" style=" height: 100%;"
								src="${contextPath }/resources/bootstrap/img/wallpaperbetter.jpg" alt="Card image">
						</div>
						<div class="col-md-8">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-muted">Last updated 3 mins ago</small>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Service End -->

	<!-- Back to Top -->
	<a href="#"
		class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
		class="bi bi-arrow-up"></i></a>
		
		    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>