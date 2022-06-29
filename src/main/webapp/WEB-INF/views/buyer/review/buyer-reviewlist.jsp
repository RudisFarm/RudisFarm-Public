<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0"/>
		<link rel="shortcut icon" href="images/favicon.ico"/>
<!-- 		<title>RudisFarm 결제 완료</title> -->

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
<title>리뷰 목록</title>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:include page="/resources/bootstrap/commons/head.jsp"/>

</head>
<body>
	
		<jsp:include page="/resources/bootstrap/commons/mobile_menu.jsp"/>
		<div class="site">
		<jsp:include page="/resources/bootstrap/commons/topbar.jsp"/>
		<jsp:include page="/resources/bootstrap/commons/header.jsp"/>
			<div id="main">
				<div class="section section-bg-10 pt-11 pb-17">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<h2 class="page-title text-center">리뷰 목록</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li><a href="../">메인</a></li>
									<li>리뷰 목록</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="section pt-7 pb-7">
					<div class="container">
						<div class="row col-md-9 col-md-push-3">
							<div class="col-md-12">
										<div class="commerce-tabs tabs classic">
<!-- 											<ul class="nav nav-tabs tabs"> -->
<!-- 												<li class=""> -->
<!-- 													<a data-toggle="tab" href="#tab-description" aria-expanded="false">상세보기</a> -->
<!-- 												</li> -->
<!-- 												<li class="active"> -->
<!-- 													<a data-toggle="tab" href="#tab-reviews" aria-expanded="true">리뷰</a> -->
<!-- 												</li> -->
<!-- 											</ul> -->
											<div class="tab-content">
<!-- 												<div class="tab-pane fade" id="tab-description"> -->
													
														
															
<!-- 																<img src="/rudisfarm/resources/upload/images/product/10/files" alt="" style="min-width:100%; min-height:100%;"> -->
															
														
														
													
<!-- 													<h3>상품 소개</h3>  -->
<!-- 													<p>description</p> -->
<!-- 												</div> -->
												<div id="tab-reviews" class="tab-pane fade active in">
												<div class="row">
<!-- 												<div class="col-md-6"> -->
<%-- 												<h3 class="comment-title">${reviewQuantity }개의 이용후기가 있습니다.</h3> --%>
<!-- 												</div> 상품에서 쓸거임 -->
<!-- 												<div class="col-md-6"> -->
<%-- 												<h4 class="comment-title">상품 평균 별점 : ${productRatingAvg }&nbsp;&nbsp;&nbsp;&nbsp;판매자 평균 별점 : ${sellerRatingAvg }</h4> --%>
<!-- 												</div> -->
												<div class="col-md-12">
													<table class="table shop-cart">
									<tbody>
<!-- 									<tr> -->
<!-- 									<th>No.</th> -->
<!-- 									<th>상품명</th> -->
<!-- 									<th>내용</th> -->
<!-- 									<th>작성일</th> -->
<!-- 									<th>상품 별점</th> -->
<!-- 									<th>판매자 별점</th> -->
<!-- 									<th>리뷰 수정하기</th> -->
<!-- 									</tr> -->
									<c:forEach var="i" begin="1" end="${reviewPagenation.getList().size()}" varStatus="status">
										<tr>
											<td>
												<div class="row" style="margin: 0px">
													<div class="col-xs-12 col-sm-2 col-md-1 col-lg-1 p-1">
														No.${reviewPagenation.getList().get(i-1).REVIEW_ID }
													</div>
													<div class="col-xs-12 col-sm-12 col-md-11 col-lg-11">
														<div class="row" style="margin: 0px">
															<div class="row" style="margin: 0px">
																<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p-1">
																	상품명 : ${reviewPagenation.getList().get(i-1).PRODUCT_NAME }
																</div>
																<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 p-1">
																	리뷰 내용 : 
																	<c:choose>
																		<c:when test="${reviewPagenation.getList().get(i-1).CONTENT.length() gt 100}">
																			${fn:substring(reviewPagenation.getList().get(i-1).CONTENT, 0, 30) }...
																		</c:when>
																		<c:otherwise>
																			${reviewPagenation.getList().get(i-1).CONTENT}
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
															<div class="row" style="margin: 0px">
																<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 p-1">
																	<div class="product-rating">
																		상품 별점&nbsp;
																		<div class="star-rating">
																			<span style="width:${reviewPagenation.getList().get(i-1).PRODUCT_RATING *20}%"></span>
																		</div>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 p-1">
																	<div class="product-rating">
																		판매자 별점&nbsp;
																		<div class="star-rating">
																			<span style="width:${reviewPagenation.getList().get(i-1).SELLER_RATING *20}%"></span>
																		</div>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 p-1">
																	작성일 : ${reviewPagenation.getList().get(i-1).WRITEDATE }
																</div>
															</div>
														</div>
														<div class="row" style="margin: 0px">
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 pt-2">
																<input type="button" onclick="location.href='/rudisfarm/product/${reviewPagenation.getList().get(i-1).PRODUCT_ID}?cfr=t&reviewid=reviewid_${reviewPagenation.getList().get(i-1).REVIEW_ID}'" value="보기">
																<input type="button" onclick="location.href='update-review/${reviewPagenation.getList().get(i-1).REVIEW_ID}'" value="수정">
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>
									
