<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<title>리뷰 관리</title>
	
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
	<script>
	function abc(){
		var del;
		del=confirm("삭제하시겠습니까?");
		if(del){
			console.log("hi");
		$.ajax({
			type: 'delete',
			url: 'admin-deleteReview/ajax',
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			data: JSON.stringify({
				"NO":"${name}"
			}), 
			success: function(data) {
				console.log("POST 수행 후 Response 수신 성공!");
				console.log(data.result);
				
				if(data.result == "success") {			 
					console.log("성공이지롱");
					alert("삭제 완료.");
					location.href="/rudisfarm/admin/admin-reviewlist-manage";
				}
			},
			error: function(e) {
				console.log("에러 발생!");
				alert("삭제 실패.");
				console.log(e);
			}
		});
		
		} else{
			alert("삭제 취소됨.")
		}
	}
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
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<strong>리뷰 상세 내역</strong>
										<button class="btn btn-primary btn-sm" style="float: right"
											onclick="javascript:history.back()">
											<i class="fa fa-arrow-left"></i> 뒤로 가기
										</button>
									</div>
									
									<div class="card-body card-block">

										<div class="row form-group">
											<div class="col col-md-3">리뷰 아이디</div>
											<div class="col-12 col-md-9">
												${review.REVIEW_ID } <br>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">유저 아이디</div>
											<div class="col-12 col-md-9">
												${review.USER_ID } <br>
											</div>
										</div>
										<div class="row form-group" onclick="location.href='/rudisfarm/admin/admin-product-manage/${review.PRODUCT_ID}'" style="cursor:pointer; color:red">
											<div class="col col-md-3">상품 아이디</div>
											<div class="col-12 col-md-9">
												${review.PRODUCT_ID } <br>
											</div>
										</div>
										<div class="row form-group" onclick="location.href='/rudisfarm/admin/admin-product-manage/${review.PRODUCT_ID}'" style="cursor:pointer; color:red">
											<div class="col col-md-3">상품명</div>
											<div class="col-12 col-md-9">
												${review.PRODUCT_NAME } <br>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">리뷰 내용</div>
											<div class="col-12 col-md-9">
												${review.CONTENT } <br>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">첨부파일</div>
											<div class="col-12 col-md-9">
												<c:if test="${review.FILES!=''}">
																<c:forEach var="image" items="${fn:split(review.FILES, '/') }" varStatus="imageCount">
																<a href="<%= request.getContextPath() %>/resources/upload/images/review/user1/${image }"><img src="<%= request.getContextPath() %>/resources/upload/images/review/user1/${image }" width="400" alt="${image }">&nbsp;</a>
<%-- 																<c:if test="${imageCount.count%2==0}"> --%>
																<br><br>
<%-- 																</c:if> --%>
																</c:forEach>
																</c:if> <br>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">작성일</div>
											<div class="col-12 col-md-9">
												${review.WRITEDATE } <br>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">상품 별점</div>
											<div class="col-12 col-md-9">
												${review.PRODUCT_RATING }&nbsp;
												<strong style="color:blue">
                       							<c:choose>
													<c:when test="${review.getPRODUCT_RATING() == '1'}">★☆☆☆☆</c:when>
													<c:when test="${review.getPRODUCT_RATING() == '2'}">★★☆☆☆</c:when>
													<c:when test="${review.getPRODUCT_RATING() == '3'}">★★★☆☆</c:when>
													<c:when test="${review.getPRODUCT_RATING() == '4'}">★★★★☆</c:when>
													<c:when test="${review.getPRODUCT_RATING() == '5'}">★★★★★</c:when>
												</c:choose></strong> <br>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">판매자 별점</div>
											<div class="col-12 col-md-9">
												${review.SELLER_RATING }&nbsp;
												<strong style="color:blue">
                               					<c:choose>
													<c:when test="${review.getSELLER_RATING() == '1'}">★☆☆☆☆</c:when>
													<c:when test="${review.getSELLER_RATING() == '2'}">★★☆☆☆</c:when>
													<c:when test="${review.getSELLER_RATING() == '3'}">★★★☆☆</c:when>
													<c:when test="${review.getSELLER_RATING() == '4'}">★★★★☆</c:when>
													<c:when test="${review.getSELLER_RATING() == '5'}">★★★★★</c:when>
												</c:choose></strong> <br>
											</div>
										</div>
									</div>
									<div class="card-footer">
										
										<button type="reset" class="btn btn-danger btn-sm" style="float: right" onclick="abc()">
											<i class="fa fa-trash"></i> 삭제
										</button>
									</div>

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
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/js/main.js"></script>

</body>
</html>