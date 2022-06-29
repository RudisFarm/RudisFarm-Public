<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<title>RudisFarm &#8211; My-orders</title>

		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
		<link rel='stylesheet' href="<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css" type='text/css' media='all'/>
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
							<li><a href="shop.html">Shop</a></li>
							<li class="active"><a href="shop-list.html">Shop List</a></li>
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
								<h2 class="page-title text-center">배너</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li><a href="/rudisfarm">RudisFarm</a></li>
									<li><a href="/rudisfarm/my-page/my-info">My-page</a></li>
									<li><a href="/rudisfarm/my-page/my-cart">My-cart</a></li>
									<!-- <li>Product List</li> -->
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
										<p class="result-count"> Showing 1–12 of 23 results</p>
									</div>
									<div class="col-md-6">
										<div class="shop-filter-right">
											<div class="switch-view">
												<a href="shop-list.html" class="switcher active" data-toggle="tooltip" data-placement="top" title="" data-original-title="List"><i class="ion-navicon"></i></a> 
												<a href="shop.html" class="switcher" data-toggle="tooltip" data-placement="top" title="" data-original-title="Grid"><i class="ion-grid"></i></a>
											</div>
											<form class="commerce-ordering">
												<select name="orderby" class="orderby">
													<option value="">Sort by popularity</option>
													<option value="">Sort by average rating</option>
													<option value="" selected="selected">Sort by newness</option>
													<option value="">Sort by price: low to high</option>
													<option value="">Sort by price: high to low</option>
												</select>
											</form>
										</div>
									</div>
								</div>
								<div class="category-carousel-2 mb-3" data-auto-play="true" data-desktop="3" data-laptop="3" data-tablet="2" data-mobile="1">
									<div class="cat-item">
										<div class="cats-wrap" data-bg-color="#f8c9c2">
											<a href="#">
												<img src="images/category/cate_155x150.jpg" alt="" />
												<h2 class="category-title"> 
													주문목록 <mark class="count">(6)</mark>
												</h2>
											</a>
										</div>
									</div>
									<div class="cat-item">
										<div class="cats-wrap" data-bg-color="#ebd3c3">
											<a href="#">
												<img src="images/category/cate_155x150.jpg" alt="" />
												<h2 class="category-title"> 
													장바구니<mark class="count">(6)</mark>
												</h2>
											</a>
										</div>
									</div>
									<div class="cat-item">
										<div class="cats-wrap" data-bg-color="#c6e6f6">
											<a href="#">
												<img src="images/category/cate_155x150.jpg" alt="" />
												<h2 class="category-title"> 
													결제내역 조회<mark class="count">(6)</mark>
												</h2>
											</a>
										</div>
									</div>
									<div class="cat-item">
										<div class="cats-wrap" data-bg-color="#e0d1a1">
											<a href="#">
												<img src="images/category/cate_155x150.jpg" alt="" />
												<h2 class="category-title"> 
													개인정보 확인/수정 <mark class="count">(6)</mark>
												</h2>
											</a>
										</div>
									</div>
								</div>
								<div class="product-list">
									<div class="product-item">
										<div class="col-md-4 pl-0">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
														<span class="onsale">Sale!</span>
													</div>
													<img src="images/shop/shop_260x260.jpg" alt="" />
												</a>
											</div>
										</div>
										<div class="col-md-8">
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Orange Juice</h2>
													<span class="price">
														<del>$15.00</del> 
														<ins>$12.00</ins>
													</span>
												</a>
												<div class="product-rating">
													<div class="star-rating">
														<span style="width:100%"></span>
													</div>
													<i>(2 customer reviews)</i>
												</div>
												<div class="product-desc">
													<p>Relish the goodness of hand-picked oranges from the finest orchards. Foster a healthy lifestyle with the benefits of oranges. 100 percent orange juice with no added sugar for a healthy you.</p>
												</div>
												<div class="product-action-list">
													<a class="organik-btn small" href="#"> ADD TO CART </a>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product-item">
										<div class="col-md-4 pl-0">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
													</div>
													<img src="images/shop/shop_260x260.jpg" alt="" />
												</a>
											</div>
										</div>
										<div class="col-md-8">
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Aurore Grape</h2>
													<span class="price">$9.00</span>
												</a>
												<div class="product-rating">
													<div class="star-rating">
														<span style="width:70%"></span>
													</div>
													<i>(5 customer reviews)</i>
												</div>
												<div class="product-desc">
													<p>Relish the goodness of hand-picked oranges from the finest orchards. Foster a healthy lifestyle with the benefits of oranges. 100 percent orange juice with no added sugar for a healthy you.</p>
												</div>
												<div class="product-action-list">
													<a class="organik-btn small" href="#"> ADD TO CART </a>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product-item">
										<div class="col-md-4 pl-0">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
													</div>
													<img src="images/shop/shop_260x260.jpg" alt="" />
												</a>
											</div>
										</div>
										<div class="col-md-8">
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Blueberry Jam</h2>
													<span class="price">$12.00</span>
												</a>
												<div class="product-rating">
													<div class="star-rating">
														<span style="width:80%"></span>
													</div>
													<i>(5 customer reviews)</i>
												</div>
												<div class="product-desc">
													<p>Relish the goodness of hand-picked oranges from the finest orchards. Foster a healthy lifestyle with the benefits of oranges. 100 percent orange juice with no added sugar for a healthy you.</p>
												</div>
												<div class="product-action-list">
													<a class="organik-btn small" href="#"> ADD TO CART </a>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product-item">
										<div class="col-md-4 pl-0">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<img src="images/shop/shop_260x260.jpg" alt="" />
												</a>
											</div>
										</div>
										<div class="col-md-8">
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Passionfruit</h2>
													<span class="price">$35.00</span>
												</a>
												<div class="product-rating">
													<div class="star-rating">
														<span style="width:50%"></span>
													</div>
													<i>(3 customer reviews)</i>
												</div>
												<div class="product-desc">
													<p>Relish the goodness of hand-picked oranges from the finest orchards. Foster a healthy lifestyle with the benefits of oranges. 100 percent orange juice with no added sugar for a healthy you.</p>
												</div>
												<div class="product-action-list">
													<a class="organik-btn small" href="#"> ADD TO CART </a>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product-item">
										<div class="col-md-4 pl-0">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<div class="badges">
														<span class="hot">Hot</span>
													</div>
													<img src="images/shop/shop_260x260.jpg" alt="" />
												</a>
											</div>
										</div>
										<div class="col-md-8">
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Carrot</h2>
													<span class="price">$12.00</span>
												</a>
												<div class="product-rating">
													<div class="star-rating">
														<span style="width:90%"></span>
													</div>
													<i>(3 customer reviews)</i>
												</div>
												<div class="product-desc">
													<p>Relish the goodness of hand-picked oranges from the finest orchards. Foster a healthy lifestyle with the benefits of oranges. 100 percent orange juice with no added sugar for a healthy you.</p>
												</div>
												<div class="product-action-list">
													<a class="organik-btn small" href="#"> ADD TO CART </a>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
										</div>
									</div>
									<div class="product-item">
										<div class="col-md-4 pl-0">
											<div class="product-thumb">
												<a href="shop-detail.html">
													<span class="outofstock"><span>Out</span>of stock</span>
													<img src="images/shop/shop_260x260.jpg" alt="" />
												</a>
											</div>
										</div>
										<div class="col-md-8">
											<div class="product-info">
												<a href="shop-detail.html">
													<h2 class="title">Sprouting Broccoli</h2>
													<span class="price">$6.00</span>
												</a>
												<div class="product-rating">
													<div class="star-rating">
														<span style="width:90%"></span>
													</div>
													<i>(3 customer reviews)</i>
												</div>
												<div class="product-desc">
													<p>Relish the goodness of hand-picked oranges from the finest orchards. Foster a healthy lifestyle with the benefits of oranges. 100 percent orange juice with no added sugar for a healthy you.</p>
												</div>
												<div class="product-action-list">
													<a class="organik-btn small" href="#"> ADD TO CART </a>
													<span class="wishlist">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
													</span>
													<span class="quickview">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
													</span>
													<span class="compare">
														<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="pagination"> 
									<a class="prev page-numbers" href="#">Prev</a>
									<a class="page-numbers" href="#">1</a>
									<span class="page-numbers current">2</span> 
									<a class="page-numbers" href="#">3</a> 
									<a class="next page-numbers" href="#">Next</a>
								</div>
							</div>
							<div class="col-md-3 col-md-pull-9">
								<div class="sidebar">
									<!-- <div class="widget widget-product-search">
										<form class="form-search">
											<input type="text" class="search-field" placeholder="Search products…" value="" name="s" />
											<input type="submit" value="Search" />
										</form>
									</div> -->
									<div class="widget widget-product-categories">
										<h3 class="widget-title">MY 쇼핑</h3>
										<ul class="product-categories">
											<li><a href="../my-page/orders">주문목록 </a></li>
											<li><a href="../my-page/my-cart">장바구니</a></li>
											<li><a href="../my-page/orders">결제내역 조회</a></li>
										</ul>
										<br>
										<h3 class="widget-title">MY 활동</h3>
										<ul class="product-categories">
											<li><a href="#">내가 작성한 리뷰</a></li>
											<li><a href="#">작성 글 보기</a></li>
										</ul>
										<br>
										<h3 class="widget-title">MY 정보</h3>
										<ul class="product-categories">
											<li><a href="../my-page/my-info-modify-check">개인정보 조회/수정</a></li>
											<li><a href="../my-page/out-check">회원 탈퇴</a></li>
										</ul>
									</div>
