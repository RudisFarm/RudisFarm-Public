<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%
	System.out.println("jsp 진입");
%>
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
<title>관리자 주문 관리 메인페이지</title>

<!-- Fontfaces CSS-->
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/font-face.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/animate.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/theme.css"
	rel="stylesheet" media="all">

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function deleteOrders(orders_id) {
		if (confirm("정말로 삭제 하시겠습니까?")) {
			$.ajax({
				type : 'delete',
				url : 'admin-orders-manage/' + orders_id,
				dataType : 'json',
				contentType : "application/json; charset=utf-8;",
				success : function(data) {
					if (data) {
						alert("성공적으로 삭제 되었습니다.");
						location.href = window.location.href;
					} else {
						alert("삭제에 실패하였습니다.");
					}
				},
				error : function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
		}
	}
</script>
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<jsp:include
			page="/resources/admin_bootstrap/commons/header_mobile.jsp" />
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<jsp:include page="/resources/admin_bootstrap/commons/sidebar.jsp" />
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include
				page="/resources/admin_bootstrap/commons/header_desktop.jsp" />
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-t-30">
							<div class="col-md-12">


								<%-- 	<div class="rs-select2--light rs-select2--md">
									<select class="js-select2" name="property" id="orderby">
									</select>
									<div class="dropDownSelect2"></div>
									<input type="hidden" id="sort" value="${ordersPagenation.sort}">
								</div>
								                                        <input type="hidden" value="${ordersPagenation.sort}" id="sort">

								<div class="rs-select2--light rs-select2--sm">
									<select class="js-select2" name="time" id="TYPE1">
										<option selected="selected" value="">----</option>
									</select>
									<div class="dropDownSelect2"></div>
																			<input type="hidden" value="${ordersPagenation.type1}" name="TYPE1">                                            
								</div>
								<div class="rs-select2--light rs-select2--sm">
									<select class="js-select2" name="time" id="TYPE2">
										<option selected="selected" value="">----</option>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
																		<input type="hidden" value="${ordersPagenation.type2}" name="TYPE2">
								<button class="au-btn-filter" id="search">
									<i class="zmdi zmdi-filter-list"></i>필터
								</button>
							</div>
							<ul class="pagination">
								<c:choose>
									<c:when test="${fn:length(ordersPagenation.ordersList) > 0}">
										<c:choose>
											<c:when test="${ordersPagenation.page <= 1}">
												<li class="page-item disabled"><a class="page-link"
													href="javascript:void(0)">이전</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="/rudisfarm/admin/admin-orders-manage?page=${ordersPagenation.page-1}&keyword=${ordersPagenation.keyword}&type1=${ordersPagenation.type1}&type2=${ordersPagenation.type2}&sort=${ordersPagenation.sort}">이전</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach var="startNum"
											begin="${ordersPagenation.startPage}"
											end="${ordersPagenation.endPage}">
											<c:choose>
												<c:when test="${startNum eq ordersPagenation.page}">
													<li class="page-item disabled"><a class="page-link"
														href="javascript:void(0)">${startNum}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														href="/rudisfarm/admin/admin-orders-manage?page=${startNum}&keyword=${ordersPagenation.keyword}&type1=${ordersPagenation.type1}&type2=${ordersPagenation.type2}&sort=${ordersPagenation.sort}">${startNum}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when
												test="${ordersPagenation.page ge ordersPagenation.maxPage}">
												<li class="page-item disabled"><a class="page-link"
													href="javascript:void(0)">다음</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="/rudisfarm/admin/admin-orders-manage?page=${ordersPagenation.page+1}&keyword=${ordersPagenation.keyword}&type1=${ordersPagenation.type1}&type2=${ordersPagenation.type2}&sort=${ordersPagenation.sort}">다음</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
							</ul>

							<div class="table-data__tool-right">
								<!-- 검색창 ---------------------------------------->

    <select name="search_option" id="keywordType">
        <option value="ORDERS_NAME"
<c:if test="${keywordType == 'ORDERS_NAME'}">selected</c:if>
   >주문번호</option>

        <option value="USER_ID" 
<c:if test="${keywordType == 'USER_ID'}">selected</c:if>
        >주문자ID</option>

        <option value="USER_NAME" 
<c:if test="${keywordType == 'USER_NAME'}">selected</c:if>
        >주문자이름</option>

        <option value="PRODUCT_ID" 
<c:if test="${keywordType == 'PRODUCT_ID'}">selected</c:if>
        >상품ID</option>

    </select>
    <input type ="text" class="search-field" id="search-input-text" placeholder="검색어를 입력하세요..."name="keyword" value="${ordersPagenation.keyword}" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit()}">
    <input type="button" value="검색" id="search">
</form> --%>

								<!-- 검색창 -->
								<%-- <div class="rs-select2--dark rs-select2--sm rs-select2--dark2">
									<select class="js-select2" name="type" id="orderby-status">

									</select>
									<div class="dropDownSelect2"></div>
								</div>
								<input type="hidden" value="${status}" id="status"> --%>
							</div>
						</div>

					</div>
					<div class="user-data m-b-30">
						<h3 class="title-3 m-b-30">
							<i class="zmdi zmdi-account-calendar"></i>관리자 주문상세내역
						</h3>
						<div class="table-responsive">
							<table class="table">
								<thead>
									<tr>
										<td>주문자ID</td>
										<td>주문자이름</td>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${getorders.USER_ID}</td>
										<td>${getorders.USER_NAME}</td>

									</tr>
								</tbody>
								<thead>
								<thead>
									<tr>
										<td>주문번호</td>
										<td>개수</td>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${getorders.ORDERS_NAME}</td>
										<td>${getorders.COUNT}</td>

									</tr>
								</tbody>
								<thead>
									<tr>
										<td>금액</td>
										<td>총금액</td>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${getorders.PRICE}</td>
										<td>${getorders.TOTAL_PRICE}</td>

									</tr>
								</tbody>
								<thead>
									<tr>
										<td>전화번호</td>
										<td>주소</td>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${getorders.PHONE}</td>
										<td>${getorders.FIR_ADDRESS}<br>${getorders.SEC_ADDRESS }</td>

									</tr>
								</tbody>
								<thead>
									<tr>
										<td>택배회사명</td>
										<td>운송장 번호</td>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${getorders.TRACKING_NAME}</td>
										<td>${getorders.TRACKING_NUMBER}</td>

									</tr>
								</tbody>
								<thead>
									<tr>
										<td>교환사유</td>
										<td>결제상태</td>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${getorders.EXCHANGE_MESSAGE}</td>
										<td>${getorders.STATUS}</td>

									</tr>
								</tbody>
							</table>
						</div>
						<div class="user-data__footer">
							<button class="au-btn au-btn-load"
								onclick="location.href='/rudisfarm/admin/admin-orders-manage'">목록으로</button>
						</div>


					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- END MAIN CONTENT-->
	<!-- END PAGE CONTAINER-->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/orders-js/orders-sort.js?v=<%=System.currentTimeMillis()%>"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/orders-js/orders-search.js?v=<%=System.currentTimeMillis()%>"></script>

	<!-- Jquery JS-->
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.js">
		
	</script>

	<!-- Main JS-->
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/js/main.js"></script>

</body>
</html>
