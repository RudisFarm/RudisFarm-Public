<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/bootstrap/images/favicon.ico"/>
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
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/table-responsive.css" type="text/css" media="all"/>
		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
	</head>
	<body>
	<jsp:include page="/resources/bootstrap/commons/menu_slideout.jsp" />
		<div class="site">
		<jsp:include page="/resources/bootstrap/commons/topbar.jsp" />
		<jsp:include page="/resources/bootstrap/commons/header.jsp" />
			<div id="main">
				<div class="section section-bg-10 pt-11 pb-17">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<h2 class="page-title text-center">Payment Complete</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li>Payment Success</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			  <div class="table-desktop">
				<div class="section pt-7 pb-7">
					<div class="container">
					  <div class="row" align="center">
					     <h1>결제가 완료되었습니다.</h1>
					  </div>
					   <div>&nbsp;</div>
						<div class="row">
							<div class="col-md-12">
								<div class="wishlist-wrap">
									<table class="table shop-cart">
										<thead>
											<tr class="cart_item" align="center">
												<td class="product-remove">&nbsp;</td>
												<td class="product-thumbnail">주문번호</td>
												<td class="product-info">상품명</td>
												<td class="product-subtotal">결제 총액</td>
												<td class="product-stock">결제 수단</td>
												<td>&nbsp;</td>
											</tr>
										</thead>
										<tbody>
											<tr class="cart_item" align="center">
												<td class="product-remove">&nbsp;</td>
												<td class="product-thumbnail">
													<span class="color">${info.tid}</span>
												</td>
												<td class="product-info">
													<a href="shop-detail.html">${info.item_name}</a>
													<span class="sub-title"><fmt:formatDate value="${info.approved_at}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
													<span class="amount">수량 ${info.quantity} 개</span>
												</td>
												<td class="product-subtotal">
													<span class="color">${info.amount.total}원</span>
												</td>
												<td class="product-stock">
													<span class="color">${info.payment_method_type}</span>
												</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div align="center">
									<a class="organik-btn small" href="/rudisfarm/my-page/orders"> 주문 목록 </a>&nbsp;
									<a class="organik-btn small" href="/rudisfarm/product"> 더 쇼핑하기 </a>&nbsp;
									<a class="organik-btn small" href="/rudisfarm"> 홈으로 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			  </div>
			  <div class="table-mobile">
				<div class="section pt-7 pb-7">
					<div class="container">
					  <div class="row" align="center">
					     <h4>결제가 완료되었습니다.</h4>
					  </div>
					   <div>&nbsp;</div>
						<div class="row">
							<div class="col-md-12">
								<div class="wishlist-wrap">
									<table class="table shop-cart">
										<thead>
											<tr class="cart_item" align="center">
												<td class="product-thumbnail">주문번호</td>
												<td class="product-info">상품명</td>
												<td class="product-subtotal">결제 총액</td>
												<td>&nbsp;</td>
											</tr>
										</thead>
										<tbody>
											<tr class="cart_item" align="center">
												<td class="product-thumbnail">
													<span class="color">BV210308162700561</span>
												</td>
												<td class="product-info">
													<a href="shop-detail.html">핵사과</a>
													<span class="sub-title">2008-12-25 08:26:33<fmt:formatDate value="${info.approved_at}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
													<span class="amount">수량 ${info.quantity} 개</span>
												</td>
												<td class="product-subtotal">
													<span class="color">${info.amount.total}원</span>
												</td>
												<td>&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div align="center">
									<a class="organik-btn small" href="/rudisfarm/my-page/orders"> 주문 목록 </a>&nbsp;
									<a class="organik-btn small" href="/rudisfarm/product"> 더 쇼핑하기 </a>&nbsp;
									<a class="organik-btn small" href="/rudisfarm"> 홈으로 </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			  </div>
			</div>
		</div>
		<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>

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