<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<a href="<%= request.getContextPath() %>" id="logo">
					데스크탑 로고
					<img class="logo-image" src="<%= request.getContextPath() %>/resources/bootstrap/images/logo.png" alt="Organik Logo" />
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
														<img src="<%= request.getContextPath() %>/resources/bootstrap/images/image_242x237.jpg" alt="" />
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</li>
							<li>
								<a href="contact-us.html">Contact</a>
							</li>
							<li>
								<a href="#">데탑 로그인</a>
							</li>
							<li>
								<a href="#">데탑 회원가입</a>
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
										<a href="#" class="remove">Ã</a>
										<a href="shop-detail.html">
											<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_100x100.jpg" alt="" />
											Orange Juice&nbsp;
										</a>
										<span class="quantity">1 Ã $12.00</span>
									</li>
									<li>
										<a href="#" class="remove">Ã</a>
										<a href="shop-detail.html">
											<img src="<%= request.getContextPath() %>/resources/bootstrap/images/shop/shop_100x100.jpg" alt="" />
											Aurore Grape&nbsp;
										</a>
										<span class="quantity">1 Ã $9.00</span>
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
					<a href="<%= request.getContextPath() %>" id="logo-2">
						모바일 로고
						<img class="logo-image" src="<%= request.getContextPath() %>/resources/bootstrap/images/logo.png" alt="Organik Logo" />
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