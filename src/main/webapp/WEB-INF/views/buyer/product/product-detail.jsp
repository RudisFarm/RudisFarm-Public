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
		<title>RudisFarm &#8211; 상품 상세보기</title>

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
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/order-product.js?v=<%=System.currentTimeMillis()%>"></script>	
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/product-categories.js?v=<%=System.currentTimeMillis()%>"></script>		
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/tagcloud.js?v=<%=System.currentTimeMillis()%>"></script>		
 		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/product-list-widget.js?v=<%=System.currentTimeMillis()%>"></script>  
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/search-product-list.js?v=<%=System.currentTimeMillis()%>"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/add-cart.js?v=<%=System.currentTimeMillis()%>"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
	  google.charts.load('current', {packages: ['corechart']});
	  google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
    	  var chartData = new google.visualization.DataTable();
 		 
 		  chartData.addColumn('string', '상품');
 		  chartData.addColumn('number', '최소 가격');
 		  chartData.addColumn('number', '최대 가격');
 		  chartData.addRow([String('${minMax.tpye2}'), parseInt('${minMax.min}'), parseInt('${minMax.max}')]);
 		 
        var options = {
          title:'최소/최대 가격  (단위:1kg)',
          titleTextStyle: {
              fontSize: 15
            },
          legend: 'none',
  
          vAxis: { minorGridlines:{count:0}},
          height :200,
          width :'100%',
          pointSize:10,
          fontSize: 18,
          series: {  
        	  0: { color: '#F0A57C'}
          }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('curve_chart'));
        chart.draw(chartData, options);
        window.addEventListener('resize', drawChart, false);
      }
      
</script>
<style>
svg > g > g:last-child { pointer-events: none }
</style>
		<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
		<script>
		function comma(str) {
		     str = String(str);
		     return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		 }


		function addCart(product_id, user_id){
			var count = document.getElementsByName("COUNT")[0].value;
			
			if(user_id == '') {
				alert("로그인을 해주시기 바랍니다.");
				return false;
			}
			
			$.ajax({
				type : 'POST',         
				url: '/rudisfarm/my-page/my-cart', 
				dataType: 'json',
				contentType: 'application/json; charset=utf-8;',
				data : JSON.stringify({
					PRODUCT_ID : product_id,
					USER_ID : user_id,
					COUNT : count
				}),
				success : function(data) {
					console.log(data);
					
					if(data == false) {
						alert("장바구니에 넣을 수 있는 갯수보다 많습니다.");
					} else {
						var image="";
						$('.cart-list').children().remove();
						
						if(data["result"] > 0) {
							$(".mini-cart-icon").attr('data-count',data["list"].length);
							$.each(data["list"], function(index, key) {
								
								if(key["sumnail"] == "") { //썸네일이 없을 경우
									image="/rudisfarm/resources/upload/images/default.png";
								} else {
									image="/rudisfarm/resources/upload/images/product/"+key["product_ID"]+"/"+key["sumnail"];
								}	
								
								$(".cart-list").append(
									'<li id="'+key["cart_ID"]+'">'+
										'<a href="javascript:void(0);" class="remove" onclick="click_remove('+key["cart_ID"]+')">×</a>'+
										'<a href="/rudisfarm/product/'+key["product_ID"]+'">'+
											'<img src="'+image+'" alt="" />'+
											key["product_NAME"]+
										'</a>'+
										'<span>'+key["count"]+' 개</span>'+
										'<span class="quantity">'+comma(key["price"])+'원</span>'+
									'</li>'
								);
							})
							$(".amount").text("");
							$(".amount").text(comma(data["sumMoney"])+"원");
							
							alert("찜 목록에 추가되었습니다.");
						} else {
							alert("찜 목록 추가에 실패했습니다.");
						}
					}
					

				},
				error: function(data) {
					console.log("에러 발생!");
				}
			});	
		}
		</script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			const REVIEW_URL = new URL(window.location.href);
			
			
			if(REVIEW_URL.searchParams.get('cfr') == 't') {
				var offset = $('#'+REVIEW_URL.searchParams.get('reviewid')).offset(); //선택한 태그의 위치를 반환
				console.log(offset.top);
				var pos = offset.top - 100;
				console.log(pos);
		        $('html').animate({scrollTop : pos}, 400);
			}
		});
	</script>
	<script type="text/javascript">
	$(function() {
		$('#buyBtn').click(function() {
			$.ajax({
				type : 'POST',         
				url: '/rudisfarm/product/count', 
				dataType: 'json',
				contentType: 'application/json; charset=utf-8;',
				data : JSON.stringify({
					PRODUCT_ID : ${product.PRODUCT_ID},
					COUNT : $('#COUNT').val()
				}),
				success : function(data) {
					if(data) {
						$('#buyForm').submit();
					} else {
						alert("해당 상품의 재고가 소진되었습니다.")
					}
				},
				error: function(data) {
					console.log("에러 발생!");
				}
			});	
		});
	});
	</script>

	</head>
	<body>
	<jsp:include page="/resources/bootstrap/commons/mobile_menu.jsp"/>
		<jsp:include page="/resources/bootstrap/commons/menu_slideout.jsp" />
		<div class="site">
			<jsp:include page="/resources/bootstrap/commons/topbar.jsp" />
			<jsp:include page="/resources/bootstrap/commons/header.jsp"/>
			<div id="main">
				<div class="section section-bg-10 pt-11 pb-17">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<h2 class="page-title text-center">상품 상세</h2>
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
									<li><a href="/rudisfarm/product?${page}">상품 목록</a></li>
									<li>상품 상세</li>
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
												
