<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.categoryInput {
	font-size: xx-small;
	display: inline;
	box-shadow: none;
	width: fit-content;
}
</style>
<script>
	function addCategoryCheck(){
		var category = document.getElementById("newCategory")
		
		if(category.value.length < 1 || category.value.length > 10){
			alert("카테고리명을 다시 확인해 주세요.")
			
			return false
		}
	}
	
	function setCategory(obj){
		if(obj.innerText == '전체') {
			alert("기본 카테고리는 수정할 수 없습니다.")
			return false
		}
		
		document.getElementById("resetCategory").value = obj.innerText
		document.getElementById("categoryId").value = obj.getAttribute("data-value")
		
		return false
	}
	
	function resetCategoryCheck(action){
		var category = document.getElementById("resetCategory")
		var form = document.resetForm
		
		if(category.value.length < 1 || category.value.length > 10){
			alert("카테고리명을 다시 확인해 주세요.")		
			return false
		}
		
		if(document.getElementById("categoryId").value == ""){
			alert("수정할 카테고리를 먼저 선택해 주세요.")
			return false
		}
		
		if(action == 'delete'){
			var check = confirm("해당 카테고리에 게시된 글은 기본 카테고리로 이동됩니다. 삭제하시겠습니까?")
			
			if(!check) {
				history.go(0)
				return false
			}
		}
		
		document.getElementById("action").value = action
		
		form.submit()
	}
</script>
</head>
<body>
	<div class="container-xxl flex-grow-1 container-p-y"
		style="margin-top: 20px;">
		<div class="col-xl-6" style="width: 50%;">
			<h4 class="text-muted" style="color: #8e8e8e;">카테고리</h4>
			<div class="tab-content"
				style="box-shadow: none; width: fit-content;">
				<div class="table-responsive text-nowrap">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>카테고리</th>
							</tr>
						</thead>
						<c:forEach var="category" items="${categoryList }">
							<tbody class="table-border-bottom-0">
								<tr>
									<td><a href="#" onclick="return setCategory(this)"
										data-value="${category.categoryId }">
										<strong>${category.categoryTitle }</strong></a>
									</td>
								</tr>
							</tbody>
						</c:forEach>
						<tbody class="table-border-bottom-0">
							<form action="${contextPath}/addCategory" onsubmit="return addCategoryCheck()">
								<!-- 추가 -->
								<tr>
									<td><input type="text" class="form-control categoryInput"
										id="newCategory" name="categoryTitle"
										placeholder="10자 이내로 입력해 주세요.">
										<button type="submit"
											class="btn rounded-pill btn-outline-dark"
											style="padding: 3px 4px; margin-left: 10px;">
											<i class='bx bx-plus'></i>
										</button></td>
								</tr>
								<input type="hidden" name="memberId"
									value="${sessionScope.memberId }">
							</form>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-body" style="width: 17.8rem;">
				<form action="${contextPath }/resetCategory" name="resetForm"
					onsubmit="return resetCategoryCheck()">
					<!-- 수정 및 삭제 -->
					<div>
						<label for="defaultFormControlInput" class="form-label">수정할
							카테고리를 눌러주세요.</label> 
						<input type="text" class="form-control"
							id="resetCategory" style="box-shadow: none;" name="categoryTitle"
							placeholder="10자 이내로 입력해 주세요.">
						<div id="defaultFormControlHelp" class="form-text">
							*중복된 카테고리명은 저장되지 않습니다.</div>
					</div>
					<div style="text-align-last: end; margin-top: 10px">
						<button type="button" class="btn btn-primary"
							onclick="resetCategoryCheck('modify')" style="padding: 5px 10px;">수정</button>
						<button type="button" class="btn btn-outline-danger"
							onclick="resetCategoryCheck('delete')" style="padding: 5px 10px;">삭제</button>
					</div>
					<input type="hidden" id="categoryId" name="categoryId" value="">
					<input type="hidden" name="memberId"
						value="${sessionScope.memberId }"> <input type="hidden"
						id="action" name="action" value="">
				</form>
			</div>
		</div>
	</div>
</body>
</html>