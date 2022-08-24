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
        <div class="container py-5" >
            <h1 class="display-3 text-white mb-3 animated slideInDown" style="font-size: 30px;">심플한 나만의 일기를 써보세요.</h1>
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
	
	<c:if test="${empty sessionScope.memberId }">
		<div class="text-center mx-auto mb-5 fadeInUp" data-wow-delay="0.1s"
			style="height: 300px;">
			<p style="font-size: large; padding-top: 30px;">즐겨찾는 회원을 추가해 소식을 확인해 보세요 🙌 </h5>
		</div>
	</c:if>
	<c:if test="${not empty sessionScope.memberId }">
	
	<div class="container" style="width: 700px; background-color: white;">
		<div class="text-center mx-auto mb-5 fadeInUp" data-wow-delay="0.1s"
			style="max-width: 600px;">
			<h5 class="mb-4">즐겨찾는 회원의 새 글을 확인해 보세요 🙌 </h5>
		</div>


		<!-- card -->
		<div class="row mb-5">
			<div>
				<div class="card mb-3">
					<div class="row g-0">
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
						<div class="col-md-4">
							<img class="card-img card-img-right" style="height: 100%;"
								src="${contextPath }/resources/bootstrap/img/bridge-g0e9719a63_1920.jpg" alt="Card image">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:if>
	<!-- Service End -->

</body>
</html>