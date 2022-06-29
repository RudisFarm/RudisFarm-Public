<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
<link rel="shortcut icon" href="images/favicon.ico" />
<title>장바구니</title>


<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css"
	media="all">
<link
	href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
			<script
		src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery-migrate.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/bootstrap/js/owl.carousel.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.countdown.min.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.js"></script>
	<script
		src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js"></script>
	<script src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
		
<script type="text/javascript">
	function click_count(cartid){
		var price = $("#price" + cartid).val();
		var num =$("#qtyN" + cartid).val();
		var pay = 0;
	 	pay =  price * num;
	 	var payType = pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 	
	 	intNum = parseInt(num)
	 	console.log(cartid);
		
	 	$("#pay"+cartid).val(payType + "원");
		$.ajax({
			type : 'PUT',         
			url: '${pageContext.request.contextPath}/my-page/my-cart', 
			dataType: 'json',
			contentType: 'application/json; charset=utf-8;',
			data : JSON.stringify({
				CART_ID : cartid, 
				COUNT : intNum
			
			}),
			
			success : function(data) {
				console.log("수신 성공");
				console.log(data);
				$('#total').val(data.sumMoneyF+"원");
				$('#pass').val(data.fee+"원");
				$('#totalPay').val(data.sumF+"원");
				
				
			},
			error: function(data) {
				console.log("에러 발생!");
				console.log(data)
				
			}
		});
	}
	
	function click_delete(cartid){
		$.ajax({
			type : 'DELETE',         
			url: '${pageContext.request.contextPath}/my-page/my-cart', 
			dataType: 'json',
			contentType: 'application/json; charset=utf-8;',
			data : JSON.stringify({
				CART_ID : cartid
			
			}),
			
			success : function(data) {
				console.log("수신 성공");
				console.log(data);
				location.reload();				
				
			},
			error: function(data) {
				console.log("에러 발생!");
				console.log(data)
			}
		});
		
	}