<%-- 										<tr class="cart_item" onclick="location.href='/rudisfarm/product/${reviewlist.get(i-1).PRODUCT_ID}?cfr=t' "style="cursor: pointer"> --%>
<%-- 										<td>${status.count }</td> --%>
<%-- 										<td>${plist.get(i-1).PRODUCT_NAME }</td> --%>
<%-- 										<td><div>${fn:substring(reviewlist.get(i-1).CONTENT, 0, 5) }...</div> --%>
<%-- 										<c:if test="${reviewlist.get(i-1).FILES!=''}"> --%>
<%-- 										<c:forEach var="image" items="${fn:split(reviewlist.get(i-1).FILES, '/') }" varStatus="imageCount"> --%>
<%-- 										<img src="<%= request.getContextPath() %>/resources/upload/images/review/user1/${image }" width="200" alt="${image }">&nbsp; --%>
<%-- 										<c:if test="${imageCount.count%2==0}"> --%>
<!-- 										<br><br> -->
<%-- 										</c:if> --%>
<%-- 										</c:forEach> --%>
<%-- 										</c:if> --%>
<%-- 	<%-- 									<div>${fn:length(fn:split(review.FILES, '/')) }</div> --%>
										
<!-- 										</td> -->
<%-- 										<td>${reviewlist.get(i-1).WRITEDATE }</td> --%>
<%-- 										<td>${reviewlist.get(i-1).PRODUCT_RATING }</td> --%>
<%-- 										<td>${reviewlist.get(i-1).SELLER_RATING }</td> --%>
<%-- 										<td onclick="event.cancelBubble=true" style="cursor: pointer"><input type="button" onclick="location.href='update-review/${reviewlist.get(i-1).REVIEW_ID}'" value="수정하기"></td> --%>
<!-- 										</tr> -->
									</c:forEach>
									
									
									
									
									
<%-- 									<c:forEach var="review" items="${reviewlist}" varStatus="status"> --%>
<%-- 									<tr class="cart_item" onclick="location.href='/rudisfarm/product/${review.PRODUCT_ID}?cfr=t' "style="cursor: pointer"> --%>
<%-- 									<td>${status.count }</td> --%>
<%-- 									<td>${review.PRODUCT_ID }</td> --%>
<%-- 									<td><div>${fn:substring(review.CONTENT, 0, 5) }...</div> --%>
<%-- 									<c:if test="${review.FILES!=''}"> --%>
<%-- 									<c:forEach var="image" items="${fn:split(review.FILES, '/') }" varStatus="imageCount"> --%>
<%-- 									<img src="<%= request.getContextPath() %>/resources/upload/images/review/user1/${image }" width="200" alt="${image }">&nbsp; --%>
<%-- 									<c:if test="${imageCount.count%2==0}"> --%>
<!-- 									<br><br> -->
<%-- 									</c:if> --%>
<%-- 									</c:forEach> --%>
<%-- 									</c:if> --%>
<%-- 									<div>${fn:length(fn:split(review.FILES, '/')) }</div> --%>
									
<!-- 									</td> -->
<%-- 									<td>${review.WRITEDATE }</td> --%>
<%-- 									<td>${review.PRODUCT_RATING }</td> --%>
<%-- 									<td>${review.SELLER_RATING }</td> --%>
<%-- 									<td onclick="event.cancelBubble=true" style="cursor: pointer"><input type="button" onclick="location.href='update-review/${review.REVIEW_ID}'" value="수정하기"></td> --%>
<!-- 									</tr> -->
<%-- 									</c:forEach> --%>
										
									</tbody>
								</table>
															
															</div>
							<div class="pagination" id="pagination">
								<c:choose>
									<c:when test="${fn:length(reviewPagenation.getList()) > 0}">
										<c:choose>
											<c:when test="${reviewPagenation.page <= 1}">
												<a class="prev page-numbers" href="javascript:void(0)">이전</a>
											</c:when>
											<c:otherwise>
												<a class="prev page-numbers"
													href="/rudisfarm/my-page/reviewlist?page=${reviewPagenation.page-1}&sort=${reviewPagenation.sort}">이전</a>
											</c:otherwise>
										</c:choose>

										<c:forEach var="startNum"
											begin="${reviewPagenation.startPage}"
											end="${reviewPagenation.endPage}">
											<c:choose>
												<c:when test="${startNum eq reviewPagenation.page}">
													<span class="page-numbers current">${startNum}</span>
												</c:when>
												<c:otherwise>
													<a class="page-numbers"
														href="/rudisfarm/my-page/reviewlist?page=${startNum}&sort=${reviewPagenation.sort}">${startNum}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when
												test="${reviewPagenation.page ge reviewPagenation.maxPage}">
												<a class="next page-numbers" href="javascript:void(0)">다음</a>
											</c:when>
											<c:otherwise>
												<a class="next page-numbers"
													href="/rudisfarm/my-page/reviewlist?page=${reviewPagenation.page+1}&sort=${reviewPagenation.sort}">다음</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
							</div>
													</div>
												</div>
											</div>
										</div>
									</div>
							</div>
							<!-- 사이드바 -->
							<div class="col-md-3 col-md-pull-9"> 
								<div class="sidebar">
									<div class="widget widget-product-categories">
										<h3 class="widget-title">MY 쇼핑</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/orders">주문 목록 </a></li>
											<li><a href="/rudisfarm/my-page/my-cart">찜 목록</a></li>
										</ul>
										<br>
										<h3 class="widget-title">MY 활동</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/reviewlist">리뷰 목록</a></li>
										</ul>
										<br>
										<h3 class="widget-title">MY 정보</h3>
										<ul class="product-categories">
											<li><a href="/rudisfarm/my-page/my-info-modify-form">개인정보 조회/수정</a></li>
											<li><a href="/rudisfarm/my-page/out-check">회원 탈퇴</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- 사이드바 -->
							
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
<!-- 		</div> -->
		

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