<!--									<div class="widget widget_price_filter">
										<h3 class="widget-title">Filter by price</h3>
										<div class="price_slider_wrapper">
											<div class="price_slider" style="display:none;"></div>
											<div class="price_slider_amount">
												<input type="text" id="min_price" name="min_price" value="" data-min="0" placeholder="Min price"/>
												<input type="text" id="max_price" name="max_price" value="" data-max="150" placeholder="Max price"/>
												<button type="submit" class="button">Filter</button>
												<div class="price_label" style="display:none;">
													Price: <span class="from"></span> &mdash; <span class="to"></span>
												</div>
												<div class="clear"></div>
											</div>
										</div>
									</div>
 									<div class="widget widget-products">
										<h3 class="widget-title">Products</h3>
										<ul class="product-list-widget">
											<li>
												<a href="shop-detail.html">
													<img src="images/shop/shop_100x100.jpg" alt="" />
													<span class="product-title">Orange Juice</span>
												</a>
												<del>$15.00</del>
												<ins>$12.00</ins>
											</li>
											<li>
												<a href="shop-detail.html">
													<img src="images/shop/shop_100x100.jpg" alt="" />
													<span class="product-title">Aurore Grape</span>
												</a>
												<ins>$9.00</ins>
											</li>
											<li>
												<a href="shop-detail.html">
													<img src="images/shop/shop_100x100.jpg" alt="" />
													<span class="product-title">Blueberry Jam</span>
												</a>
												<ins>$15.00</ins>
											</li>
											<li>
												<a href="shop-detail.html">
													<img src="images/shop/shop_100x100.jpg" alt="" />
													<span class="product-title">Passionfruit</span>
												</a>
												<ins>$35.00</ins>
											</li>
											<li>
												<a href="shop-detail.html">
													<img src="images/shop/shop_100x100.jpg" alt="" />
													<span class="product-title">Carrot</span>
												</a>
												<ins>$12.00</ins>
											</li>
										</ul>
									</div>
									<div class="widget widget-tags">
										<h3 class="widget-title">Product Tags</h3>
										<div class="tagcloud">
											<a href="#">bread</a> <a href="#">food</a> <a href="#">fruits</a> <a href="#">green</a> <a href="#">healthy</a> <a href="#">natural</a> <a href="#">organic store</a> <a href="#">vegatable</a>
										</div>
									</div> 
-->
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
		
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/add-cart.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/categori-header.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/cart-list.js"></script>

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery-migrate.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/owl.carousel.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.countdown.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/core.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/widget.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/mouse.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/slider.min.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.ui.touch-punch.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/price-slider.js"></script>
	</body>
</html>