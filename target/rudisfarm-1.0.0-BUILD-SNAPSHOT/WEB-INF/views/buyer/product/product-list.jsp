img.width = 250;<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<title>Organik Shop &#8211; Shop | Organik HTML Template</title>

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
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/category.js?v=<%=System.currentTimeMillis()%>"></script>		
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/tagcloud.js?v=<%=System.currentTimeMillis()%>"></script>		
 		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/product-list-widget.js?v=<%=System.currentTimeMillis()%>"></script>  
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/search.js?v=<%=System.currentTimeMillis()%>"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/page-number-url.js?v=<%=System.currentTimeMillis()%>"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/sort.js?v=<%=System.currentTimeMillis()%>"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/category-carousel.js?v=<%=System.currentTimeMillis()%>"></script>	
		<style type="text/css">

		</style>
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
					<li class="dropdown">
						<a href="#">Home</a>
						<i class="sub-menu-toggle fa fa-angle-down"></i>
						<ul class="sub-menu">
							<li><a href="./">Organik Main</a></li>
							<li><a href="index-fresh.html">Organik Fresh</a></li>
							<li><a href="index-shop.html">Organik Shop</a></li>
							<li><a href="index-store.html">Organik Store</a></li>
							<li><a href="index-farm.html">Organik Farm</a></li>
							<li><a href="index-house.html">Organik House</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#">Pages</a>
						<i class="sub-menu-toggle fa fa-angle-down"></i>
						<ul class="sub-menu">
							<li class="dropdown">
								<a href="#">About Us</a>
								<i class="sub-menu-toggle fa fa-angle-down"></i>
								<ul class="sub-menu">
									<li><a href="about-us.html">About us 01</a></li>
									<li><a href="about-us-2.html">About us 02</a></li>
								</ul>
							</li>
							<li><a href="gallery-freestyle.html">Gallery Freestyle</a></li>
							<li><a href="gallery-grid.html">Gallery Grid</a></li>
							<li><a href="404.html">404</a></li>
						</ul>
					</li>
					<li>
						<a href="shortcodes.html">Shortcodes</a>
					</li>
					<li class="dropdown">
						<a href="#">Shop</a>
						<i class="sub-menu-toggle fa fa-angle-down"></i>
						<ul class="sub-menu">
							<li><a href="my-account.html">My Account</a></li>
							<li><a href="cart-empty.html">Empty Cart</a></li>
							<li><a href="cart.html">Cart</a></li>
							<li><a href="checkout.html">Check Out</a></li>
							<li><a href="wishlist.html">Wishlist</a></li>
							<li class="active"><a href="shop.html">Shop</a></li>
							<li><a href="shop-list.html">Shop List</a></li>
							<li><a href="shop-detail.html">Single Product</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#">Blog</a>
						<i class="sub-menu-toggle fa fa-angle-down"></i>
						<ul class="sub-menu">
							<li><a href="blog.html">Blog List</a></li>
							<li><a href="blog-classic.html">Blog Classic</a></li>
							<li><a href="blog-masonry.html">Blog Masonry</a></li>
							<li><a href="blog-detail.html">Blog Single</a></li>
						</ul>
					</li>
					<li>
						<a href="contact-us.html">Contact</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="site">
			<div class="topbar">
				<div class="container">
					<div class="row">
						<div class="col-md-6">
							<div class="topbar-text">
								<span>Work time: Monday - Friday: 08AM-06PM</span> 
								<span>Saturday - Sunday: 10AM-06PM</span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="topbar-menu">
								<ul class="topbar-menu">
									<li class="dropdown">
										<a href="#">Languages</a>
										<ul class="sub-menu">
											<li><a href="#">English</a></li>
											<li><a href="#">Français</a></li>
										</ul>
									</li>
									<li><a href="#">Login</a></li>
									<li><a href="#">Register</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<header id="header" class="header header-desktop header-2">
				<div class="top-search">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<form>
									<input type="search" class="top-search-input" name="s" placeholder="What are you looking for?" />
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-3">
							<a href="./" id="logo">
								<img class="logo-image" src="images/logo.png" alt="Organik Logo" />
							</a>
						</div>
						<div class="col-md-9">
							<div class="header-right">
								<nav class="menu">
									<ul class="main-menu">
										<li class="dropdown">
											<a href="#">Home</a>
											<ul class="sub-menu">
												<li><a href="./">Organik Main</a></li>
												<li><a href="index-fresh.html">Organik Fresh</a></li>
												<li><a href="index-shop.html">Organik Shop</a></li>
												<li><a href="index-store.html">Organik Store</a></li>
												<li><a href="index-farm.html">Organik Farm</a></li>
												<li><a href="index-house.html">Organik House</a></li>
											</ul>
										</li>
										<li class="dropdown">
											<a href="#">Pages</a>
											<ul class="sub-menu">
												<li class="menu-item-has-children">
													<a href="#">About Us</a>
													<ul class="sub-menu">
														<li><a href="about-us.html">About us 01</a></li>
														<li><a href="about-us-2.html">About us 02</a></li>
													</ul>
												</li>
												<li><a href="gallery-freestyle.html">Gallery Freestyle</a></li>
												<li><a href="gallery-grid.html">Gallery Grid</a></li>
												<li><a href="404.html">404</a></li>
											</ul>
										</li>
										<li>
											<a href="shortcodes.html">Shortcodes</a>
										</li>
										<li class="dropdown mega-menu active">
											<a href="#">Shop</a>
											<ul class="sub-menu">
												<li>
													<div class="mega-menu-content">
														<div class="row">
															<div class="col-sm-3">
																<div class="pt-4 pb-4">
																	<h3>Shop Pages</h3>
																	<ul>
																		<li><a href="my-account.html">My Account</a></li>
																		<li><a href="cart-empty.html">Empty Cart</a></li>
																		<li><a href="cart.html">Cart</a></li>
																		<li><a href="checkout.html">Check Out</a></li>
																		<li><a href="wishlist.html">Wishlist</a></li>
																		<li><a href="shop.html">Shop</a></li>
																		<li><a href="shop-list.html">Shop List</a></li>
																		<li><a href="shop-detail.html">Single Product</a></li>
																	</ul>
																</div>
															</div>
															<div class="col-sm-2">
																<div class="pt-4 pb-4">
																	<h3>Fruits</h3>
																	<ul>
																		<li><a href="#">Seville Orange</a></li>
																		<li><a href="#">Aurore Grape</a></li>
																		<li><a href="#">Tieton Cherry</a></li>
																		<li class="new"><a href="#">Tomato Juice</a></li>
																		<li><a href="#">Cauliflower</a></li>
																	</ul>
																</div>
															</div>
															<div class="col-sm-2">
																<div class="pt-4 pb-4">
																	<h3>Featured</h3>
																	<ul>
																		<li><a href="#">Sprouting Broccoli</a></li>
																		<li class="sale"><a href="#">Chinese Cabbage</a></li>
																		<li><a href="#">Cara Orange</a></li>
																		<li><a href="#">Cauliflower</a></li>
																		<li><a href="#">Tomato Juice</a></li>
																	</ul>
																</div>
															</div>
															<div class="col-sm-2">
																<div class="pt-4 pb-4">
																	<h3>Best Seller</h3>
																	<ul>
																		<li><a href="#">Uvina Grape</a></li>
																		<li><a href="#">Seville Orange</a></li>
																		<li><a href="#">Aurore Grape</a></li>
																		<li><a href="#">Tieton Cherry</a></li>
																		<li class="new"><a href="#">Tomato Juice</a></li>
																		<li><a href="#">Sprouting Broccoli</a></li>
																	</ul>
																</div>
															</div>
															<div class="col-sm-3">
																<div class="pt-4 pb-4">
																	<img src="images/image_242x237.jpg" alt="" />
																</div>
															</div>
														</div>
													</div>
												</li>
											</ul>
										</li>
										<li class="dropdown">
											<a href="#">Blog</a>
											<ul class="sub-menu">
												<li><a href="blog.html">Blog List</a></li>
												<li><a href="blog-classic.html">Blog Classic</a></li>
												<li><a href="blog-masonry.html">Blog Masonry</a></li>
												<li><a href="blog-detail.html">Blog Single</a></li>
											</ul>
										</li>
										<li>
											<a href="contact-us.html">Contact</a>
										</li>
									</ul>
								</nav>
								<div class="btn-wrap">
									<div class="mini-cart-wrap">
										<div class="mini-cart">
											<div class="mini-cart-icon" data-count="2">
												<i class="ion-bag"></i>
											</div>
										</div>
										<div class="widget-shopping-cart-content">
											<ul class="cart-list">
												<li>
													<a href="#" class="remove">×</a>
													<a href="shop-detail.html">
														<img src="images/shop/shop_100x100.jpg" alt="" />
														Orange Juice&nbsp;
													</a>
													<span class="quantity">1 × $12.00</span>
												</li>
												<li>
													<a href="#" class="remove">×</a>
													<a href="shop-detail.html">
														<img src="images/shop/shop_100x100.jpg" alt="" />
														Aurore Grape&nbsp;
													</a>
													<span class="quantity">1 × $9.00</span>
												</li>
											</ul>
											<p class="total">
												<strong>Subtotal:</strong> 
												<span class="amount">$21.00</span>
											</p>
											<p class="buttons">
												<a href="cart.html" class="view-cart">View cart</a>
												<a href="checkout.html" class="checkout">Checkout</a>
											</p>
										</div>
									</div>
									<div class="top-search-btn-wrap">
										<div class="top-search-btn">
											<a href="javascript:void(0);">
												<i class="ion-search"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
			<header class="header header-mobile">
				<div class="container">
					<div class="row">
						<div class="col-xs-2">
							<div class="header-left">
								<div id="open-left"><i class="ion-navicon"></i></div>
							</div>
						</div>
						<div class="col-xs-8">
							<div class="header-center">
								<a href="./" id="logo-2">
									<img class="logo-image" src="images/logo.png" alt="Organik Logo" />
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
								<h2 class="page-title text-center">Shop</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li><a href="./">메인 페이지</a></li>
									<li><a href="shortcodes.html">상품 목록</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row">
							<div class="col-md-9 col-md-push-3">
								<div class="shop-filter">
								
									<div class="col-md-6">
										<p class="result-count">${page} 페이지 --- 총 ${listCount}개의 상품이 있습니다. </p>
									</div>
									
									<div class="col-md-6">
										<div class="shop-filter-right">

											<form class="commerce-ordering">
												<select name="orderby" class="orderby">
													<option value="INPUTDATE" <c:if test='${sort == "INPUTDATE"}'>selected="selected"</c:if>>최신 순</option>
													<option value="COUNT" <c:if test='${sort == "COUNT"}'>selected="selected"</c:if>>조회 순</option>
													<option value="PRICEUP" <c:if test='${sort == "PRICEUP"}'>selected="selected"</c:if>>가격 높은 순</option>
													<option value="PRICEDOWN" <c:if test='${sort == "PRICEDOWN"}'>selected="selected"</c:if>>가격 낮은 순</option>
												</select>
												<input type="hidden" value="${sort}" id="sort">
											</form>
										</div>
									</div>
									
								</div>
								
								<!-- 카테고리 있던 곳 -->
								<div class="category-carousel-2 mb-3" data-auto-play="true" data-desktop="3" data-laptop="3" data-tablet="2" data-mobile="1" id="category-carousel">
					
								</div>
								
								<div class="product-grid">
								<!-- 상품리스트 -->
								<c:choose>
	 							<c:when test="${fn:length(productList) > 0}">
									<c:forEach var="product" items="${productList}">
									<div class="col-md-4 col-sm-6 product-item text-center mb-3">
										<div class="product-thumb">
											<a href="./product/${product.PRODUCT_ID}">
												<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}" alt="" style="min-width:100%; height:260px;"/>
											</a>
											<div class="product-action">
												<span class="add-to-cart">
													<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
												</span>
											</div>
										</div>
										<div class="product-info">
											<a href="./product/${product.PRODUCT_ID}">
												<h2 class="title">${product.NAME}</h2>
												<span class="price"><fmt:formatNumber value="${product.PRICE}" type="number"/>원</span>
											</a>
										</div>
									</div>
									</c:forEach>
									</c:when>
									
									<c:otherwise>
										&nbsp;&nbsp;&nbsp;&nbsp;상품이 없습니다.
									</c:otherwise>
								
								</c:choose>
								</div>
								
								<div class="pagination"> 
								<c:choose>
									<c:when test="${fn:length(productList) > 0}">
									<c:choose>
										<c:when test="${page <= 1}">
											<a class="prev page-numbers" href="#">이전</a>
										</c:when>
										<c:otherwise>
											<a class="prev page-numbers" href="#" onClick="pageUrl(${page-1})">이전</a>
										</c:otherwise>
									</c:choose>
									
									<c:forEach var="startNum" begin="${startPage}" end="${endPage}">
										<c:choose>
											<c:when test="${startNum eq page}">
												<span class="page-numbers current">${startNum}</span>
											</c:when>
											<c:otherwise>
												<a class="page-numbers" href="#" onClick="pageUrl(${startNum})">${startNum}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									
									<c:choose>
										<c:when test="${page ge maxPage}">
											<a class="next page-numbers" href="#">다음</a>
										</c:when>
										<c:otherwise>
											<a class="next page-numbers" href="#" onClick="pageUrl(${page+1})">다음</a>
										</c:otherwise>
									</c:choose>
								</c:when>
									<c:otherwise>
										
									</c:otherwise>
								</c:choose>
								</div>
								
							</div>
							
							<div class="col-md-3 col-md-pull-9">
								<div class="sidebar">
									<div class="widget widget-product-search">
										<div class="form-search">
											<input type="text" class="search-field" placeholder="상품 제목 검색..." value="${keyword}" id="search-input-text" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit()}"/>
											<input type="submit" value="Search" id="search"/>
										</div>
									</div>
									<div class="widget widget-product-categories">
										<h3 class="widget-title">카테고리</h3>
										<ul class="product-categories">
										</ul>
										<input type="hidden" value="${type1}" id="type1">
									</div>
								
									<div class="widget widget-products">
										<h3 class="widget-title">이런 상품은 어떠세요?</h3>
										<ul class="product-list-widget">
										</ul>
									</div>
									<div class="widget widget-tags">
										<h3 class="widget-title">태그</h3>
										<div class="tagcloud">
										</div>
										<input type="hidden" value="${type2}" id="type2">
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
							<img src="images/footer_logo.png" class="footer-logo" alt="" />
							<p>
								Welcome to Organik. Our products are freshly harvested, washed ready for box and finally delivered from our family farm right to your doorstep.
							</p>
							<div class="footer-social">
								<a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a>
								<a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a>
								<a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a>
								<a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram"></i></a>
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
								<p>
									Enter your email address for our mailing list to keep yourself updated.
								</p>
								<form class="newsletter">
									<input type="email" name="EMAIL" placeholder="Your email address" required="" />
									<button><i class="fa fa-paper-plane"></i></button>
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
							Copyright © 2017 <a href="#">Organic Store</a> - All Rights Reserved.
						</div>
						<div class="col-md-4">
							<img src="images/footer_payment.png" alt="" />
						</div>
					</div>
				</div>
				<div class="backtotop" id="backtotop"></div>
			</div>
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

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/core.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/widget.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/mouse.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/slider.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.ui.touch-punch.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/price-slider.js"></script>
	</body>
</html>