<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<!-- Required meta tags-->
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="au theme template">
	<meta name="author" content="Hau Nguyen">
	<meta name="keywords" content="au theme template">
	
	<!-- Title Page-->
	<title>Admin 정보 수정</title>
	
	<!-- Fontfaces CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/font-face.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css"
		rel="stylesheet" media="all">
	
	<!-- Bootstrap CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css"
		rel="stylesheet" media="all">
	
	<!-- Vendor CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/animate.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css"
		rel="stylesheet" media="all">
	
	<!-- Main CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/theme.css"
		rel="stylesheet" media="all">

</head>

<body class="animsition" style="animation-duration: 900ms; opacity: 1;">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<jsp:include page="/resources/admin_bootstrap/commons/header_mobile.jsp" />
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<jsp:include page="/resources/admin_bootstrap/commons/sidebar.jsp" />
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">

			<!-- HEADER DESKTOP-->
			<jsp:include page="/resources/admin_bootstrap/commons/header_desktop.jsp" />
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<strong>정보 수정</strong>
									</div>
									<form action="admin-info" method="post" class="form-horizontal">
										<div class="card-body card-block">

											<div class="row form-group">
												<div class="col col-md-3">
													<label for="id" class=" form-control-label">아 이 디 <strong
														style="color: red">*</strong></label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="id" placeholder="ID" required
														maxlength="30" autofocus="autofocus" class="form-control"
														value="${admin.USER_ID }"> <br>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="name" class=" form-control-label">이 름 <strong
														style="color: red">*</strong></label>
												</div>
												<div class="col-12 col-md-9">
													<input type="text" name="name" placeholder="Name" required
														maxlength="20" class="form-control" value="${admin.USER_NAME }">
													<br>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="email" class=" form-control-label">이메일
														<strong style="color: red">*</strong>
													</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="email" name="email" placeholder="E-Mail"
														required maxlength="50" class="form-control"
														value="${admin.EMAIL }"> <br>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="password" class=" form-control-label">비밀번호
														<strong style="color: red">*</strong>
													</label>
												</div>
												<div class="col-12 col-md-9">
													<input type="password" id="password" name="pass"
														placeholder="Password" required maxlength="60"
														class="form-control"> <br>
												</div>
											</div>
											<div class="row form-group">
												<div class="col col-md-3">
													<label for="phone" class=" form-control-label">전화번호</label>
												</div>
												<div class="col-12 col-md-9">
													<div class="row form-group">
														<div class="col-3">
															<input type="tel" id="phone" name="phone"
																placeholder="Phone(3 Digits)" maxlength="3"
																class="form-control"
																value="${admin.PHONE.substring(0,3) }">
														</div>
														<div class="col-0">-</div>
														<div class="col-4">
															<input type="tel" id="phone" name="phone1"
																placeholder="Phone(4 Digits)" maxlength="4"
																class="form-control"
																value="${admin.PHONE.substring(3,7) }">
														</div>
														<div class="col-0">-</div>
														<div class="col-4">
															<input type="tel" id="phone" name="phone2"
																placeholder="Phone(4 Digits)" maxlength="4"
																class="form-control"
																value="${admin.PHONE.substring(7,11) }">
														</div>
													</div>
													<!-- <small class="form-text text-muted">-없이 입력하세요.</small> -->
													<br> <br> <small class="form-text text-muted"><strong
														style="color: red">*</strong>표시는 필수 입력란입니다.</small>
												</div>
											</div>
										</div>
										<div class="card-footer">
											<button type="submit" class="btn btn-primary btn-sm"
												style="float: right">
												<i class="fa fa-check"></i> 저장하기
											</button>
											<button type="reset" class="btn btn-danger btn-sm"
												onclick="location.href='admin-index'">
												<i class="fa fa-ban"></i> 저장하지 않고 홈으로 가기
											</button>
										</div>
									</form>
								</div>
							</div>
							<!-- <button type="button" class="btn btn-secondary mb-1" id="modalButton" data-toggle="modal" data-target="#mediumModal">Medium</button> -->
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>
	</div>

	<!-- Jquery JS-->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.js"></script>

	<!-- Main JS-->
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/js/main.js"></script>

</body>

</html>