<%-- 												<c:choose> --%>
<%-- 												<c:when test="${fn:length(descFiles) > 0}"> --%>
<%-- 													<c:forEach var="file" items="${descFiles}"> --%>
<!-- 														<div> -->
<!-- 															<div class="image-thumb"> -->
<%-- 																<a href="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${file}" data-rel="prettyPhoto[gallery]"> --%>
<%-- 																	<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${file}" alt="" style="min-width:100%; height:auto; object-fit:contain;"/> --%>
<!-- 																</a> -->
<!-- 															</div> -->
<!-- 														</div> -->
<%-- 													</c:forEach> --%>
<%-- 												</c:when> --%>
<%-- 												</c:choose> --%>
											</div>
										</div>
										
										<div class="image-gallery-nav">
										
<!-- 												<div class="image-nav-item"> -->
<!-- 													<div class="image-thumb"> -->
<%-- 														<c:choose> --%>
<%-- 															<c:when test="${fn:length(product.SUMNAIL) > 0}">															 --%>
<%-- 																<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${product.SUMNAIL}" alt="" style="min-width:100%; height:100px;"/> --%>
<%-- 															</c:when> --%>
<%-- 															<c:otherwise> --%>
<!-- 																	<img src="/rudisfarm/resources/upload/images/default.png" alt="" style="min-width:100%; height:100px;"/> -->
<%-- 															</c:otherwise> --%>
<%-- 														</c:choose> --%>
<!-- 													</div> -->
<!-- 												</div>													 -->
<%-- 													<c:if test="${not empty descFiles[0]}"> --%>
<!-- 														<div class="image-nav-item"> -->
<!-- 															<div class="image-thumb"> -->
<%-- 																<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${descFiles[0]}" alt="" style="min-width:100%; height:100px;"/> --%>
<!-- 															</div> -->
<!-- 														</div>	 -->
<%-- 													</c:if> --%>
<%-- 													<c:if test="${not empty descFiles[1]}"> --%>
<!-- 														<div class="image-nav-item"> -->
<!-- 															<div class="image-thumb"> -->
<%-- 																<img src="/rudisfarm/resources/upload/images/product/${product.PRODUCT_ID}/${descFiles[1]}" alt="" style="min-width:100%; height:100px;"/> --%>
<!-- 															</div> -->
<!-- 														</div>		 -->
<%-- 													</c:if>		 --%>
										</div>
										
									</div>
									<div class="col-md-6">
										<div class="summary">
											<h1 class="product-title">${product.PRODUCT_NAME}</h1>
											<div class="product-rating">
											${productRatingAvg }
												<div class="star-rating">
													<span style="width:${productRatingAvg*20 }%"></span>
												</div>
												<div style="color:#346AFF;">${reviewQuantity}개 상품평</div>
												
											</div>
											<div class="product-price">
												<ins><fmt:formatNumber value="${product.PRICE}" type="number"/>원</ins>
											</div>
											<div class="mb-3">
												<input type="hidden" value="${product.USER_ID}" id="user_id">
												<p>상품 번호 : ${product.PRODUCT_ID}</p>
												<p style="color:#346AFF;">판매자 : ${product.USER_ID}</p>
												<p>판매 단위 : ${product.WEIGHT / 1000}kg</p>
												<p>남은 수량 : ${product.COUNT}Box</p>
											</div>
											<c:choose>
												<c:when test="${product.COUNT gt 0}">
													<form class="cart" action="/rudisfarm/orders-payment" method="POST" id="buyForm">
														<div class="quantity-chooser">
															<div class="quantity">
																<span class="qty-minus" data-min="1"><i class="ion-ios-minus-outline"></i></span>
																<input type="text" name="COUNT" id="COUNT" value="1" title="수량" class="input-text qty text" 
																	oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
																<span class="qty-plus" data-max="1"><i class="ion-ios-plus-outline"></i></span>
															</div>
														</div>
														<input type="hidden" name="PRODUCT_ID" value="${product.PRODUCT_ID}">
														<button type="button" class="single-add-to-cart" id="buyBtn">바로 구매하기</button>
													</form>
													<div class="product-tool">
													<a href="javascript:void(0);" onclick="addCart(${product.PRODUCT_ID}, '${USER_ID}');" data-toggle="tooltip" data-placement="top" title="찜 목록에 추가"> 찜 목록에 추가 </a>
												</div>
												</c:when>
												<c:otherwise>
													<h4>재고 없음</h4>
												</c:otherwise>
											</c:choose>
											
											<div class="product-meta">
												<div class="row">
													<div class="col-12">
														<div class="row">
															<div class="col-xs-6 col-sm-6 col-md-6">
																<span>카테고리</span>
															</div>
															<div class="col-xs-6 col-sm-6 col-md-6">
																<a href="/rudisfarm/product?page=1&type1=${product.TYPE1}&type2=${product.TYPE2}" style="text-align: right;">${product.TYPE1} > ${product.TYPE2}</a>
															</div>						
														</div>
