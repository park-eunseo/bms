<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<title><tiles:insertAttribute name="title"></tiles:insertAttribute> </title>
<head>
    <meta charset="utf-8">
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
    
	<!-- header -->
	<tiles:insertAttribute name="header"></tiles:insertAttribute>

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

	<!-- footer -->
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Template Javascript -->
    <script src="${contextPath }/resources/bootstrap/js/main.js"></script>
</body>

</html>