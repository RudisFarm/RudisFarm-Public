<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<title>승인된 판매자 목록 관리</title>
	
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
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){//실행안됨
		$("#selectAll").click(function() {
			$('.check').click();
		});
	});
	</script>
	
</head>

<body class="animsition">
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
							<div class="col-md-12">
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">승인된 판매자 목록</h3>
								<div class="table-data__tool">
									<div class="table-data__tool-left">
										<div class="rs-select2--light rs-select2--md">
											<select class="js-select2 select2-hidden-accessible"
												name="property" tabindex="-1" aria-hidden="true">
												<option selected="selected" value="">All Properties</option>
												<option value="">Option 1</option>
												<option value="">Option 2</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<div class="rs-select2--light rs-select2--sm">
											<select class="js-select2 select2-hidden-accessible"
												name="time" tabindex="-1" aria-hidden="true">
												<option selected="selected" value="">Today</option>
												<option value="">3 Days</option>
												<option value="">1 Week</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
									<div class="table-data__tool-right">
										<div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
											<select class="js-select2 select2-hidden-accessible"
												name="type" tabindex="-1" aria-hidden="true">
												<option selected="selected">Export</option>
												<option value="">Option 1</option>
												<option value="">Option 2</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>
								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th><label class="au-checkbox"> <input
														type="checkbox" id="selectAll"> <span class="au-checkmark"></span>
												</label></th>
												<th>No.</th>
												<th>아이디</th>
												<th>이메일</th>
												<th>이름</th>
												<th>주소지</th>
												<th>상태</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach begin="1" end="15" varStatus="loop">
												<tr class="tr-shadow">
													<td><br> <label class="au-checkbox"> <input
															type="checkbox" class="check"> <span class="au-checkmark"></span>
													</label></td>
													<td>${loop.count }</td>
													<td><br>
													<button class="au-btn au-btn--block au-btn--green m-b-20"
															onclick="location.href='/admin/admin-approvedsellerlist-manage/${loop.count }'">첫번째</button>
													</td>
													<td class="desc">두번째</td>
													<td><span class="block-email">세번째</span></td>
													<td><span class="status--process">네번째</span></td>
													<td><span class="status--denied">다섯번째</span></td>
													<td>
														<div class="table-data-feature">
															<button class="item" data-toggle="tooltip"
																data-placement="top" title=""
																data-original-title="Delete">
																<i class="zmdi zmdi-delete"></i>
															</button>
														</div>
													</td>
												</tr>
												<tr class="spacer"></tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!-- END DATA TABLE -->
								<br>
								<button class="btn btn-danger btn-sm" onclick=""
									style="float: right">
									<i class="fa fa-trash"></i> 삭제
								</button>
							</div>
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
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.js"></script>

	<!-- Main JS-->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/js/main.js"></script>

</body>
</html>