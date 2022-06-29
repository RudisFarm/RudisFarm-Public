<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/bootstrap/images/favicon.ico"/>
		<title>Organik Shop &#8211; Shop Detail | Organik HTML Template</title>

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
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/category.js?v=<%=System.currentTimeMillis()%>"></script>		
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/tagcloud.js?v=<%=System.currentTimeMillis()%>"></script>		
	 	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/product-list-widget.js?v=<%=System.currentTimeMillis()%>"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/search.js?v=<%=System.currentTimeMillis()%>"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/order-product.js?v=<%=System.currentTimeMillis()%>"></script>	
		<script type="text/javascript">
			
		</script>
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
								<h2 class="page-title text-center">Shop Detail</h2>
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
									<li>상품 상세보기</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row">
							<div class="col-md-9 col-md-push-3">
								<div class="single-product">
									<div class="col-md-6">
										<div class="image-gallery">
											<div class="image-gallery-inner">
												<div>
													<div class="image-thumb">
														<a href="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}" data-rel="prettyPhoto[gallery]">
															<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}" alt="" style="min-width:100%; height:400px;"/>
														</a>
													</div>
												</div>
												
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
										
												<div class="image-nav-item">
													<div class="image-thumb">
														<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}" alt="" style="min-width:100%; height:100px;"/>
													</div>
												</div>													
											<c:choose>
												<c:when test="${fn:length(descFiles) > 0}">
													<c:forEach begin="0" end="1" step="1" var="index">		
														<div class="image-nav-item">
															<div class="image-thumb">
																<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${descFiles[index]}" alt="" style="min-width:100%; height:100px;"/>
															</div>
														</div>	
													</c:forEach>
												</c:when>
											</c:choose>							
										</div>
										
									</div>
									<div class="col-md-6">
										<div class="summary">
											<h1 class="product-title">${product.NAME}</h1>
											<div class="product-rating">
												<div class="star-rating">
													<span style="width:100%"></span>
												</div>
												<i>(리뷰  0 (구현 X))</i>
											</div>
											<div class="product-price">
												<ins><fmt:formatNumber value="${product.PRICE}" type="number"/>원</ins>
											</div>
											<div class="mb-3">
												<p>상품 번호</p>
												<p>${product.PRODUCT_ID}번</p>
												<p>설명 : ${product.DESCRIPTION}</p>
											</div>
											<form class="cart">
												<div class="quantity-chooser">
													<div class="quantity">
														<span class="qty-minus" data-min="1"><i class="ion-ios-minus-outline"></i></span>
														<input type="text" name="quantity" value="1" title="Qty" class="input-text qty text" size="4">
														<span class="qty-plus" data-max=""><i class="ion-ios-plus-outline"></i></span>
													</div>
												</div>
												<button type="submit" class="single-add-to-cart">바로 구매하기!</button>
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
									<div class="col-md-12">
										<div class="commerce-tabs tabs classic">
											<ul class="nav nav-tabs tabs">
												<li class="active">
													<a data-toggle="tab" href="#tab-description" aria-expanded="true">상세보기</a>
												</li>
												<li class="">
													<a data-toggle="tab" href="#tab-reviews" aria-expanded="false">리뷰</a>
												</li>
											</ul>
											<div class="tab-content">
												<div class="tab-pane fade active in" id="tab-description">
													<p>
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
													</p>
												</div>
												<div id="tab-reviews" class="tab-pane fade">
													<div class="single-comments-list mt-0">
														<div class="mb-2">
															<h2 class="comment-title">2 reviews for Orange Juice</h2>
														</div>
														<ul class="comment-list">
															<li>
																<div class="comment-container">
																	<div class="comment-author-vcard">
																		<img alt="" src="<%= request.getContextPath() %>/resources/bootstrap/images/avatar/avatar_100x100.jpg" />
																	</div>
																	<div class="comment-author-info">
																		<span class="comment-author-name">admin</span>
																		<a href="#" class="comment-date">July 27, 2016</a>
																		<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
																	</div>
																	<div class="reply">
																		<a class="comment-reply-link" href="#">Reply</a>
																	</div>
																</div>
																<ul class="children">
																	<li>
																		<div class="comment-container">
																			<div class="comment-author-vcard">
																				<img alt="" src="<%= request.getContextPath() %>/resources/bootstrap/images/avatar/avatar_100x100.jpg" />
																			</div>
																			<div class="comment-author-info">
																				<span class="comment-author-name">admin</span>
																				<a href="#" class="comment-date">July 27, 2016</a>
																				<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
																			</div>
																			<div class="reply">
																				<a class="comment-reply-link" href="#">Reply</a>
																			</div>
																		</div>
																	</li>
																</ul>
															</li>
															<li>
																<div class="comment-container">
																	<div class="comment-author-vcard">
																		<img alt="" src="<%= request.getContextPath() %>/resources/bootstrap/images/avatar/avatar_100x100.jpg" />
																	</div>
																	<div class="comment-author-info">
																		<span class="comment-author-name">admin</span>
																		<a href="#" class="comment-date">July 27, 2016</a>
																		<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
																	</div>
																	<div class="reply">
																		<a class="comment-reply-link" href="#">Reply</a>
																	</div>
																</div>
															</li>
														</ul>
													</div>
													<div class="single-comment-form mt-0">
														<div class="mb-2">
															<h2 class="comment-title">LEAVE A REPLY</h2>
														</div>
														<form class="comment-form">
															<div class="row">
																<div class="col-md-12">
																	<textarea id="comment" name="comment" cols="45" rows="5" placeholder="Message *"></textarea>
																</div>
															</div>
															<div class="row">
																<div class="col-md-4">
																	<input id="author" name="author" type="text" value="" size="30" placeholder="Name *" class="mb-2">
																</div>
																<div class="col-md-4">
																	<input id="email" name="email" type="email" value="" size="30" placeholder="Email *" class="mb-2">
																</div>
																<div class="col-md-4">
																	<input id="url" name="url" type="text" value="" placeholder="Website">
																</div>
															</div>
															<div class="row">
																<div class="col-md-2">
																	<input name="submit" type="submit" id="submit" class="btn btn-alt btn-border" value="Submit">
																</div>
															</div>
														</form>
													</div>
												</div>
											</div>
										</div>
										<div class="related">
											<div class="related-title">
												<div class="text-center mb-1 section-pretitle fz-34">Rudis Farm</div>
												<h2 class="text-center section-title mtn-2 fz-24">판매자 다른 상품도 있어요!</h2>
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
										<ul class="product-categories">
										</ul>
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
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/slick.min.js'></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
	</body>
</html>