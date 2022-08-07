<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
</head>
<body>
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

	<!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>

</html>