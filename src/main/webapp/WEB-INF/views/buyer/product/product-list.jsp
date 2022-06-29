<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
<link rel="shortcut icon" href="images/favicon.ico" />
<title>RudisFarm &#8211; 상품 목록</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/font-awesome.min.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/ionicons.min.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/owl.carousel.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/owl.theme.css"
	type="text/css" media="all" />
<link rel='stylesheet'
	href='<%=request.getContextPath()%>/resources/bootstrap/css/prettyPhoto.css'
	type='text/css' media='all' />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/style.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/custom.css"
	type="text/css" media="all" />
<link
	href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/product-categories.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/tagcloud.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/product-list-widget.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/search.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/sort.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/category-carousel.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/add-cart.js?v=<%=System.currentTimeMillis()%>"></script>
	
	<style type="text/css">	
		.title {
			  text-overflow:ellipsis;
			  white-space:nowrap;
			  word-wrap:normal;
			  overflow:hidden;
			}
			
	</style>
	
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
							<h2 class="page-title text-center">
								<c:if test="${productPagenation.type1 ne null}">${productPagenation.type1}</c:if>
								<c:if test="${productPagenation.type2 ne null}">${productPagenation.type2}</c:if>
								<c:if test="${productPagenation.type1 eq null and productPagenation.type2 eq null}">상품 목록</c:if>
							</h2>
						</div>
					</div>
				</div>
			</div>
			
			<div class="section border-bottom pt-2 pb-2">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<ul class="breadcrumbs">
								<li><a href="/rudisfarm">메인</a></li>
								<li><a href="/rudisfarm/product">상품 목록</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			<div class="section pt-7 pb-7">
				<div class="container">
					<div class="row">
						<div class="col-md-9 col-md-push-3">
							
							<div class="shop-filter" style="margin-bottom: 10px;">
								<div class="col-sm-6 col-md-6">
									<p class="result-count">${productPagenation.page}페이지 --- 총
										${productPagenation.listCount}개의 상품이 있습니다.</p>
								</div>
								<div class="col-sm-6 col-md-6">
									<div class="shop-filter-right">

										<form class="commerce-ordering">
											<select id="orderby" class="orderby">
											</select> <input type="hidden" value="${productPagenation.sort}"
												id="sort">
										</form>
									</div>
								</div>
							</div>
							<span style="font-size:25px; font-family: 'Do Hyeon', sans-serif; color:#A5DF00;">&nbsp;&nbsp;추천 광고상품</span>
							<div class="category-carousel-2 mb-3" data-auto-play="true"
								data-desktop="3" data-laptop="3" data-tablet="2" data-mobile="1"
								id="category-carousel"></div>

							<div class="product-grid">
								<!-- 상품리스트 -->
								<c:choose>
									<c:when test="${fn:length(productPagenation.productList) > 0}">
										<c:forEach var="product"
											items="${productPagenation.productList}">
											<div class="col-md-4 col-sm-6 product-item text-center mb-3">
												<div class="product-thumb">
													<a href="/rudisfarm/product/${product.PRODUCT_ID}?page=${productPagenation.page}">
<%-- 													<c:choose> --%>
<%-- 														<c:when test="${product.COUNT > 0}"> --%>
<%-- 															<a href="/rudisfarm/product/${product.PRODUCT_ID}?page=${productPagenation.page}"> --%>
<%-- 														</c:when> --%>
<%-- 														<c:otherwise> --%>
<!-- 															<a href="javascript:void(0);"> -->
<%-- 														</c:otherwise> --%>
<%-- 													</c:choose> --%>
													 	<c:if test="${product.COUNT < 1}">
															<span class="outofstock">
																<span>Out</span>
																"매진되었습니다"
															</span>
														</c:if>
														
														<div class="badges">
															<c:if test="">
																<span class="hot">Hot</span>
															</c:if>
															<c:if test="">
																<span class="onsale">Sale</span>
															</c:if>
														</div>
														
														<c:choose>
															<c:when test="${fn:length(product.SUMNAIL) > 0}">
																<img
																	src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}"
																	alt="" style="min-width: 100%; height: 260px;" />
															</c:when>
															<c:otherwise>
																<img
																	src="/rudisfarm/resources/upload/images/default.png"
																	alt="" style="min-width: 100%; height: 260px;" />
															</c:otherwise>
														</c:choose>
													</a>
													
													<c:choose>
														<c:when test="${product.COUNT > 0}">
														<div class="product-action">
															<span class="add-to-cart"> <a href="javascript:void(0);" onclick="addCart(${product.PRODUCT_ID}, 1, '${USER_ID}');" data-toggle="tooltip" data-placement="top"
																title="찜 하기"></a>
															</span>
														</div>
														</c:when>
														<c:otherwise>
