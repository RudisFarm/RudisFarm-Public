<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<title>RudisFarm 결제 완료</title>

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
		<link rel='stylesheet' href='<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css' type='text/css' media='all'/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
		<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/table-responsive.css" type="text/css" media="all"/>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/page-number-url.js?v=<%=System.currentTimeMillis()%>"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/search.js?v=<%=System.currentTimeMillis()%>"></script>
	</head>
	<body>
	<jsp:include page="/resources/bootstrap/commons/mobile_menu.jsp"/>
		<div class="site">
		<jsp:include page="/resources/bootstrap/commons/header.jsp"/>
			<div id="main">
				<div class="section section-bg-10 pt-11 pb-17">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<h2 class="page-title text-center">Payment List</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li>Payment List</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="table-desktop">데스크톱 테이블</div>
				<div class="table-mobile">모바일 테이블</div>
				<div class="table-desktop">
				 	<div class="section pt-7 pb-7">
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="wishlist-wrap">
										<table class="table shop-cart">
											<thead>				
												<tr class="cart_item" align="center">
													<td class="product-info">상품 아이디</td>
													<td class="product-info">상품명</td>
													<td class="product-info">수량</td>
													<td class="product-info">결제 금액</td>
													<td class="product-info">결제 상태</td>
													<td class="product-info">결제 시각</td>
												</tr>
											</thead>
									  		<c:forEach var="payment" items="${paymentPagenation.paymentList}">
											<tbody>
												<tr class="cart_item" align="center">
													<td class="product-info">
														<a href="/rudisfarm/my-page/payment/${payment.PARTNER_ORDER_ID}"><span class="color">${payment.PARTNER_ORDER_ID}</span></a>
													</td>
													<td class="product-info">
														<span>${payment.ITEM_NAME}</span>
													</td>
													<td class="product-info">
														<span>${payment.QUANTITY}</span>
													</td>
													<td class="product-info">
														<span>${payment.TOTAL_AMOUNT}</span>
													</td>
													<td class="product-info">
														<span>${payment.STATUS}</span>
													</td>
													<td class="product-info">
														<span><fmt:formatDate value="${payment.APPROVED_AT}" pattern="yy-MM-dd HH:mm"/></span>
													</td>
												</tr>
											</tbody>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
							<!-- 페이징 -->
							<ul class="pagination">
										<c:choose>
											<c:when test="${fn:length(paymentPagenation.paymentList) > 0}">
											<c:choose>
												<c:when test="${paymentPagenation.page <= 1}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="/rudisfarm/my-page/payment?page=${paymentPagenation.page-1}">이전</a></li>
												</c:otherwise>
											</c:choose>
											
											<c:forEach var="startNum" begin="${paymentPagenation.startPage}" end="${paymentPagenation.endPage}">
												<c:choose>
													<c:when test="${startNum eq paymentPagenation.page}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
													</c:when>
													<c:otherwise>
														 <li class="page-item"><a class="page-link" href="/rudisfarm/my-page/payment?page=${startNum}">${startNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											
											<c:choose>
												<c:when test="${paymentPagenation.page ge paymentPagenation.maxPage}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="/rudisfarm/payment/payment?page=${paymentPagenation.page+1}">다음</a>
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
		 		<div class="table-mobile">
		 			<div class="section pt-7 pb-7">
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="wishlist-wrap">
									<h3 style="text-align: center;">결제 내역</h3>
										<table class="table shop-cart">
										<c:forEach var="payment" items="${paymentPagenation.paymentList}">
												<tr class="cart_item">
													<td class="product-info">
													  <div class="row p-3">
														<p style="font-size: 25px" class="col-p3">주문 내역</p>
														<div class="color col-p3">${payment.PARTNER_ORDER_ID}</div>
														<div class="product-info col-p3">${payment.ITEM_NAME}</div>
														<div class="sub-title col-p3"><fmt:formatDate value="${payment.APPROVED_AT}" pattern="yy-MM-dd HH:mm"/></div>
														<div class="amount col-p3">${payment.TOTAL_AMOUNT}원</div>
														<div class="amount col-p3">${payment.QUANTITY}개</div>
														<div class="color col-p3">${payment.STATUS}</div>
														<button>홈으로</button>&nbsp;<button>결제 취소하기</button>
													  </div>
													</td>
												</tr>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
				 	</div>
		 		</div>
			</div>
			<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
		</div>

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/add-cart.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/categori-header.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/cart-list.js"></script>

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery-migrate.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/owl.carousel.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.countdown.min.js"></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.js'></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js'></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
	</body>
</html>