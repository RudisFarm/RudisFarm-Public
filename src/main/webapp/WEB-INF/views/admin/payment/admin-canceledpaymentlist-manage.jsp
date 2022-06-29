<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<title>완료된 결제 목록</title>
	
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
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/table-responsive.css" type="text/css" media="all"/>

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/adminsearch.js?v=<%=System.currentTimeMillis()%>"></script>	
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
						<!-- <p id="abb">hi</p> -->
						<div class="table-responsive m-b-40">
							
							<h2>결제취소 내역</h2>
							<span style="float:none;">
							<select name="searchCondition" id="keywordType">
								<c:forEach items="${conditionMap}" var="option">
									<option value="${option.value}" <c:if test="${option.value eq paymentPagenation.keywordType}">selected="selected"</c:if>>${option.key}</option>
								</c:forEach>
							</select> 
							<input type="hidden" id="keywordTypeHidden" value="${paymentPagenation.keywordType}"> 
							
							<input name="searchKeyword" type="text" id="search-input-text" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit()}" value="${paymentPagenation.keyword}" /> 
							<input type="submit"value="검색" id="adminsearch"/>
							</span>
							
							<form action="getSearchPaymentList" method="post">
<!-- 							<div class="table-desktop">데스크톱 테이블</div> -->
<!-- 							<div class="table-mobile">모바일 테이블</div> -->
							 <div class="table-desktop">
								<table class="table table-borderless table-data3" style="word-break:keep-all;">
									<thead>
										<tr>
											<th>TID</th>
											<th>AID</th>
											<th>결제 상태</th>
											<th>주문 번호</th>
											<th>주문자ID</th>
											<th>상품명</th>
											<th>수량</th>
											<th>결제총액</th>
											<th>비과세</th>
											<th>결제수단</th>
											<th>취소총액</th>
											<th>결제시각</th>
										</tr>
									</thead>
									<c:forEach var="superAdminCancelPaymentList" items="${paymentPagenation.superAdminCancelPaymentList}">
										<tbody>
											<tr>
												<td>${superAdminCancelPaymentList.TID}</td>
												<td>${superAdminCancelPaymentList.AID}</td>
												<td>${superAdminCancelPaymentList.STATUS}</td>
												<td>${superAdminCancelPaymentList.PARTNER_ORDER_ID}</td>
												<td>${superAdminCancelPaymentList.PARTNER_USER_ID}</td>
												<td>${superAdminCancelPaymentList.ITEM_NAME}</td>
												<td>${superAdminCancelPaymentList.QUANTITY}</td>
												<td>${superAdminCancelPaymentList.TOTAL_AMOUNT}</td>
												<td>${superAdminCancelPaymentList.VAT_AMOUNT}</td>
												<td>${superAdminCancelPaymentList.PAYMENT_METHOD_TYPE}</td>
												<td>${superAdminCancelPaymentList.CANCEL_AMOUNT}</td>
												<td>${superAdminCancelPaymentList.APPROVED_AT}</td>
											</tr>
										</tbody>
									</c:forEach>
								</table>
								</div>
								<div class="table-mobile">
								<table class="table table-borderless table-data3" style="word-break:keep-all;">
									<c:forEach var="superAdminCancelPaymentList" items="${paymentPagenation.superAdminCancelPaymentList}">
									<thead>
										<tr>
											<th>결제내역</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr>
										 <td>
											주문 번호<br>
											결제 상태<br>
											주문자ID<br>
											상품명<br>
											수량<br>
											결제총액<br>
											취소총액<br>
											결제시각<br>
										  </td>
										  <td>
										  	${superAdminCancelPaymentList.PARTNER_ORDER_ID}<br>
											${superAdminCancelPaymentList.STATUS}<br>
											${superAdminCancelPaymentList.PARTNER_USER_ID}<br>
											${superAdminCancelPaymentList.ITEM_NAME}<br>
											${superAdminCancelPaymentList.QUANTITY}<br>
											${superAdminCancelPaymentList.TOTAL_AMOUNT}<br>
											${superAdminCancelPaymentList.CANCEL_AMOUNT}<br>
											${superAdminCancelPaymentList.APPROVED_AT}<br>
										  </td>
										</tr>
									</tbody>
								  </c:forEach>
								</table>
							  </div>
							</form>
<!-- 						<button id="addBtn" onclick="paging();"> -->
<!-- 							<span>더보기</span> -->
<!-- 						</button> -->
						</div>
							<div style="margin-left: 500px">
								<ul class="pagination">
									<c:choose>
										<c:when test="${fn:length(paymentPagenation.superAdminPaymentList) > 0}">
										<c:choose>
											<c:when test="${paymentPagenation.page <= 1}">
												<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-paymentlist-manage?page=${paymentPagenation.page-1}&keyword=${paymentPagenation.keyword}">이전</a></li>
											</c:otherwise>
										</c:choose>
										
										<c:forEach var="startNum" begin="${paymentPagenation.startPage}" end="${paymentPagenation.endPage}">
											<c:choose>
												<c:when test="${startNum eq paymentPagenation.page}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-paymentlist-manage?page=${startNum}&keyword=${paymentPagenation.keyword}">${startNum}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<c:choose>
											<c:when test="${paymentPagenation.page ge paymentPagenation.maxPage}">
												<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-paymentlist-manage?page=${paymentPagenation.page+1}&keyword=${paymentPagenation.keyword}">다음</a>
											</c:otherwise>
										</c:choose>
									</c:when>
										<c:otherwise>
											
										</c:otherwise>
									</c:choose>
							    </ul>
							</div>
						  </div>
						</div>
					<!-- END MAIN CONTENT-->
					<!-- END PAGE CONTAINER-->
				</div>
			  </div>
			</div>
	<script type="text/javascript">
	$(function() {
// 		$("#keywordType").val($('#keywordTypeHidden').val).prop("selected", true);
	})
	</script>
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