<!-- 															<span class="add-to-cart"> <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="찜 하기"></a> -->
<!-- 															</span> -->
														</c:otherwise>
													</c:choose>
													
												</div>
												<div class="product-info">
													<a href="/rudisfarm/product/${product.PRODUCT_ID}">
														<h2 class="title">${product.PRODUCT_NAME}</h2> <span class="price"><fmt:formatNumber
																value="${product.PRICE}" type="number" />원</span><br>
																<span class="price" style="color:#FFA500">${product.WEIGHT / 1000}kg</span><br>
																<span class="price" style="color:#DF7401">(수량 : ${product.COUNT})</span>
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

							<div class="pagination" id="pagination">
								<c:choose>
									<c:when test="${fn:length(productPagenation.productList) > 0}">
										<c:choose>
											<c:when test="${productPagenation.page <= 1}">
												<a class="prev page-numbers" href="javascript:void(0)">이전</a>
											</c:when>
											<c:otherwise>
												<a class="prev page-numbers"
													href="/rudisfarm/product?page=${productPagenation.page-1}&keyword=${productPagenation.keyword}&type1=${productPagenation.type1}&type2=${productPagenation.type2}&sort=${productPagenation.sort}">이전</a>
											</c:otherwise>
										</c:choose>

										<c:forEach var="startNum"
											begin="${productPagenation.startPage}"
											end="${productPagenation.endPage}">
											<c:choose>
												<c:when test="${startNum eq productPagenation.page}">
													<span class="page-numbers current">${startNum}</span>
												</c:when>
												<c:otherwise>
													<a class="page-numbers"
														href="/rudisfarm/product?page=${startNum}&keyword=${productPagenation.keyword}&type1=${productPagenation.type1}&type2=${productPagenation.type2}&sort=${productPagenation.sort}">${startNum}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when
												test="${productPagenation.page ge productPagenation.maxPage}">
												<a class="next page-numbers" href="javascript:void(0)">다음</a>
											</c:when>
											<c:otherwise>
												<a class="next page-numbers"
													href="/rudisfarm/product?page=${productPagenation.page+1}&keyword=${productPagenation.keyword}&type1=${productPagenation.type1}&type2=${productPagenation.type2}&sort=${productPagenation.sort}">다음</a>
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
										<input type="text" class="search-field"
											placeholder="상품 제목 검색..."
											value="${productPagenation.keyword}" id="search-input-text"
											onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit()}" />
										<input type="submit" value="Search" id="search" />
									</div>
								</div>
								<div class="widget widget-product-categories">
									<h3 class="widget-title">카테고리</h3>
									<ul class="product-categories" id="product-categories">
									</ul>
									<input type="hidden" value="${productPagenation.type1}"
										name="TYPE1">
								</div>

								<div class="widget widget-products">
									<h3 class="widget-title">이런 상품은 어떠세요?</h3>
									<ul class="product-list-widget" id="product-list-widget">
									</ul>
								</div>
								<div class="widget widget-tags">
									<h3 class="widget-title">태그</h3>
									<div class="tagcloud" id="tagcloud"></div>
									<input type="hidden" value="${productPagenation.type2}"
										name="TYPE2">
								</div>
							</div>
						</div>
					</div> <!-- /row -->
				</div>
			</div>
			
		</div>
	</div>
	<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/add-cart.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/categori-header.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/cart-list.js"></script>	

	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/cart-list.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/owl.carousel.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.countdown.min.js"></script>
	<script type='text/javascript'
		src='<%=request.getContextPath()%>/resources/bootstrap/js/jquery.prettyPhoto.js'></script>
	<script type='text/javascript'
		src='<%=request.getContextPath()%>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js'></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/script.js"></script>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/core.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/widget.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/mouse.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/slider.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.ui.touch-punch.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/bootstrap/js/price-slider.js"></script>
</body>
</html>