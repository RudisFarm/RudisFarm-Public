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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/table-responsive.css">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/page-number-url.js?v=<%=System.currentTimeMillis()%>"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/search.js?v=<%=System.currentTimeMillis()%>"></script>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
		function deleteOrders(orders_id){
			if(confirm("정말로 삭제 하시겠습니까?")) {
				$.ajax({
					type: 'delete',
					url: 'admin-orders-manage/'+orders_id, 
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					success: function(data) {
						if(data) {
							alert("성공적으로 삭제 되었습니다.");
							location.href = window.location.href;
						} else {
							alert("삭제에 실패하였습니다.");
						}
					},
					error: function(e) {
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
                		
                        <div class="row">
                            <div class="col-md-12">
								
                                <div class="row">
                                  <div class="col-sm-12 col-md-3 col-lg-3">
									<select class="form-control" name="property" id="orderby">
									</select>
									<div class="dropDownSelect2"></div>
									<input type="hidden" id="sort" value="${ordersPagenation.sort}">
								</div>
								
								<!-- 필터 ---------------------------------------->
								<%--                                         <input type="hidden" value="${ordersPagenation.sort}" id="sort"> --%>

								<%-- <div class="rs-select2--light rs-select2--sm">
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
							</div> --%>
							

									
								<!-- 검색창 ---------------------------------------->
								<div class="col-sm-12 col-md-9 col-lg-9">
					              <div class="row">
					              	<div class="col-4 pr-0">
									<select class="form-control" name="search_option" id="keywordType">
										<option value="ORDERS_NAME"
											<c:if test="${keywordType == 'ORDERS_NAME'}">selected</c:if>>주문번호</option>

										<option value="USER_ID"
											<c:if test="${keywordType == 'USER_ID'}">selected</c:if>>주문자ID</option>

										<option value="USER_NAME"
											<c:if test="${keywordType == 'USER_NAME'}">selected</c:if>>주문자이름</option>

										<option value="PRODUCT_ID"
											<c:if test="${keywordType == 'PRODUCT_ID'}">selected</c:if>>상품ID</option>

									</select> 
								</div>
								<div class="col-8 pl-0">
					              	<div class="input-group">
									<input type="text" class="form-control" id="search-input-text"
										placeholder="검색어"  name="keyword"
										value="${ordersPagenation.keyword}"
										onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit()}">
									<input type="button" class="btn btn-secondary" value="검색" id="search">
									</div>
								</div>
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
							</div>
						</div>
					  <div class = "table-desktop">
						<div class="table-responsive table-responsive-data2">
							<table class="table table-data2" style="text-align: center; word-break:keep-all;">
								<thead>
									<tr>
										<th>테이블번호</th>
										<th>주문번호</th>
										<th>주문자ID</th>
										<th>주문자이름</th>
										<th>전화번호</th>
										<th>상품명</th>
										<th>총가격</th>
										<th>주문시간</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${fn:length(ordersPagenation.ordersList) > 0}">
											<c:forEach var="orders"
												items="${ordersPagenation.ordersList}">
												<tr class="tr-shadow"
													onclick="location.href='/rudisfarm/admin/admin-orders-manage/${orders.ORDERS_ID}'"
													style="cursor: pointer;">
													<td class="color">${orders.ORDERS_ID}</td>
													<td>${orders.ORDERS_NAME}</td>
													<td class="desc">${orders.USER_ID}</td>
													<td>${orders.USER_NAME}</td>
													<td>${orders.PHONE}</td>
													<td>${orders.PRODUCT_ID}</td>
													<td>${orders.TOTAL_PRICE}</td>
													<td>${orders.ORDERSDATE}</td>
													<td>
														<div class="table-data-feature">
															<button class="item" data-toggle="tooltip" class="zmdi zmdi-delete"
																data-placement="top" title="삭제"
																onclick="deleteOrders(${orders.ORDERS_ID})">
																<i class="zmdi zmdi-delete"></i>
															</button>
														</div>
													</td>
												</tr>

												<tr class="spacer"></tr>
											</c:forEach>
										</c:when>

										<c:otherwise>

										</c:otherwise>
									</c:choose>

								</tbody>
							</table>
						</div>
					  </div>
					  
					  <div class = "table-mobile">
						<div class="table-responsive table-responsive-data2">
							<table class="table table-data2">
                                        <c:forEach var="orders" items="${ordersPagenation.ordersList}">
                                        <tbody>
                                            <tr class="tr-shadow" onclick="location.href='/rudisfarm/admin/admin-orders-manage/${orders.ORDERS_ID}'">
                                                <td>
                                                	테이블번호<br>
													주문번호<br>
													주문자ID<br>
													주문자이름<br>
													상품명<br>
													총가격<br>
													주문시간<br>
													전화번호<br>
													삭제<br>
                                               </td>
                                                <td>
	                                                <a style="color:blue;" href="/rudisfarm/admin/admin-orders-manage/${orders.ORDERS_ID}">${orders.ORDERS_ID}</a><br>
	                                                 <span class="desc">${orders.ORDERS_NAME}</span><br>
	                                                 <span class="status--process">${orders.USER_ID}</span><br>
	                                                ${orders.USER_NAME}<br>
	                                                 <span class="status--process">${orders.PRODUCT_ID}</span><br>
	                                                 <span class="status--process">${orders.TOTAL_PRICE}</span><br>
	                                                 <span class="status--process">${orders.ORDERSDATE}</span><br>
	                                                 <span class="block-email">${orders.PHONE}</span><br>
	                                                 <span><button class="item" data-toggle="tooltip" class="zmdi zmdi-delete" data-placement="top" title="삭제" onclick="deleteOrders(${orders.ORDERS_ID})">
																<i class="zmdi zmdi-delete"></i>
															</button></span><br>
                                                </td>
                                            </tr>

                                        </tbody>
                                 </c:forEach>
                            </table>
					  
					  

					  </div>
						<div class="row text-center p-3">
								<div style="float:none; margin:0 auto">
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
								</div>
							</div>
					</div>
				</div>
			
			
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>
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
