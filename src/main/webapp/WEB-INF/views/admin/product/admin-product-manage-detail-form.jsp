<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
	<link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/bootstrap/images/favicon.ico"/>
		
    <!-- Title Page-->
    <title>관리자 상품 상세보기</title>

    <!-- Fontfaces CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/css/font-face.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
	
	<!-- oganic CSS-->
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/font-awesome.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/ionicons.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.carousel.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/owl.theme.css" type="text/css" media="all"/>
	<link rel='stylesheet' href='<%= request.getContextPath() %>/resources/bootstrap/css/prettyPhoto.css' type='text/css' media='all'/>
	<link rel='stylesheet' href='<%= request.getContextPath() %>/resources/bootstrap/css/slick.css' type='text/css' media='all'/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/style.css" type="text/css" media="all"/>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/bootstrap/css/custom.css" type="text/css" media="all"/>
	<link href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet"/>
	
    <!-- Bootstrap CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/css/theme.css" rel="stylesheet" media="all">

</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <jsp:include page="/resources/admin_bootstrap/commons/header_mobile.jsp"/>
        <!-- END HEADER MOBILE-->
		
        <!-- MENU SIDEBAR-->
        <jsp:include page="/resources/admin_bootstrap/commons/sidebar.jsp"/>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <jsp:include page="/resources/admin_bootstrap/commons/header_desktop.jsp"/>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
						<div class="section pt-7 pb-7" style="border:10px solid #F3F3F3; background-color:#FFFFFF;">
							<div class="container">
								<div class="row">
									<div class="col-md-9 col-md-push-3">
										<div class="single-product">
											<div class="col-md-6">
												<div class="image-gallery">
													<div class="image-gallery-inner">
														<div>
															<div class="image-thumb">
															<!-- 섬네일 뜨는 곳 -->
															<c:choose>
																<c:when test="${fn:length(product.SUMNAIL) > 0}">										
																	<a href="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}" data-rel="prettyPhoto[gallery]">
																		<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}" alt="" style="min-width:100%; height:400px;"/>
																	</a>
																</c:when>
																<c:otherwise>
																	<a href="/rudisfarm/resources/upload/images/default.png" data-rel="prettyPhoto[gallery]">
																		<img src="/rudisfarm/resources/upload/images/default.png" alt="" style="min-width:100%; height:400px;"/>
																	</a>
																</c:otherwise>
															</c:choose>
															</div>
														</div>
														
														<!--썸네일 설명이미지 뜨는 곳 -->
														<c:choose>
														<c:when test="${fn:length(descFiles) > 0}">
															<c:forEach var="file" items="${descFiles}">
																<div>
																	<div class="image-thumb">
																		<a href="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${file}" data-rel="prettyPhoto[gallery]">
																			<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${file}" alt="" style="min-width:100%; height:400px;"/>
																		</a>
																	</div>
																</div>
															</c:forEach>
														</c:when>
														</c:choose>
													</div>
												</div>
												
												<div class="image-gallery-nav">
														<!-- 썸네일 아랫부분 뜨는 곳 -->
														<div class="image-nav-item">
															<div class="image-thumb">
																<c:choose>
																	<c:when test="${fn:length(product.SUMNAIL) > 0}">															
																		<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}" alt="" style="min-width:100%; height:100px;"/>
																	</c:when>
																	<c:otherwise>
																			<img src="/rudisfarm/resources/upload/images/default.png" alt="" style="min-width:100%; height:100px;"/>
																	</c:otherwise>
																</c:choose>
															</div>
														</div>													
														<c:if test="${not empty descFiles[0]}">
															<div class="image-nav-item">
																<div class="image-thumb">
																	<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${descFiles[0]}" alt="" style="min-width:100%; height:100px;"/>
																</div>
															</div>	
														</c:if>
														<c:if test="${not empty descFiles[1]}">
															<div class="image-nav-item">
																<div class="image-thumb">
																	<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${descFiles[1]}" alt="" style="min-width:100%; height:100px;"/>
																</div>
															</div>		
														</c:if>		
												</div>
												
											</div>
											<div class="col-md-6">
												<div class="summary">
													<h1 class="product-title">${product.PRODUCT_NAME}</h1>
													<div class="product-rating">
														<div class="star-rating">
															<span style="width:100%"></span>
														</div>
														<div style="color:#346AFF;">0개 상품평</div>
													</div>
													<div class="product-price">
														<ins><fmt:formatNumber value="${product.PRICE}" type="number"/>원</ins>
													</div>
													<div class="mb-3">
														<p>상품 번호 : ${product.PRODUCT_ID}</p>
														<p style="color:#346AFF;">판매자 : ${product.USER_ID}</p>
														<p>판매 단위 : ${product.WEIGHT / 1000}kg</p>
														<p>남은 수량 : ${product.COUNT}Box</p>
													</div>
													<form class="cart">
														미리보기 화면입니다.
													</form>
													
													<div class="product-tool">
														<a href="#" data-toggle="tooltip" data-placement="top" title="장바구니에 추가"> 장바구니에 추가 </a>
													</div>
													<div class="product-meta">
														<table>
															<tbody>
																<tr>
																	<td class="label">카테고리</td>
																	<td><a href="#">${product.TYPE1}, ${product.TYPE2}</a></td>
																</tr>
																<tr>
																<!-- 공유 있던 곳 -->
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<div class="col-md-12" >
												<div class="commerce-tabs tabs classic">
													<ul class="nav nav-tabs tabs">
														<li class="active">
															<a data-toggle="tab" href="#tab-description" aria-expanded="true" class="active show">상세보기</a>
														</li>
													</ul>
													<div class="tab-content">
														<div class="tab-pane fade active show in" id="tab-description">
															<c:choose>
																<c:when test="${fn:length(descFiles) > 0}">
																	<c:forEach var="file" items="${descFiles}">
																		<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${file}" alt="" style="min-width:100%; min-height:100%;"/>
																	</c:forEach>
																</c:when>
																<c:otherwise>
																	등록된 이미지가 없습니다.
																</c:otherwise>
															</c:choose>
														<div class="col-sm-12">
															<h2 class="white fz-20 mb-2"></h2><br>
															<div class="accordion" id="accordion4">
																<div class="accordion-group toggle">
																	<div class="accordion-heading toggle_title active">
																		<a class="accordion-toggle" data-toggle="collapse" aria-expanded="true" aria-controls="collapse10" href="#collapse10">
																			<h4>상품 소개</h4> 
																		</a>
																	</div>
																	<div id="collapse10" class="accordion-body collapse collapse show" style=" background-color:#f5f3f0;">
																		<div class="accordion-inner">
																			<p>${product.DESCRIPTION}</p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<br>&nbsp;
														<div class="row">
															<div class="col-sm-4">
																<div class="contact-info">
																	<div class="contact-icon">
																		<i class="fa fa-map-marker"></i>
																	</div>
																	<div class="contact-inner">
																		<h6 class="contact-title"> 원산지</h6>
																		<div class="contact-content">
																			${user.FIR_ADDRESS} ${user.SEC_ADDRESS}
			
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="contact-info">
																	<div class="contact-icon">
																		<i class="fa fa-phone"></i>
																	</div>
																	<div class="contact-inner">
																		<h6 class="contact-title"> 전화번호</h6>
																		<div class="contact-content">
																			${user.PHONE}
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-4">
																<div class="contact-info">
																	<div class="contact-icon">
																		<i class="fa fa-envelope"></i>
																	</div>
																	<div class="contact-inner">
																		<h6 class="contact-title"> 판매자 이메일</h6>
																		<div class="contact-content">
																			${user.EMAIL}
																		</div>
																	</div>
																</div>
																</div>		
															</div>		

														
														</div>
													</div>
												</div>
												<div class="related">
													<div class="related-title">
														<div class="text-center mb-1 section-pretitle fz-34">Rudis Farm</div>
													</div>
													<div class="product-carousel p-0" data-auto-play="true" data-desktop="3" data-laptop="2" data-tablet="2" data-mobile="1" id="order-product">
													</div>
												</div>
											</div>
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
												<ul class="product-categories" id="product-categories">
													<li><a href="#">야채</a> <span class="count">6</span></li>
													<li><a href="#">과일</a> <span class="count">5</span></li>
													<li><a href="#">주스</a> <span class="count">6</span></li>
													<li><a href="#">이외 농산품들</a> <span class="count">6</span></li>
												</ul>
											</div>
											
											<div class="widget widget-products">
												<h3 class="widget-title">이런 상품은 어떠세요?</h3>
												<ul class="product-list-widget" id="product-list-widget">
													<li>
														<a href="#">
															<img src="<%= request.getContextPath() %>/resources/upload/images/default.png" alt="" />
															<span class="product-title">농산품</span>
														</a>
														<ins>10,000원</ins>
													</li>												
												</ul>
											</div>
											
											<div class="widget widget-tags">
												<h3 class="widget-title">태그</h3>
												<div class="tagcloud" id="tagcloud">
													<a href="#">감자</a>
													<a href="#">호박</a>
													<a href="#">배추</a>
													<a href="#">사과</a>
												</div>
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>                 		
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.js">
    </script>
	
    <!-- Main JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/js/main.js"></script>

	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery-migrate.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/jquery.countdown.min.js"></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js'></script>
	<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/slick.min.js'></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>

</body>
</html>