<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<title>Organik Shop &#8211; Empty Cart | Organik HTML Template</title>

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
								<h2 class="page-title text-center">Cart</h2>
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
									<li>Cart</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row">
							<div class="col-md-8">
								<table class="table shop-cart">
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
											<td class="product-quantity">
												<div class="quantity">
													<input id="qty-1" type="number" min="0" name="number" value="1" class="input-text qty text" size="4">
												</div>
											</td>
											<td class="product-subtotal">
												<span class="amount">$2.00</span>
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
											<td class="product-quantity">
												<div class="quantity">
													<input id="qty-2" type="number" min="0" name="number" value="1" class="input-text qty text" size="4">
												</div>
											</td>
											<td class="product-subtotal">
												<span class="amount">$35.00</span>
											</td>
										</tr>
										<tr>
											<td colspan="5" class="actions">
												<a class="continue-shopping" href="#"> Continue Shopping</a>
												<input type="submit" class="update-cart" name="update_cart" value="Update Cart" />
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-md-4">
								<div class="cart-totals">
									<table>
										<tbody>
											<tr class="cart-subtotal">
												<th>Subtotal</th>
												<td>$116.00</td>
											</tr>
											<tr class="shipping">
												<th>Shipping</th>
												<td>Free Shipping</td>
											</tr>
											<tr class="order-total">
												<th>Total</th>
												<td><strong>$146.00</strong></td>
											</tr>
										</tbody>
									</table>
									<div class="proceed-to-checkout">
										<a href="#">Proceed to Checkout</a>
									</div>
								</div>
								<div class="coupon-shipping">
									<div class="coupon">
										<form>
											<input type="text" name="coupon_code" class="coupon-code" id="coupon_code" value="" placeholder="Coupon code" />
											<input type="submit" class="apply-coupon" name="apply_coupon" value="Apply Coupon" />
										</form>
									</div>
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