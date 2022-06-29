<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<title>Organik Shop &#8211; Wishlist | Organik HTML Template</title>

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
								<h2 class="page-title text-center">Wishlist</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li><a href="./">Home</a></li>
									<li><a href="shortcodes.html">Shop</a></li>
									<li>Wishlist</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="wishlist-wrap">
									<table class="table shop-cart">
										<thead>
											<tr class="cart_item">
												<td class="product-remove">&nbsp;</td>
												<td class="product-thumbnail">&nbsp;</td>
												<td class="product-info">제품명</td>
												<td class="product-subtotal">가격</td>
												<td class="product-stock">농장명</td>
												<td>&nbsp;</td>
											</tr>
										</thead>
										<tbody>
											<tr class="cart_item">
												<td class="product-remove">
													<a href="#" class="remove">×</a>
												</td>
												<td class="product-thumbnail">
													<a href="shop-detail.html">
														<img src="images/shop/shop_100x100.jpg" alt="">
													</a>
												</td>
												<td class="product-info">
													<a href="shop-detail.html">Black Hoodie</a>
													<span class="sub-title">Faucibus Tincidunt</span>
													<span class="amount">$2.00</span>
												</td>
												<td class="product-subtotal">
													<span class="amount">$2.00</span>
												</td>
												<td class="product-stock">
													<span class="color">In Stock</span>
												</td>
												<td>
													<a class="organik-btn small" href="#"> 리뷰 작성 </a>
												</td>
											</tr>
											<tr class="cart_item">
												<td class="product-remove">
													<a href="#" class="remove">×</a>
												</td>
												<td class="product-thumbnail">
													<a href="shop-detail.html">
														<img src="images/shop/shop_100x100.jpg" alt="">
													</a>
												</td>
												<td class="product-info">
													<a href="shop-detail.html">Redish Dress</a>
													<span class="sub-title">Consequat Quismassa</span>
													<span class="amount">$35.00</span>
												</td>
												<td class="product-subtotal">
													<span class="amount">$35.00</span>
												</td>
												<td class="product-stock">
													<span class="color">In Stock</span>
												</td>
												<td>
													<a class="organik-btn small" href="#"> 리뷰 작성 </a>
												</td>
											</tr>
											<tr class="cart_item">
												<td class="product-remove">
													<a href="#" class="remove">×</a>
												</td>
												<td class="product-thumbnail">
													<a href="shop-detail.html">
														<img src="images/shop/shop_100x100.jpg" alt="">
													</a>
												</td>
												<td class="product-info">
													<a href="shop-detail.html">Redish Dress</a>
													<span class="sub-title">Consequat Quismassa</span>
													<span class="amount">$35.00</span>
												</td>
												<td class="product-subtotal">
													<span class="amount">$35.00</span>
												</td>
												<td class="product-stock">
													<span class="color">In Stock</span>
												</td>
												<td>
													<a class="organik-btn small" href="#"> 리뷰 작성 </a>
												</td>
											</tr>
											<tr class="cart_item">
												<td class="product-remove">
													<a href="#" class="remove">×</a>
												</td>
												<td class="product-thumbnail">
													<a href="shop-detail.html">
														<img src="images/shop/shop_100x100.jpg" alt="">
													</a>
												</td>
												<td class="product-info">
													<a href="shop-detail.html">Redish Dress</a>
													<span class="sub-title">Consequat Quismassa</span>
													<span class="amount">$35.00</span>
												</td>
												<td class="product-subtotal">
													<span class="amount">$35.00</span>
												</td>
												<td class="product-stock">
													<span class="color">In Stock</span>
												</td>
												<td>
													<a class="organik-btn small" href="#"> 리뷰 작성 </a>
												</td>
											</tr>
											<tr class="cart_item">
												<td class="product-remove">
													<a href="#" class="remove">×</a>
												</td>
												<td class="product-thumbnail">
													<a href="shop-detail.html">
														<img src="images/shop/shop_100x100.jpg" alt="">
													</a>
												</td>
												<td class="product-info">
													<a href="shop-detail.html">Redish Dress</a>
													<span class="sub-title">Consequat Quismassa</span>
													<span class="amount">$35.00</span>
												</td>
												<td class="product-subtotal">
													<span class="amount">$35.00</span>
												</td>
												<td class="product-stock">
													<span class="color">In Stock</span>
												</td>
												<td>
													<a class="organik-btn small" href="#"> 리뷰 작성 </a>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
		</div>

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
