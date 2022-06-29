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
<title>Dashboard</title>

    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/table-responsive.css" type="text/css" media="all"/>

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
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/page-number-url.js?v=<%=System.currentTimeMillis()%>"></script>	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/cancelsearch.js?v=<%=System.currentTimeMillis()%>"></script>	
</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<jsp:include
			page="/resources/admin_bootstrap/commons/seller_header_mobile.jsp" />
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<jsp:include
			page="/resources/admin_bootstrap/commons/seller_sidebar.jsp" />
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include
				page="/resources/admin_bootstrap/commons/seller_header_desktop.jsp" />
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
			
			
			<div class = "table-desktop">데스크톱 테이블</div>
			<div class = "table-mobile">모바일 테이블</div>
			
			
			<div class = "table-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-t-30">
							<div class="col-md-12">
								<!-- DATA TABLE-->
								<div class="table-responsive m-b-40">
								
								<select id="orderby">
									
								</select>
								<input type="hidden" id="sort" value="${paymentPagenation.sort}">
								
								<input name = "searchKeyword" type ="text" id="search-input-text" onKeypress="javascript:if(event.keyCode==13) {cancelsearch_onclick_submit()}" value="${paymentPagenation.keyword}"/>
								<input type = "submit" value = "검색" id="cancelsearch"/>

								    <form action="getSearchCancelPaymentList" method="post">
									<br>
									<br>
									<br>
									<br>
									<br>
									<h3>결제 취소 내역</h3>
									<br>
										<div class="table-responsive table-responsive-data2">
	                                    <table class="table table-data2">
	                                        <thead>
	                                            <tr>
                                               		<th>STATUS</th>
													<th>PARTNER_ORDER_ID</th>
													<th>PARTNER_USER_ID</th>
													<th>ITEM_NAME</th>
													<th>TOTAL_AMOUNT</th>
													<th>PAYMENT_METHOD_TYPE</th>
													<th>APPROVED_AT</th>
	                                            </tr>
	                                        </thead>
	                                        <c:forEach var="AdminPaymentCancelList" items="${paymentPagenation.paymentCancelList}">
	                                        <tbody>
	                                            <tr class="tr-shadow">
	                                                <td>${AdminPaymentCancelList.STATUS}</td>
	                                                <td>
	                                                    <span class="block-email">${AdminPaymentCancelList.PARTNER_ORDER_ID}</span>
	                                                </td>
	                                                <td class="desc">${AdminPaymentCancelList.PARTNER_USER_ID}</td>
	                                                <td>
	                                                    <span class="status--process">${AdminPaymentCancelList.ITEM_NAME}</span>
	                                                </td>
	                                                <td>${AdminPaymentCancelList.TOTAL_AMOUNT}</td>
	                                                <td>${AdminPaymentCancelList.PAYMENT_METHOD_TYPE}</td>
													<td>${AdminPaymentCancelList.APPROVED_AT}</td>
	                                            </tr>
	
	                                        </tbody>
	                                        </c:forEach>
	                                    </table>
	                                </div>
								</form>
								<br>
								<ul class="pagination">
										<c:choose>
											<c:when test="${fn:length(paymentPagenation.paymentList) > 0}">
											<c:choose>
												<c:when test="${paymentPagenation.page <= 1}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="javascript:void(0)" onClick="pageUrl(${paymentPagenation.page-1})">이전</a></li>
												</c:otherwise>
											</c:choose>
											
											<c:forEach var="startNum" begin="${paymentPagenation.startPage}" end="${paymentPagenation.endPage}">
												<c:choose>
													<c:when test="${startNum eq paymentPagenation.page}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="javascript:void(0)" onClick="pageUrl(${startNum})">${startNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											
											<c:choose>
												<c:when test="${paymentPagenation.page ge paymentPagenation.maxPage}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="javascript:void(0)" onClick="pageUrl(${paymentPagenation.page+1})">다음</a>
												</c:otherwise>
											</c:choose>
										</c:when>
											<c:otherwise>
												
											</c:otherwise>
										</c:choose>
								    </ul>

								</div>
								<!-- END DATA TABLE-->
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			<div class = "table-mobile">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-t-30">
							<div class="col-md-12">
								<!-- DATA TABLE-->
								<div class="table-responsive m-b-40">
								
								<select id="orderby">
									
								</select>
								<input type="hidden" id="sort" value="${paymentPagenation.sort}">
								
								<input name = "searchKeyword" type ="text" id="search-input-text" onKeypress="javascript:if(event.keyCode==13) {cancelsearch_onclick_submit()}" value="${paymentPagenation.keyword}"/>
								<input type = "submit" value = "검색" id="cancelsearch"/>

								    <form action="getSearchCancelPaymentList" method="post">
									<br>
									<br>
									<br>
									<br>
									<br>
									<h3>결제 취소 내역</h3>
									<br>
										<div class="table-responsive table-responsive-data2">
	                                    <table class="table table-data2">
	                                    	<c:forEach var="AdminPaymentCancelList" items="${paymentPagenation.paymentCancelList}">
		                                       <tbody>
		                                         <tr class="tr-shadow">
	                                                <td>
	                                                	STATUS
	                                                    PARTNER_ORDER_ID 
	                                                	PARTNER_USER_ID
	                                                	ITEM_NAME
	                                                	TOTAL_AMOUNT
	                                                	PAYMENT_METHOD_TYPE
	                                                	APPROVED_AT
	                                               </td>
	                                                <td>
		                                                ${AdminPaymentCancelList.STATUS}<br>
		                                                <span class="block-email">${AdminPaymentCancelList.PARTNER_ORDER_ID}</span><br>
		                                                <span class="desc">${AdminPaymentCancelList.PARTNER_USER_ID}</span><br>
		                                                <span class="desc">${AdminPaymentCancelList.ITEM_NAME}</span><br>
		                                                <span class="status--process">${AdminPaymentCancelList.TOTAL_AMOUNT}</span><br>
		                                                ${AdminPaymentCancelList.PAYMENT_METHOD_TYPE}
		                                                ${AdminPaymentCancelList.APPROVED_AT}
	                                                </td>
		                                       
		                                       	</tr>
 												</tbody>
	                                        </c:forEach>
	                                    </table>
	                                </div>
								</form>
								<br>
								<ul class="pagination">
										<c:choose>
											<c:when test="${fn:length(paymentPagenation.paymentList) > 0}">
											<c:choose>
												<c:when test="${paymentPagenation.page <= 1}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="javascript:void(0)" onClick="pageUrl(${paymentPagenation.page-1})">이전</a></li>
												</c:otherwise>
											</c:choose>
											
											<c:forEach var="startNum" begin="${paymentPagenation.startPage}" end="${paymentPagenation.endPage}">
												<c:choose>
													<c:when test="${startNum eq paymentPagenation.page}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="javascript:void(0)" onClick="pageUrl(${startNum})">${startNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											
											<c:choose>
												<c:when test="${paymentPagenation.page ge paymentPagenation.maxPage}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="javascript:void(0)" onClick="pageUrl(${paymentPagenation.page+1})">다음</a>
												</c:otherwise>
											</c:choose>
										</c:when>

										</c:choose>
								    </ul>

								</div>
								<!-- END DATA TABLE-->
							</div>
						</div>
					</div>
					</div>
				</div>
				
				

			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>

	</div>
	
<!--  	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/sort-payment.js?v=<%=System.currentTimeMillis()%>"></script>	-->
	
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
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
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