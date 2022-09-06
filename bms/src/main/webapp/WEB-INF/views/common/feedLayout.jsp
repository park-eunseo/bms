<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr" data-theme="theme-default" data-assets-path="../assets/" data-template="vertical-menu-template-free">
<meta charset="UTF-8">
<title> ${memberInfo.blogName }_심플로그</title>

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

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/libs/perfect-scrollbar/perfect-scrollbar.css" />
    <link rel="stylesheet" href="${contextPath }/resources/bootstrap/libs/apex-charts/apex-charts.css" />

	<!-- page -->
	<link rel="stylesheet" href="${contextPath }/resources/bootstrap/css/pages/page-auth.css">
	
    <!-- Template Stylesheet -->
    <link href="${contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">
    
    <!-- Helpers -->
    <script src="${contextPath }/resources/bootstrap/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${contextPath }/resources/bootstrap/js/config.js"></script>
</head>
<body>
	<!-- Spinner Start -->
	<div id="spinner"
		class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-border text-secondary" role="status">
			<span class="visually-hidden">Loading</span>
		</div>
	</div>
	<!-- Spinner End -->
	
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<tiles:insertAttribute name="leftSide"></tiles:insertAttribute>

			<div class="layout-page" >
				<tiles:insertAttribute name="header"></tiles:insertAttribute>
				<div class="content-wrapper">
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
					<tiles:insertAttribute name="footer"></tiles:insertAttribute>
					<div class="content-backdrop fade"></div>
				</div>
			</div>
		</div>
		<div class="layout-overlay layout-menu-toggle"></div>
	</div>

	<!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->

    <!-- <script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script> -->
    <script src="${contextPath }/resources/bootstrap/libs/popper/popper.js"></script>
    <script src="${contextPath }/resources/bootstrap/js/bootstrap.js"></script>
    <script src="${contextPath }/resources/bootstrap/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${contextPath }/resources/bootstrap/libs/wow/wow.min.js"></script>
    <script src="${contextPath }/resources/bootstrap/libs/easing/easing.min.js"></script>
    <script src="${contextPath }/resources/bootstrap/libs/waypoints/waypoints.min.js"></script>
    <script src="${contextPath }/resources/bootstrap/libs/counterup/counterup.min.js"></script>
    <script src="${contextPath }/resources/bootstrap/libs/owlcarousel/owl.carousel.min.js"></script>
    <script src="${contextPath }/resources/bootstrap/libs/isotope/isotope.pkgd.min.js"></script>
    <script src="${contextPath }/resources/bootstrap/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="${contextPath }/resources/bootstrap/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="${contextPath }/resources/bootstrap/js/detailMain.js"></script>

    <!-- Page JS -->
    <script src="${contextPath }/resources/bootstrap/js/dashboards-analytics.js"></script>
    <script src="${contextPath }/resources/bootstrap/js/pages-account-settings-account.js"></script>
    
    <!-- Template Javascript -->
    <script src="${contextPath }/resources/bootstrap/js/main.js"></script>
    
    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    
</body>
</html>