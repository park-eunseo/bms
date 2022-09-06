<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&amp;family=Roboto:wght@500;700;900&amp;display=swap" rel="stylesheet"> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="${contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath }/resources/bootstrap/css/style.css" rel="stylesheet">
<title>심플로그</title>
<meta charset="UTF-8">
</head>
<body>
<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
        <div class="container text-center">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <i class="bi bi-exclamation-triangle display-1 text-primary"></i>
                    <h1 class="display-1">404</h1>
                    <h3 class="mb-4">요청하신 페이지를 찾을 수 없습니다.</h3>
                    <a class="btn rounded-pill py-3 px-5" href="${contextPath }/" style="color: white; background-color: black; box-shadow: none">sim8log로 돌아가기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>