<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y" style="margin-top: 20px;">
			<div class="row">
				<div class="col-xl-6" style="width: 100%;">
					<h4 class="text-muted" style="color: #8e8e8e;">카테고리</h4>
					<div class="nav-align-top mb-4" style="padding-top: 15px; width: fit-content;">
						<div class="tab-content" style="box-shadow: none;">
							<div class="tab-pane fade active show" id="navs-top-home" role="tabpanel">
								<div class="table-responsive text-nowrap">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>카테고리</th>
												<th>수정</th>
											</tr>
										</thead>
										<tbody class="table-border-bottom-0">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
													<strong>전체</strong></td>
												<td></td>
											</tr>
										</tbody>
										<tbody class="table-border-bottom-0">
											<tr>
												<td><i class="fab fa-angular fa-lg text-danger me-3"></i>
													<strong>여행</strong></td>
												<td>
													<div class="dropdown">
														<button type="button"
															class="btn p-0 dropdown-toggle hide-arrow"
															data-bs-toggle="dropdown">
															<i class="bx bx-dots-vertical-rounded"></i>
														</button>
														<div class="dropdown-menu">
															<a class="dropdown-item" href="javascript:void(0);"><i
																class="bx bx-edit-alt me-1"></i> Edit</a> <a
																class="dropdown-item" href="javascript:void(0);"><i
																class="bx bx-trash me-1"></i> Delete</a>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<div style="display: inline-flex;">
										<input type="text" class="form-control" id="" placeholder="카테고리명은 10자 이하" style="padding: 3px 3px; margin-right: 0.5rem;">
										<button type="button" class="btn rounded-pill btn-outline-dark" style="padding: 3px 3px;">
                              				<i class='bx bx-plus'></i>	
										</button>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  <nav aria-label="Page navigation" style="align-self: center;">
			<ul class="pagination">
				<li class="page-item prev">
					<a class="page-link" href="javascript:void(0);">
					<i class="tf-icon bx bx-chevron-left"></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);">1</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);">2</a>
				</li>
				<li class="page-item active">
					<a class="page-link" href="javascript:void(0);">3</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);">4</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);">5</a>
				</li>
				<li class="page-item next">
					<a class="page-link" href="javascript:void(0);"> 
						<i class="tf-icon bx bx-chevron-right"></i>
					</a>
				</li>
			</ul>
		</nav> -->
	</div>
</body>
</html>