<!-- 														<div class="col-12"> -->
<!-- 															<div id="curve_chart" style="width:100%"></div> -->
<!-- 														</div> -->
													</div>
												</div>
<!-- 												<table> -->
<!-- 													<tbody> -->
<!-- 														<tr> -->
<!-- 															<td class="label">카테고리</td> -->
<%-- 															<td><a href="/rudisfarm/product?page=1&type1=${product.TYPE1}&type2=${product.TYPE2}">${product.TYPE1}, ${product.TYPE2}</a></td> --%>
<!-- 														</tr> -->
<!-- 														<tr> -->
<!-- 															<td colspan="2"><div id="curve_chart" style="width:100%"></div></td> -->
<!-- 														</tr> -->
<!-- 														<tr> -->
<!-- 															소셜로 추가하기 등 버튼들이 있던 곳 -->
<!-- 														</tr> -->
<!-- 													</tbody> -->
<!-- 												</table> -->
											</div>
										</div>
									</div>
									<div class="col-md-12">
										<br>
										<div id="curve_chart" style="width:100%; border-top:1px solid #E6E6E6; border-bottom:1px solid #E6E6E6;"></div>
									</div>
									<div class="col-md-12" id="tabs">
										<div class="commerce-tabs tabs classic">
											<ul class="nav nav-tabs tabs">
												<li class="<c:if test="${cfr ne 't'}">active</c:if>">
													<a style="background-color:#f5f3f0;" data-toggle="tab" href="#tab-description" aria-expanded="<c:if test="${cfr ne 't'}">true</c:if>">상세보기</a>
												</li>
												<li class="<c:if test="${cfr eq 't'}">active</c:if>">
													<a style="background-color:#f5f3f0;" data-toggle="tab" href="#tab-reviews" aria-expanded="<c:if test="${cfr eq 't'}">false</c:if>">리뷰</a>
												</li>
											</ul>
											<div class="tab-content">
												<div class="tab-pane fade <c:if test="${cfr ne 't'}">active in</c:if>" id="tab-description">
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
																<div id="collapse10" class="accordion-body collapse in" style=" background-color:#f5f3f0;">
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
												<div id="tab-reviews" class="tab-pane fade <c:if test="${cfr eq 't'}">active in</c:if>">
												<div class="col-md-6 p-1">
													<h3 class="comment-title">${reviewQuantity }개의 구매 후기가 있습니다.</h3>
												</div>
												<div class="col-sm-6 col-md-3 p-1">
													<div class="product-rating">
														<h4 class="comment-title">상품 평균 별점</h4>&nbsp;${productRatingAvg}&nbsp;
														<div class="star-rating">
															<span style="width:${productRatingAvg*20 }%"></span>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-3 p-1">
													<div class="product-rating">
														<h4 class="comment-title">판매자 평균 별점</h4>&nbsp;${sellerRatingAvg}&nbsp;
														<div class="star-rating">
															<span style="width:${sellerRatingAvg*20 }%"></span>
														</div>
													</div>
												</div>
												<br><br>
													<div class="single-comments-list mt-0">
													<c:forEach var="review" items="${reviewlist}" varStatus="status">
														<ul class="comment-list">
