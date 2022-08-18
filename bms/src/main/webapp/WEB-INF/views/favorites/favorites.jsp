<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="content-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y">
			<div class="row">
				<div class="col-xl-6" style="width: 100%;">
					<h6 class="text-muted">즐겨찾기</h6>
					<div class="nav-align-top mb-4" style="padding-top: 15px;">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<button type="button" class="nav-link active" role="tab"
									data-bs-toggle="tab" data-bs-target="#navs-top-home"
									aria-controls="navs-top-home" aria-selected="true">회원
								</button>
							</li>
							<li class="nav-item">
								<button type="button" class="nav-link" role="tab"
									data-bs-toggle="tab" data-bs-target="#navs-top-profile"
									aria-controls="navs-top-profile" aria-selected="false">
									게시글</button>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade active show" id="navs-top-home"
								role="tabpanel">
								<div class="table-responsive text-nowrap">
				                  <table class="table table-striped">
				                    <thead>
				                      <tr>
				                        <th style="padding-left: 40px;">ID</th>
				                        <th>Nickname</th>
				                        <th>Actions</th>
				                      </tr>
				                    </thead>
				                    <tbody class="table-border-bottom-0">
				                      <tr>
				                        <td><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>Angular Project</strong></td>
				                        <td>Albert Cook</td> 
				                        <td>
 											<button type="button" class="btn rounded-pill btn-outline-danger" 
 												style="font-size: 0.7rem; padding: 0.4rem 0.7rem;">
				                          	<i class="bx bx-trash me-1" style="font-size: 1rem;"></i>Delete</button>
				                        </td>
				                      </tr>
				                      <tr>
				                        <td><i class="fab fa-react fa-lg text-info me-3"></i> <strong>React Project</strong></td>
				                        <td>Barry Hunter</td>             
				                        <td>
				                          <button type="button" class="btn rounded-pill btn-outline-danger"
				                          		style="font-size: 0.7rem; padding: 0.4rem 0.7rem;">
				                          	<i class="bx bx-trash me-1" style="font-size: 1rem;"></i>Delete</button>
				                        </td>
				                      </tr>
				                      <tr>
				                        <td><i class="fab fa-vuejs fa-lg text-success me-3"></i> <strong>VueJs Project</strong></td>
				                        <td>Trevor Baker</td>
				                        <td>
				                          <button type="button" class="btn rounded-pill btn-outline-danger"
				                          		style="font-size: 0.7rem; padding: 0.4rem 0.7rem;">
				                          	<i class="bx bx-trash me-1" style="font-size: 1rem;"></i>Delete</button>
				                        </td>
				                      </tr>
				                    </tbody>
				                  </table>
                				</div>
							</div>
							<div class="tab-pane fade" id="navs-top-profile" role="tabpanel">
								<p>Donut dragée jelly pie halvah. Danish gingerbread bonbon
									cookie wafer candy oat cake ice cream. Gummies halvah tootsie
									roll muffin biscuit icing dessert gingerbread. Pastry ice cream
									cheesecake fruitcake.</p>
								<p class="mb-0">Jelly-o jelly beans icing pastry cake cake
									lemon drops. Muffin muffin pie tiramisu halvah cotton candy
									liquorice caramels.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>