</script>
</head>
<body>
	<div class="noo-spinner">
		<div class="spinner">
			<div class="cube1"></div>
			<div class="cube2"></div>
		</div>
	</div>
	<div id="menu-slideout" class="slideout-menu hidden-md-up">
		<div class="mobile-menu">
			<ul id="mobile-menu" class="menu">
				<li class="dropdown"><a href="#">Home</a> <i
					class="sub-menu-toggle fa fa-angle-down"></i>
					<ul class="sub-menu">
						<li><a href="./">Organik Main</a></li>
						<li><a href="index-fresh.html">Organik Fresh</a></li>
						<li><a href="index-shop.html">Organik Shop</a></li>
						<li><a href="index-store.html">Organik Store</a></li>
						<li><a href="index-farm.html">Organik Farm</a></li>
						<li><a href="index-house.html">Organik House</a></li>
					</ul></li>
				<li class="dropdown"><a href="#">Pages</a> <i
					class="sub-menu-toggle fa fa-angle-down"></i>
					<ul class="sub-menu">
						<li class="dropdown"><a href="#">About Us</a> <i
							class="sub-menu-toggle fa fa-angle-down"></i>
							<ul class="sub-menu">
								<li><a href="about-us.html">About us 01</a></li>
								<li><a href="about-us-2.html">About us 02</a></li>
							</ul></li>
						<li><a href="gallery-freestyle.html">Gallery Freestyle</a></li>
						<li><a href="gallery-grid.html">Gallery Grid</a></li>
						<li><a href="404.html">404</a></li>
					</ul></li>
				<li><a href="shortcodes.html">Shortcodes</a></li>
				<li class="dropdown"><a href="#">Shop</a> <i
					class="sub-menu-toggle fa fa-angle-down"></i>
					<ul class="sub-menu">
						<li><a href="my-account.html">My Account</a></li>
						<li><a href="cart-empty.html">Empty Cart</a></li>
						<li class="active"><a href="cart.html">Cart</a></li>
						<li><a href="checkout.html">Check Out</a></li>
						<li><a href="wishlist.html">Wishlist</a></li>
						<li><a href="shop.html">Shop</a></li>
						<li><a href="shop-list.html">Shop List</a></li>
						<li><a href="shop-detail.html">Single Product</a></li>
					</ul></li>
				<li class="dropdown"><a href="#">Blog</a> <i
					class="sub-menu-toggle fa fa-angle-down"></i>
					<ul class="sub-menu">
						<li><a href="blog.html">Blog List</a></li>
						<li><a href="blog-classic.html">Blog Classic</a></li>
						<li><a href="blog-masonry.html">Blog Masonry</a></li>
						<li><a href="blog-detail.html">Blog Single</a></li>
					</ul></li>
				<li><a href="contact-us.html">Contact</a></li>
			</ul>
		</div>
	</div>
	<div class="site">
		<div class="topbar">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="topbar-text">
							<span>Work time: Monday - Friday: 08AM-06PM</span> <span>Saturday
								- Sunday: 10AM-06PM</span>
						</div>
					</div>
					<div class="col-md-6">
						<div class="topbar-menu">
							<ul class="topbar-menu">
								<li class="dropdown"><a href="#">Languages</a>
									<ul class="sub-menu">
										<li><a href="#">English</a></li>
										<li><a href="#">Français</a></li>
									</ul></li>
								<li><a href="#">Login</a></li>
								<li><a href="#">Register</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/resources/bootstrap/commons/index_header.jsp"/>
		<header class="header header-mobile">
			<div class="container">
				<div class="row">
					<div class="col-xs-2">
						<div class="header-left">
							<div id="open-left">
								<i class="ion-navicon"></i>
							</div>
						</div>
					</div>
					<div class="col-xs-8">
						<div class="header-center">
							<a href="./" id="logo-2"> <img class="logo-image"
								src="images/logo.png" alt="Organik Logo" />
							</a>
						</div>
					</div>
					<div class="col-xs-2">
						<div class="header-right">
							<div class="mini-cart-wrap">
								<a href="cart.html">
									<div class="mini-cart">
										<div class="mini-cart-icon" data-count="2">
											<i class="ion-bag"></i>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
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
								<tbody id="newList">
									<c:forEach var="cart" items="${map.list}">
										<tr class="cart_item">
											<td class="product-remove"><a href="#" class="remove" onclick="click_delete(${cart.CART_ID})">×</a>
											</td>
											<td class="product-thumbnail"><a href="shop-detail.html">
													<img src="<%= request.getContextPath() %>/images/shop/${cart.SUMNAIL}"
													alt="${cart.SUMNAIL}">
											</a></td>
											<td class="product-info"><a href="shop-detail.html">${cart.NAME}</a>
												<span class="amount"><fmt:formatNumber
														 value="${cart.PRICE}" pattern="#,###,###원" /></span>
												<input id="price${cart.CART_ID}" type="hidden" name="price" value="${cart.PRICE}">
											</td>
											<td class="product-quantity">
												<div class="quantity">
													<input id="qtyN${cart.CART_ID}" type="number" min="0" name="number" onclick="click_count(${cart.CART_ID})"
														value="${cart.COUNT}" class="input-text qty text" size="4">
													<input id="cartid" type="hidden" name="cart_id" value="${cart.CART_ID}">
												</div>
											</td>
											<td class="product-subtotal"><strong><span class="amount"><input id="pay${cart.CART_ID}" type="text" 
											style = "text-align:right; border: none; font-size: 20px;" value="<fmt:formatNumber value="${cart.PAY}" pattern="#,###,###원" />" ></span></strong></td>
										</tr>
									</c:forEach>
									<tr>
										<td colspan="5" class="actions"><a
											class="continue-shopping" href="#"> Continue Shopping</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="col-md-4">
							<div class="cart-totals">
								<table>
									<tbody>
										<tr class="cart-subtotal">
											<th>총 상품가격</th>
											<td><input type="text" style = "text-align:right; background-color:#222; border: none; color:white;" value="<fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###원" />" id="total" readonly></td>
													
										</tr>
										<tr class="shipping">
											<th>배 송 료</th>
											<td><input type="text" style = "text-align:right; background-color:#222; border: none; color:white;" value="<fmt:formatNumber value="${map.fee}" pattern="#,###,###원" />" id="pass" readonly></td>
										</tr>
										<tr class="order-total">
											<th>총 주문금액</th>
											<td><strong><input type="text" style = "text-align:right; background-color:#222; border: none; color:white;" value="<fmt:formatNumber value="${map.sum}" pattern="#,###,###원" />" id="totalPay" readonly></strong></td>
											
										</tr>
									</tbody>
								</table>
								<div class="proceed-to-checkout">
									<a href="#">Proceed to Checkout</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-5">
						<img src="resources/images/footer_logo.png" class="footer-logo"
							alt="" />
						<p>Welcome to Organik. Our products are freshly harvested,
							washed ready for box and finally delivered from our family farm
							right to your doorstep.</p>
						<div class="footer-social">
							<a href="#" data-toggle="tooltip" data-placement="top"
								title="Facebook"><i class="fa fa-facebook"></i></a> <a href="#"
								data-toggle="tooltip" data-placement="top" title="Twitter"><i
								class="fa fa-twitter"></i></a> <a href="#" data-toggle="tooltip"
								data-placement="top" title="Pinterest"><i
								class="fa fa-pinterest"></i></a> <a href="#" data-toggle="tooltip"
								data-placement="top" title="Instagram"><i
								class="fa fa-instagram"></i></a>
						</div>
					</div>
					<div class="col-md-2">
						<div class="widget">
							<h3 class="widget-title">Infomation</h3>
							<ul>
								<li><a href="#">New Products</a></li>
								<li><a href="#">Top Sellers</a></li>
								<li><a href="#">Our Blog</a></li>
								<li><a href="#">About Our Shop</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-2">
						<div class="widget">
							<h3 class="widget-title">Useful Link</h3>
							<ul>
								<li><a href="#">Our Team</a></li>
								<li><a href="#">Our Blog</a></li>
								<li><a href="#">About Us</a></li>
								<li><a href="#">Secure Shopping</a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3">
						<div class="widget">
							<h3 class="widget-title">Subscribe</h3>
							<p>Enter your email address for our mailing list to keep
								yourself updated.</p>
							<form class="newsletter">
								<input type="email" name="EMAIL"
									placeholder="Your email address" required="" />
								<button>
									<i class="fa fa-paper-plane"></i>
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						Copyright © 2017 <a href="#">Organic Store</a> - All Rights
						Reserved.
					</div>
					<div class="col-md-4">
						<img src="images/footer_payment.png" alt="" />
					</div>
				</div>
			</div>
			<div class="backtotop" id="backtotop"></div>
		</div>
	</div>
</body>
</html>