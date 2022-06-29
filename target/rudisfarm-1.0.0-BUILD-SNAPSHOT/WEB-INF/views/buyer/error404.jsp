<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
		<title>Organik Shop &#8211; Page Not Found | Organik HTML Template</title>

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
				<div class="section section-error pt-12 pb-12">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="text-center">
									<img src="<%= request.getContextPath() %>/resources/bootstrap/images/background/404.png" class="mb-6" alt="" />
									<h3 class="error-title uppercase">Oops! This page is not available</h3>
									<a href="/rudisfarm">인덱스로 돌아가기</a>
									<span class="error-content uppercase">
										Please go back to 
										<a href="./">Homepage</a>
									</span>
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
	</body>
</html>

