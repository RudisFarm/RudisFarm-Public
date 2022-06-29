<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
<link rel="shortcut icon" href="images/favicon.ico" />
<title>RudisFarm 유저 주문내역 리스트</title>

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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/table-responsive.css"
	type="text/css" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/table-responsive.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/payment-js/page-number-url.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/payment-js/search.js?v=<%=System.currentTimeMillis()%>"></script>

<jsp:include page="/resources/bootstrap/commons/head.jsp" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
         <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script type="text/javascript">
      function registerReivew(pId, oId) {
			$.ajax({
				type: 'post',
				url: '/rudisfarm/my-page/orders/buyer-review',
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify({
					"product_id": pId,
					"ORDERS_ID": oId,
				}), 
				success: function(data) {
					console.log("POST 수행 후 Response 수신 성공!");
					console.log(data.result);

					if(data.result == '/rudisfarm/my-page/orders') {
						var a = confirm('이미 리뷰를 등록하셨습니다. 리뷰를 수정하시겠습니까?');
						if(a){
							location.href="/rudisfarm/my-page/update-review/"+data.review_id;
						}
//	 					for(var key of formData.keys()){
//	 						console.log(key);
//	 					}
//	 					for(var value of formData.values()){
//	 						console.log(value);
//	 					}
//	 					console.log(formData);
//	 					console.log($('#loginForm'));
//	 					console.log($('#loginForm')[0]);
//	 					console.log($('#loginForm')[0][1]);
//	 					alert(data.result);
//	 					alert("로그인 성공");
						
					} else if(data.result == '/rudisfarm/buyer-review/'+pId+"?oId="+oId) {
						location.href=data.result;
					}		
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
		}
      
	$(function() {
	$("#submit").click(function() { //submit form 밖에 빼기
// 		var formData = new FormData($('#loginForm')[0]);
	console.log($("#submit").attr("class"));
		$.ajax({
			type: 'post',
			url: '/rudisfarm/my-page/orders/buyer-review',
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			data: JSON.stringify({
				"product_id":$("#submit").attr("class")
			}), 
			success: function(data) {
				console.log("POST 수행 후 Response 수신 성공!");
				console.log(data.result);

				if(data.result == '/rudisfarm/my-page/orders') {
					var a = confirm('이미 리뷰를 등록하셨습니다. 리뷰를 수정하시겠습니까?');
					if(a){
						location.href="/rudisfarm/my-page/update-review/"+data.review_id;
					}
// 					for(var key of formData.keys()){
// 						console.log(key);
// 					}
// 					for(var value of formData.values()){
// 						console.log(value);
// 					}
// 					console.log(formData);
// 					console.log($('#loginForm'));
// 					console.log($('#loginForm')[0]);
// 					console.log($('#loginForm')[0][1]);
// 					alert(data.result);
// 					alert("로그인 성공");
					
				} else if(data.result == '/rudisfarm/buyer-review/'+$("#submit").attr("class")) {
					location.href=data.result;
				}		
			},
			error: function(e) {
				console.log("에러 발생!");
				console.log(e);
			}
		});
	});
	});
	</script>
      
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
							<h2 class="page-title text-center">주문 목록</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="section border-bottom pt-2 pb-2">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<ul class="breadcrumbs">
								<li><a href="/rudisfarm">메인 페이지</a></li>
								<li>내 주문목록</li>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<div class="section pt-7 pb-7">
				<div class="container">
					<div class="row">
						<div class="col-md-9 col-md-push-3">
							<div class="table-desktop">
								<div class="wishlist-wrap">
									<table class="table shop-cart"
										style="text-align: center; word-break: keep-all;">
										<thead>
											<tr class="cart_item" align="center">
												<td class="product-info"></td>
												<td class="product-info">주문번호</td>
												<td class="product-info">상품명</td>
												<td class="product-info">개수</td>
												<td class="product-info">총가격</td>
												<td class="product-info">결제시간</td>
												<td class="product-info">결제상태</td>
												<td class="product-info"></td>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="i" begin="1"
												end="${ordersPagenation.getOrdersList().size()}">
												<tr class="tr-shadow"
													onclick="location.href='/rudisfarm/my-page/orders/${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}'"
													style="cursor: pointer;" align="center">
													<!-- 												<td class="product-info"><a -->
													<%-- 													href="getOrders-detail?ORDERS_ID=${buyerOrdersList.get(i).ORDERS_ID}"><span --%>
													<%-- 														class="color">${buyerOrdersList.get(i).ORDERS_ID}</span></a></td> --%>
													<td class="product-info"><img
														src="/rudisfarm/resources/upload/images/product/${pList.get(i-1).PRODUCT_ID}/${pList.get(i-1).SUMNAIL}"
														width="100px" /></td>
													<td class="product-info"><span>${ordersPagenation.getOrdersList().get(i-1).ORDERS_NAME}</span>
													</td>
													<td class="product-info"><span>${pList.get(i-1).PRODUCT_NAME}</span>
													</td>
													<td class="product-info"><span>${ordersPagenation.getOrdersList().get(i-1).COUNT}</span>
													</td>
													<td class="product-info"><span>${ordersPagenation.getOrdersList().get(i-1).TOTAL_PRICE}</span></td>
													<td class="product-info">
														<span class="status--process"><fmt:formatDate value="${ordersPagenation.getOrdersList().get(i-1).ORDERSDATE}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
													</td>
													<td class="product-info"><span>${ordersPagenation.getOrdersList().get(i-1).STATUS}</span></td>
													<td>
														<c:if test="${ordersPagenation.getOrdersList().get(i-1).IS_REVIEWED eq 0}">
															<c:if test="${ordersPagenation.getOrdersList().get(i-1).STATUS eq '구매 확정'}">
																<button class="${pList.get(i-1).PRODUCT_ID}" onclick="registerReivew('${pList.get(i-1).PRODUCT_ID}', '${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}');">리뷰 작성</button>	
															</c:if>
														</c:if>
														<c:if test="${ordersPagenation.getOrdersList().get(i-1).IS_REVIEWED eq 1}">
	<%-- 													<button class="${pList.get(i-1).PRODUCT_ID}" onclick="registerReivew('${pList.get(i-1).PRODUCT_ID}', '${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}');">리뷰 수정</button> --%>
														</c:if>
													</td>
												</tr>
											</c:forEach>
											<%-- 										<c:forEach var="orders" items="${buyerOrdersList}"> --%>
											<!-- 											<tr class="tr-shadow" -->
											<%-- 												onclick="location.href='/rudisfarm/my-page/orders/${orders.ORDERS_ID}'" --%>
											<!-- 												style="cursor: pointer;" align="center"> -->
											<!-- 												<td class="product-info"><a -->
											<%-- 													href="getOrders-detail?ORDERS_ID=${orders.ORDERS_ID}"><span --%>
											<%-- 														class="color">${orders.ORDERS_ID}</span></a></td> --%>
											<%-- 												<td class="product-info"><span>${orders.ORDERS_NAME}</span> --%>
											<!-- 												</td> -->
											<%-- 												<td class="product-info"><span>${orders.PRODUCT_ID}</span> --%>
											<!-- 												</td> -->
											<%-- 												<td class="product-info"><span>${orders.COUNT}</span> --%>
											<!-- 												</td> -->
											<%-- 												<td class="product-info"><span>${orders.TOTAL_PRICE}</span></td> --%>
											<%-- 												<td class="product-info"><span><fmt:formatDate --%>
											<%-- 															value="${orders.ORDERSDATE}" --%>
											<%-- 															pattern="yyyy-MM-dd HH:mm:ss" /></span></td> --%>
											<%-- 												<td class="product-info"><span>${orders.STATUS}</span></td> --%>
											<%-- 										</c:forEach> --%>
										</tbody>
									</table>

								</div>
							</div>

							<div class="table-mobile">
								<div class="wishlist-wrap">
									<table class="table shop-cart">
										<c:forEach var="i" begin="1"
											end="${ordersPagenation.getOrdersList().size()}">
											<tbody>
											
												<tr class="cart_item" align="center" style="cursor: pointer;" onclick="location.href='/rudisfarm/my-page/orders/${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}'">
													<td>
														<div class="row">
															<div class="col-xs-6 col-sm-6 p-1">
																No.${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}
															</div>
															<div class="col-xs-6 col-sm-6 p-1">
																<span class="tr-shadow"><a
																href='/rudisfarm/my-page/orders/${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}'
																style="color:blue ; cursor: pointer;">${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}</a></span>
															</div>
														</div>
														<div class="row">
															<div class="col-xs-6 col-sm-6 p-1">
																<strong>주문번호</strong>
															</div>
															<div class="col-xs-6 col-sm-6 p-1">
																<span class="desc">${ordersPagenation.getOrdersList().get(i-1).ORDERS_NAME}</span>
															</div>
														</div>
														<div class="row">
															<div class="col-xs-6 col-sm-6 p-1 ">
																<strong>상품명</strong>
															</div>
															<div class="col-xs-6 col-sm-6 p-1 ">
																<span class="status--process">${pList.get(i-1).PRODUCT_NAME}</span>
															</div>
														</div>
														<div class="row">
															<div class="col-xs-6 col-sm-6 p-1">
																개수
															</div>
															<div class="col-xs-6 col-sm-6 p-1">
																<span class="status--process">${ordersPagenation.getOrdersList().get(i-1).COUNT}</span>
															</div>
														</div>
														<div class="row">
															<div class="col-xs-6 col-sm-6 p-1">
																총가격
															</div>
															<div class="col-xs-6 col-sm-6 p-1">
																<span class="status--process">${ordersPagenation.getOrdersList().get(i-1).TOTAL_PRICE}</span>
															</div>
														</div>
														<div class="row">
															<div class="col-xs-6 col-sm-6 p-1">
																결제시간
															</div>
															<div class="col-xs-6 col-sm-6 p-1">
																<span class="status--process"><fmt:formatDate value="${ordersPagenation.getOrdersList().get(i-1).ORDERSDATE}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
															</div>
														</div>
														<div class="row">
															<div class="col-xs-6 col-sm-6 p-1">
																결제상태
															</div>
															<div class="col-xs-6 col-sm-6 p-1">
																<span class="status--process">${ordersPagenation.getOrdersList().get(i-1).STATUS}</span>
															</div>
														</div>
														<div class="row">
															<div class="col-xs-6 col-sm-6 p-1">
																이미지
															</div>
															<div class="col-xs-6 col-sm-6 p-1">
																<span class="status--process"><img
																src="/rudisfarm/resources/upload/images/product/${pList.get(i-1).PRODUCT_ID}/${pList.get(i-1).SUMNAIL}"
																width="100px" /> </span>
															</div>
														</div>
													</td>
<!-- 													<td>테이블번호<br> 주문번호<br> 상품명<br> 개수<br> -->
<!-- 														총가격<br> 결제시간<br> 결제상태<br> 이미지<br> -->
<!-- 													</td> -->
<!-- 													<td><span class="tr-shadow"><a -->
<%-- 															href='/rudisfarm/my-page/orders/${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}' --%>
<%-- 															style="color:blue ; cursor: pointer;">${ordersPagenation.getOrdersList().get(i-1).ORDERS_ID}</a></span><br> --%>
<%-- 														<span class="desc">${ordersPagenation.getOrdersList().get(i-1).ORDERS_NAME}</span><br> --%>
<%-- 														<span class="status--process">${pList.get(i-1).PRODUCT_NAME}</span><br> --%>
<%-- 														<span class="status--process">${ordersPagenation.getOrdersList().get(i-1).COUNT}</span><br> --%>
<%-- 														<span class="status--process">${ordersPagenation.getOrdersList().get(i-1).TOTAL_PRICE}</span><br> --%>
<%-- 														<span class="status--process"><fmt:formatDate --%>
<%-- 																value="${buyerOrdersList.get(i-1).ORDERSDATE}" --%>
<%-- 																pattern="yyyy-MM-dd HH:mm:ss" /></span><br> <span --%>
<%-- 														class="status--process">${ordersPagenation.getOrdersList().get(i-1).STATUS}</span><br> --%>
<!-- 														<span class="status--process"><img -->
<%-- 															src="/rudisfarm/resources/upload/images/product/${pList.get(i-1).PRODUCT_ID}/${pList.get(i-1).SUMNAIL}" --%>
<!-- 															width="100px" /> </span><br></td> -->
												</tr>
											</tbody>
										</c:forEach>

									</table>

								</div>
							</div>
							<div class="pagination" id="pagination">
								<c:choose>
									<c:when
										test="${fn:length(ordersPagenation.getOrdersList()) > 0}">
										<c:choose>
											<c:when test="${ordersPagenation.page <= 1}">
												<a class="prev page-numbers" href="javascript:void(0)">이전</a>
											</c:when>
											<c:otherwise>
												<a class="prev page-numbers"
													href="/rudisfarm/my-page/orders?page=${ordersPagenation.page-1}&keyword=${ordersPagenation.keyword}&type1=${ordersPagenation.type1}&type2=${ordersPagenation.type2}&sort=${ordersPagenation.sort}">이전</a>
											</c:otherwise>
										</c:choose>

										<c:forEach var="startNum"
											begin="${ordersPagenation.startPage}"
											end="${ordersPagenation.endPage}">
											<c:choose>
												<c:when test="${startNum eq ordersPagenation.page}">
													<span class="page-numbers current">${startNum}</span>
												</c:when>
												<c:otherwise>
													<a class="page-numbers"
														href="/rudisfarm/my-page/orders?page=${startNum}&keyword=${ordersPagenation.keyword}&type1=${ordersPagenation.type1}&type2=${ordersPagenation.type2}&sort=${ordersPagenation.sort}">${startNum}</a>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when
												test="${ordersPagenation.page ge ordersPagenation.maxPage}">
												<a class="next page-numbers" href="javascript:void(0)">다음</a>
											</c:when>
											<c:otherwise>
												<a class="next page-numbers"
													href="/rudisfarm/my-page/orders?page=${ordersPagenation.page+1}&keyword=${ordersPagenation.keyword}&type1=${ordersPagenation.type1}&type2=${ordersPagenation.type2}&sort=${ordersPagenation.sort}">다음</a>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
							</div>

						</div>


						<!-- 사이드바 -->
						<div class="col-md-3 col-md-pull-9">
							<!-- col-pull로 좌측에 -->
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
										<li><a href="/rudisfarm/my-page/my-info-modify-form">개인정보
												조회/수정</a></li>
										<li><a href="/rudisfarm/my-page/out-check">회원 탈퇴</a></li>
									</ul>
								</div>
							</div>
						</div>
						<!-- 사이드바 -->
					</div>
				</div>
			</div>


			<jsp:include page="/resources/bootstrap/commons/footer.jsp" />
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
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.js'></script>
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js'></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
	</body>
</html>

