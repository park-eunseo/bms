<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.headerHr {
	width: 0.7px;
	height: 30px;
	margin-left: 2px;
	margin-right: 2px;
}

.headerBtn {
	padding: 0.4375rem 0.5rem;
	display: list-item;
	margin-left: auto;
	color: #3d3d3d;
	background: none;
	border-color: #fff;
	box-shadow: none;
}

</style>
<script src="${contextPath }/resources/bootstrap/libs/jquery/jquery.js"></script>
<script>
	var memberId = '<%=(String) session.getAttribute("memberId")%>'
	function search() {
		if (window.event.keyCode == 13) {
			var searchWord = document.getElementById("searchWord")
			location.href = "${contextPath}/feed?id=${memberInfo.id}&searchWord="
					+ searchWord.value
		}
	}
	
	function timeForToday(value) { // 날짜 계산, 알림이 몇 분 전, 몇 시간 전 도착인지 이외는 날짜 표시
        const today = new Date();
        const timeValue = new Date(value);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금 전';
        if (betweenTime < 60) {  return betweenTime + "분 전"; }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) { return betweenTimeHour + "시간 전"; }

        return value;
 	}	
	
	function noticeClick(postId){ // 알림 클릭 시 제거
		$.ajax({
			type : "get",
			url : "${contextPath}/notice/deleteNotice?toId=" + memberId + "&postId=" + postId
		})
	}
	
	$().ready(function(){
		$.ajax({
			type : "get",
			url : "${contextPath}/notice/noticeList?id=" + memberId,
			dataType : "json",
			success : function(data){
				var list = ""

				if(data != ""){
					$(data).each(function(key, value){
							var category = value.category;
						
							list += "<li>";
							list += "<div class='dropdown-item' style='margin-bottom: 0;'>";
							list += "<a href='${contextPath}/feed/detailPost?id=" + memberId +"&postId=" + value.postId +"' style='color: black;' ";
							list += "onclick='noticeClick(" + value.postId + ")'>";
							if(category == "like"){ list += value.fromId + " 님이 ["+ value.content +"] 글에 좋아요를 눌렀습니다." }
							else if(category == "reply"){ list += value.fromId + " 님이 ["+ value.content +"] 글에 댓글을 남겼습니다." }
							else if(category == "re_reply"){ list += value.fromId + " 님이 ["+ value.content +"] 댓글에 답댓글을 남겼습니다." };
							list += "</a>";
							list += "<small style='display: block;'>" + timeForToday(value.regDate) + "</small>";
							list += "</div>";
							list += "<hr style='margin: auto;'>";
							list += "</li>";
					});
				} else {
					list += "<li>";
					list += "<div class='dropdown-item' style='margin-bottom: 0;'>";
					list += "<span >새 알림이 없습니다.</span>"
					list += "</div>";
					list += "</li>";
				}
				$("#noticeList").html(list)
			}
		})
		
		$.ajax({
			type : "get",
			url : "${contextPath}/notice/noticeCount?id=" + memberId,
			success : function(data){
				$("#noticeCount").text(data)
			}
		})
	})
</script>
</head>
<body>
	<nav
		class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
		id="layout-navbar">

		<div
			class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0   d-xl-none ">
			<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
				<i class="bx bx-menu bx-sm"></i>
			</a>
		</div>

		<div class="navbar-nav-right d-flex align-items-center"
			id="navbar-collapse">

			<!-- Search -->
			<div class="navbar-nav align-items-center">
				<!-- 현재 페이지인 블로그 범위 -->
				<div class="nav-item d-flex align-items-center">
					<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
						class="form-control border-0 shadow-none" id="searchWord"
						placeholder="Search" onkeyup="search()">
				</div>
			</div>
			<hr>
			<!-- /Search -->

			<div class="navbar-nav align-items-center"
				style="display: -webkit-inline-box; margin-left: auto; margin-right: -15px;">
				<c:choose>
					<c:when test="${memberInfo.id eq  sessionScope.memberId}">
						<button type="button" class="btn rounded-pill headerBtn"
							onclick="location.href='${contextPath}/feed/writePost'">
							<span class="tf-icons bx bx-pencil"></span>
						</button>
						<hr
							style="width: 0.7px; height: 30px; margin-left: 2px; margin-right: 2px;">
						<button type="button" class="btn rounded-pill headerBtn"
							onclick="location.href='${contextPath}/manage/manageList'">
							<span class="tf-icons bx bxs-star"></span>
						</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="btn rounded-pill headerBtn"
							onclick="location.href='${contextPath}/feed?id=${sessionScope.memberId }'">
							<span class="tf-icons bx bxs-home"></span>
						</button>
					</c:otherwise>
				</c:choose>
				<hr
					style="width: 0.7px; height: 30px; margin-left: 2px; margin-right: 2px;">
				<!-- 알림 -->
				<button type="button" class="btn rounded-pill headerBtn"
					data-bs-toggle="dropdown" aria-expanded="false">
					<span class="tf-icons bx bxs-bell"></span> 
					<span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20"
						style="top: -8px; margin-left: -5px;" id="noticeCount">0</span>
				</button>
				<ul class="dropdown-menu" style="left: auto; position: absolute; right: 0;" id="noticeList">

				</ul>
			</div>
		</div>
	</nav>
</body>
</html>