<!-- 															<li> -->
<!-- 																<div class="comment-container"> -->
<!-- 																	<div class="comment-author-vcard"> -->
<%-- 																		<img alt="" src="<%= request.getContextPath() %>/resources/bootstrap/images/avatar/avatar_100x100.jpg" /> --%>
<!-- 																	</div> -->
<!-- 																	<div class="comment-author-info"> -->
<!-- 																		<span class="comment-author-name">admin</span> -->
<!-- 																		<a href="#" class="comment-date">July 27, 2016</a> -->
<!-- 																		<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
<!-- 																	</div> -->
<!-- 																	<div class="reply"> -->
<!-- 																		<a class="comment-reply-link" href="#">Reply</a> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 																<ul class="children"> -->
<!-- 																	<li> -->
<!-- 																		<div class="comment-container"> -->
<!-- 																			<div class="comment-author-vcard"> -->
<%-- 																				<img alt="" src="<%= request.getContextPath() %>/resources/bootstrap/images/avatar/avatar_100x100.jpg" /> --%>
<!-- 																			</div> -->
<!-- 																			<div class="comment-author-info"> -->
<!-- 																				<span class="comment-author-name">admin</span> -->
<!-- 																				<a href="#" class="comment-date">July 27, 2016</a> -->
<!-- 																				<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
<!-- 																			</div> -->
<!-- 																			<div class="reply"> -->
<!-- 																				<a class="comment-reply-link" href="#">Reply</a> -->
<!-- 																			</div> -->
<!-- 																		</div> -->
<!-- 																	</li> -->
<!-- 																</ul> -->
<!-- 															</li> -->
															<li>
																<div class="row" id="reviewid_${review.REVIEW_ID}">
																	<div class="comment-container">
																		<div class="row">
																			<div class="col-md-1 p-1">
																				No.${status.count }
																			</div>
																			<div class="col-md-11">
																				<div class="col-sm-12 col-md-6 p-1">
																					<div class="comment-author-info">
																						<span class="comment-author-name">${review.USER_ID }</span>
																						<a class="comment-date">${review.WRITEDATE }</a>
																					</div>
																				</div>
																				<div class="col-sm-12 col-md-5 p-1" style="text-align: right;">
																						<div class="product-rating">
																							상품 별점&nbsp;${review.PRODUCT_RATING}&nbsp;
																							<div class="star-rating">
																								<span style="width:${review.PRODUCT_RATING*20 }%"></span>
																							</div>
																						</div>
																						<div class="product-rating">
																							판매자 별점&nbsp;${review.SELLER_RATING}&nbsp;
																							<div class="star-rating">
																								<span style="width:${review.SELLER_RATING*20 }%"></span>
																							</div>
																						</div>
																				</div>
																				<div class="col-sm-12 col-md-12 p-1">
																					<p>${review.CONTENT }</p>
																				</div>
																				<div class="col-sm-12 col-md-12 p-1">
																					<c:if test="${review.FILES!=''}">
																						<c:forEach var="image" items="${fn:split(review.FILES, '/') }" varStatus="imageCount">
																							<a href="<%= request.getContextPath() %>/resources/upload/images/review/user1/${image }"><img src="<%= request.getContextPath() %>/resources/upload/images/review/user1/${image }" width="400" alt="${image }">&nbsp;</a>
																						<c:if test="${imageCount.count%2==0}">
																							<br><br>
																						</c:if>
																						</c:forEach>
																					</c:if>
																				</div>
																				
																			</div>
																		</div>
																	</div>
																</div>
															</li>
														</ul>
													</c:forEach>
													</div>
<!-- 													<div class="single-comment-form mt-0">
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
													</div> -->
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
										<ul class="product-categories" id="product-categories">
										</ul>
										
									</div>
									<div class="widget widget-products">
										<h3 class="widget-title">이런 상품은 어떠세요?</h3>
										<ul class="product-list-widget" id="product-list-widget">
										</ul>
									</div>
									<div class="widget widget-tags">
										<h3 class="widget-title">태그</h3>
										<div class="tagcloud" id="tagcloud">
										</div>
									</div>
									<div class="widget widget-tags">
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
		</div>
		
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
		<script type='text/javascript' src='<%= request.getContextPath() %>/resources/bootstrap/js/slick.min.js'></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/script.js"></script>
	</body>
</html>