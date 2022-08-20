<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function categoryCheck(){
		var category = document.getElementById("newCategory")
		
		if(category.value.length < 1 || category.value.length > 10){
			category.focus()
			alert("카테고리명을 다시 확인해 주세요.")
			
			return false
		}
	}
</script>
</head>
<body>
	<div class="container-xxl flex-grow-1 container-p-y"
		style="margin-top: 20px;">
		<div class="col-xl-6" style="width: 50%;">
			<h4 class="text-muted" style="color: #8e8e8e;">카테고리</h4>
			<div class="tab-content" style="box-shadow: none;">
				<div class="table-responsive text-nowrap">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>카테고리</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<c:forEach var="category" items="${categoryList }">
							<tbody class="table-border-bottom-0">
								<tr>
									<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
										<strong>${category.categoryTitle }</strong></td>
									<td><a href="javascript:void(0);"> <i
											class="bx bx-edit-alt me-1"></i></a></td>
									<td><a href="javascript:void(0);"> <i
											class="bx bx-trash me-1"></i></a></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="card-body">
				<form action="${contextPath}/addCategory"
					onsubmit="return categoryCheck()">
					<div>
						<label for="defaultFormControlInput" class="form-label">카테고리명</label>
						<input type="text" class="form-control" id="newCategory"
							name="categoryTitle" placeholder="10자 이내로 입력해 주세요.">
						<div id="defaultFormControlHelp" class="form-text">*중복된
							카테고리명은 저장되지 않습니다.</div>
					</div>
					<div style="text-align-last: end;">
						<button type="submit" class="btn rounded-pill btn-outline-dark"
							style="padding: 3px 3px;">
							<i class='bx bx-plus'></i>
						</button>
					</div>
					<input type="hidden" name="memberId"
						value="${sessionScope.memberId }">
				</form>
			</div>
			<div class="card-body">
				<form action="${contextPath}/moidfyCategory"
					onsubmit="return categoryCheck()">
					<div>
						<label for="defaultFormControlInput" class="form-label">카테고리명</label>
						<input type="text" class="form-control" id="newCategory"
							name="categoryTitle" placeholder="10자 이내로 입력해 주세요.">
						<div id="defaultFormControlHelp" class="form-text">*중복된
							카테고리명은 저장되지 않습니다.</div>
					</div>
					<div style="text-align-last: end;">
						<button type="submit" class="btn rounded-pill btn-outline-dark"
							style="padding: 3px 3px;">
							<i class='bx bx-plus'></i>
						</button>
					</div>
					<input type="hidden" name="memberId"
						value="${sessionScope.memberId }">
				</form>
			</div>
		</div>
	</div>
</body>
</html>