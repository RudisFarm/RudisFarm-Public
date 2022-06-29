<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header id="header" class="header header-desktop header-3">

<script type="text/javascript">
	
	$(function() {
		function click_remove(cartid){
			$.ajax({
				type : 'DELETE',         
				url: '${pageContext.request.contextPath}/my-page/my-cart', 
				dataType: 'json',
				contentType: 'application/json; charset=utf-8;',
				data : JSON.stringify({
					CART_ID : cartid
				
				}),
				
				success : function(data) {
					console.log("수신 성공");
					console.log(data);
					location.reload();				
					
				},
				error: function(data) {
					console.log("에러 발생!");
					console.log(data)
				}
			});
		}
	});
</script>

	<div class="top-search">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<form action="/rudisfarm/product">
						<input type="search" class="top-search-input" name="keyword" placeholder="찾으시는 상품이 있으신가요?" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			<a class="page-title-index text-center" style="text-transform: none; text-decoration: none;" href="<%= request.getContextPath() %>" id="logo">
					RudisFarm
<%-- style="color: white;"					<img class="logo-image" src="<%= request.getContextPath() %>/resources/bootstrap/images/logo_white.png" alt="메인 로고" /> --%>
				</a>
<!-- 			<nav class="menu"> -->
<!-- 				<ul class="main-menu"> -->
<!-- 				<li> -->
				
<!-- 				</li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->
			</div>
			<div class="col-md-9">
				<div class="header-right">
					<nav class="menu">
						<ul class="main-menu">
<%-- 							<c:if test="${map.productTypeList ne null}">
							<c:forEach var="productType" items="${map.productTypeList}">
								<li>
									<a href="/rudisfarm/product?type1=${$productType.TYPE1}">${productType.TYPE1}</a>
								</li>
							</c:forEach>
							</c:if> --%>	
							<li>
								<a href="/rudisfarm/product">전체 상품</a>
							</li>
						</ul>
					</nav>
					<div class="btn-wrap">
					<c:choose>
						<c:when test="${not empty USER_ID}">
							<div class="mini-cart-wrap">
								<div class="mini-cart">
									<div class="mini-cart-icon" data-count="">
										<i class="ion-bag"></i>
									</div>
								</div>
								<div class="widget-shopping-cart-content">
									<ul class="cart-list">
									
									</ul>
									<p class="total">
										<strong>총합 금액 : </strong> 
										<span class="amount"></span>
									</p>
									<p class="buttons">
										<a href="<%= request.getContextPath() %>/my-page/my-cart" class="view-cart">내 찜 목록보기</a>
									</p>
								</div>
							</div>						
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>			
							
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
					<a class="page-title text-center" style="color: black; font-size: 40px" href="/rudisfarm" id="logo">
						RudisFarm
<%-- 						<img class="logo-image" src="<%= request.getContextPath() %>/resources/bootstrap/images/logo.png" alt="Organik Logo" /> --%>
					</a>
				</div>
			</div>
			<div class="col-xs-2">
				<div class="header-right">
					<c:choose>
					<c:when test="${not empty USER_ID}">
					<div class="mini-cart-wrap">
						<a href="/rudisfarm/my-page/my-cart">
							<div class="mini-cart">
								<div class="mini-cart-icon" data-count="">
									<i class="ion-bag"></i>
								</div>
							</div>
						</a>
					</div>
					</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</header>