<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
<link rel="shortcut icon" href="images/favicon.ico" />
<title>장바구니</title>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/font-awesome.min.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/ionicons.min.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/owl.carousel.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/owl.theme.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/prettyPhoto.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/style.css"
	media="all">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/bootstrap/css/custom.css"
	media="all">
<link
	href="//fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-migrate.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/modernizr-2.7.1.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/owl.carousel.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.countdown.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.prettyPhoto.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.prettyPhoto.init.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/bootstrap/js/script.js"></script>
<jsp:include page="/resources/bootstrap/commons/head.jsp"/>
<script type="text/javascript">
	function click_count(cartid){
		var price = $("#price" + cartid).val();
		var num =$("#qtyN" + cartid).val();
		var pid =$("#pid" + cartid).val();
		var pay = 0;
	 	pay =  price * num;
	 	var payType = pay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 	
	 	intNum = parseInt(num)
	 	$("#pay"+cartid).val(payType + " 원");
	 	
	 

		$.ajax({
			type : 'PUT',         
			url: '${pageContext.request.contextPath}/my-page/my-cart', 
			dataType: 'json',
			contentType: 'application/json; charset=utf-8;',
			data : JSON.stringify({
				CART_ID : cartid, 
				COUNT : intNum,
				PRODUCT_ID : pid
			}),
			
			success : function(data) {
				if(data == false) {
					alert("해당 상품의 재고량보다 주문 수량이 많습니다.");
					$("#qtyN" + cartid).val($("#qtyN" + cartid).val()-1);
				} else {
				$("input[id="+cartid+"]").prop("checked", true);
				 var sum = 0;
			        $('.chkMaintain').each(function(){ // 2번 알고리즘 실행
			        	if ($(this).is(":checked") == true) 
			        {
			        var price_goods = parseInt($(this).parents('tr').find('input[name=price]').val());
			        var num_goods = parseInt($(this).parents('tr').find('input[name=num]').val());
			        var pay_goods = 0;
			        var pay_goods = price_goods * num_goods;
			        sum = sum + pay_goods;
			     
			        
			        	 }
			         });
			  		 if(sum >= 30000){
			  		   var payType = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			  	        $('#total').val(payType +" 원");
			  	      	$('#pass').val(0)
			  			$('#totalPay').val(payType+" 원");
			  	       	} else{
			  	       		rpay = sum+2500;
			  	       	var payType = rpay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			  	        $('#total').val(payType+" 원");
			  	        $('#pass').val("2,500")
			  	  		$('#totalPay').val(payType + " 원");
			  	       	}
				}
				
			},
			error: function(data) {
				
			}
		});
	}
	
	function click_delete(cartid){
		$.ajax({
			type : 'DELETE',         
			url: '${pageContext.request.contextPath}/my-page/my-cart', 
			dataType: 'json',
			contentType: 'application/json; charset=utf-8;',
			data : JSON.stringify({
				CART_ID : cartid
			}),
			
			success : function(data) {
				$("#cart"+cartid).remove();
	
				$("input[id="+cartid+"]").prop("checked", true);
				
				 var sum = 0;
			        $('.chkMaintain').each(function(){ // 2번 알고리즘 실행
			        	if ($(this).is(":checked") == true) 
			        {
			        var price_goods = parseInt($(this).parents('tr').find('input[name=price]').val());
			        var num_goods = parseInt($(this).parents('tr').find('input[name=num]').val());
			        var pay_goods = 0;
			        var pay_goods = price_goods * num_goods;
			        sum = sum + pay_goods;
			     
			        
			        	 }
			         });
			  		 if(sum >= 30000){
			  		   var payType = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			  	        $('#total').val(payType +" 원");
			  	      	$('#pass').val(0)
			  			$('#totalPay').val(payType+" 원");
			  	       	} else{
			  	       		rpay = sum+2500;
			  	       	var payType = rpay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			  	        $('#total').val(payType+" 원");
			  	        $('#pass').val("2,500")
			  	  		$('#totalPay').val(payType + " 원");
			  	       	}
				

				
				
			},
			error: function(data) {
				console.log("에러 발생!");
			}
		});
	}
	
	function allCk(obj){
		      var chkObj = document.getElementsByName("rowCheck");
		      var rowCnt = chkObj.length - 1;
		      var check = obj.checked;
		      if (check) {
		    	  $(".allCheck").prop("checked", true);
		    	  $('#delete_cart').val("전체 삭제");﻿
		          for (var i=0; i<=rowCnt; i++){
		           if(chkObj[i].type == "checkbox")
		               chkObj[i].checked = true;
		         
		          }
		      } else {
		    	  $(".allCheck").prop("checked", false);
		    	  $('#delete_cart').val("선택 삭제");
		          for (var i=0; i<=rowCnt; i++) {
		           if(chkObj[i].type == "checkbox"){
		               chkObj[i].checked = false;
		          
		           }
		          }
		      }
		  }
$(function() {
		$('.allCheck, .chkMaintain').click(function(){
			var chkL = $('input:checkbox[name="rowCheck"]').length
			var chkS = $('input:checkbox[name="rowCheck"]:checked').length
			

			if(chkS == chkL ){
				 $(".allCheck").prop("checked", true);
				  $('#delete_cart').val("전체 삭제");
			}else{
				 $(".allCheck").prop("checked", false);
				 $('#delete_cart').val("선택 삭제");
			}
	
		
	        var sum = 0;
	        $('.chkMaintain').each(function(){ // 2번 알고리즘 실행
	        	if ($(this).is(":checked") == true) 
	        {
	        var price_goods = parseInt($(this).parents('tr').find('input[name=price]').val());
	        var num_goods = parseInt($(this).parents('tr').find('input[name=num]').val());
	        var pay_goods = 0;
	        var pay_goods = price_goods * num_goods;
	        sum = sum + pay_goods;
	     
	        
	        	 }
	         });
	  		 if(sum >= 30000){
	  		   var payType = sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  	        $('#total').val(payType +" 원");
	  	      	$('#pass').val(0)
	  			$('#totalPay').val(payType+" 원");
	  	       	} else{
	  	       		rpay = sum+2500;
	  	       	var payType = rpay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  	        $('#total').val(payType+" 원");
	  	        $('#pass').val("2,500")
	  	  		$('#totalPay').val(payType + " 원");
	  	       	}
	    console.log(payType);
		});
		
});

	 
	function deleteCk(){
		var valueArr = new Array();
		 var cart = $("input[name='rowCheck']");

		  for(i=0; i < cart.length; i++){
		   if(cart[i].checked){ //선택되어 있으면 배열에 값을 저장
			  	 valueArr.push(cart[i].value);
		    }
		  }
		  if(valueArr.length == 0){
		   alert("삭제할 상품을 체크해 주세요.");
		  } else {
		  var agree=confirm("삭제 하시겠습니까?");
		  if(agree){
				  console.log(valueArr)
				   var data ={"valueArr":valueArr}
				  jQuery.ajaxSettings.traditional = true;
				    $.ajax({
				 		type :'POST',         
				 		url: '${pageContext.request.contextPath}/my-page/my-cart/delete', 
				 		dataType: 'json',
				 		data : data,
				 			
				 		success : function(data) {
				 			console.log("수신 성공");
				 			location.reload();	
				 				
				 		},
				 		error: function(data) {
				 			console.log("에러 발생!");
				 			console.log(data)
				 		}
				 	});	 
				 }
		  }
	}


	
</script>
<script type="text/javascript">
		function productCountCheck(pId, cartId) {
			console.log(pId + "," +$('#qtyN'+cartId).val() );
			
			$.ajax({
				type : 'POST',         
				url: '/rudisfarm/product/count', 
				dataType: 'json',
				contentType: 'application/json; charset=utf-8;',
				data : JSON.stringify({
					PRODUCT_ID : pId,
					COUNT : $('#qtyN'+cartId).val()
				}),
				success : function(data) {
					if(data) {
						$('#cartBuyForm'+cartId).submit();
					} else {
						alert("해당 상품의 재고량보다 주문 수량이 많습니다.")
					}
				},
				error: function(data) {
					console.log("에러 발생!");
				}
			});	
		}
	</script>
</head>
<body>
	<jsp:include page="/resources/bootstrap/commons/menu_slideout.jsp" />
	<div class="site">
		<jsp:include page="/resources/bootstrap/commons/topbar.jsp" />
		<jsp:include page="/resources/bootstrap/commons/header.jsp"/>
		<div id="main">
			<div class="section section-bg-10 pt-11 pb-17">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<h2 class="page-title text-center">찜 목록</h2>
						</div>
					</div>
				</div>
			</div>
			<div class="section border-bottom pt-2 pb-2">
				<div class="container">
					<div class="row">
						<div class="col-sm-12">
							<ul class="breadcrumbs">
								<li><a href="/rudisfarm">메인페이지</a></li>
								<li>찜 목록</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="section pt-7 pb-7">
				<div class="container">
					<input class="allCheck" type="checkbox" name='allck'
						onclick="allCk(this)" checked /><strong>&nbsp;&nbsp;전체 선택</strong>
					<div class="row" style="word-break:keep-all;">
						<div class="col-md-8">
							<table class="table shop-cart">
								<tbody id="newList">
									<c:choose>
									<c:when test="${fn:length(map.list) > 0}">
									<c:forEach var="cart" items="${map.list}">
												<tr class="cart_item" id="cart${cart.CART_ID}">
													<td>
														<div class="row" style="margin: 0px">
															<div class="col-12">
																<div class="row" style="margin: 0px">
																	<div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
																		&nbsp;&nbsp;<input class="chkMaintain" id="${cart.CART_ID}"
																				type='checkbox' name='rowCheck' value='${cart.CART_ID}'
																				checked />
																	</div>
																	<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 ">
																		<a href="#" class="remove" onclick="click_delete(${cart.CART_ID})">×</a>
																	</div>
																</div>
																<div class="row" style="margin: 0px">
																	<div class="col-xs-12 col-sm-6 col-md-3 col-lg-3">
																		<a href="/rudisfarm/product/${cart.PRODUCT_ID}">
																				<img
																				src="/rudisfarm/resources/upload/images/product/${cart.PRODUCT_ID}/${cart.SUMNAIL}"
																				alt="찜목록 이미지">
																		</a>
																	</div>
																	<div class="col-xs-12 col-sm-6 col-md-9 col-lg-9">
																		<div class="row" style="margin: 0px">
																			<div class="col-xs-6 col-sm-12 col-md-6 col-lg-6" align="center">
																				<a href="/rudisfarm/product/${cart.PRODUCT_ID}">${cart.PRODUCT_NAME}</a>
																				<fmt:formatNumber
																						value="${cart.PRICE}" pattern="#,###,###원" /> <input
																				id="price${cart.CART_ID}" type="hidden" name="price"
																				value="${cart.PRICE}">
																			</div>
																			<div class="col-xs-6 col-sm-12 col-md-6 col-lg-6 p-1" align="center">
																				<div class="quantity"> 
																				
						 															<input id="qtyN${cart.CART_ID}" type="number" min="1" 
						 																name="num" onclick="click_count(${cart.CART_ID})" value="${cart.COUNT}" 
						 																class="input-text qty text" size="4"> 
						 															<input id="cartid" type="hidden" name="cart_id"
																						value="${cart.CART_ID}"> 
						 															<input id="pid${cart.CART_ID}" type="hidden" value="${cart.PRODUCT_ID}"> 
						 														</div> 
																			</div>
																			<div class="col-xs-6 col-sm-12 col-md-6 col-lg-6 p-1" align="center">
																				<strong><input
																				id="pay${cart.CART_ID}" type="text"
																				style="text-align: center; border: none; font-size: 20px;"
																				value="<fmt:formatNumber value="${cart.PAY}" pattern="#,###,###원" />"
					 															readonly></strong>
																			</div>
																			<div class="col-xs-6 col-sm-12 col-md-6 col-lg-6 p-1" align="center">
																				<form action="/rudisfarm/orders-payment" method="POST" id="cartBuyForm${cart.CART_ID}">
																					<input type="hidden" value="${cart.CART_ID}" name="CART_ID">
																					<input type="button" class="update-cart" value="구매" id="cartBuyBtn${cart.CART_ID}" onclick="javascript:productCountCheck(${cart.PRODUCT_ID} ,${cart.CART_ID});"/>
																				</form>
																			</div>
																		</div>
																	</div>
									
<!-- 																	<div class="col-md-2 col-lg-2"> -->
<%-- 																		<span class="amount"><fmt:formatNumber --%>
<%-- 																								value="${cart.PRICE}" pattern="#,###,###원" /></span> <input --%>
<%-- 																								id="price${cart.CART_ID}" type="hidden" name="price" --%>
<%-- 																								value="${cart.PRICE}"> --%>
<!-- 																	</div> -->
																	
																</div>
															</div>
<!-- 															<div class="col"> -->
<!-- 																<div class="row" style="margin: 0px"> -->
																	
<!-- 																	<div class="col-md-10 col-lg-10"> -->
<!-- 																		<form action="/rudisfarm/orders-payment" method="POST"> -->
<%-- 																			<input type="hidden" value="${cart.CART_ID}" name="CART_ID"> --%>
<!-- 																			<input type="submit" class="update-cart" value="구매" /> -->
<!-- 																		</form> -->
<!-- 																	</div> -->
<!-- 																</div> -->
<!-- 															</div> -->
														</div>
													</td>
													</tr>
<%-- 													<td><input class="chkMaintain" id="${cart.CART_ID}" --%>
<%-- 														type='checkbox' name='rowCheck' value='${cart.CART_ID}' --%>
<!-- 														checked /></td> -->
<!-- 													<td class="product-thumbnail"><a href="shop-detail.html"> -->
<!-- 															<img -->
<%-- 															src="/rudisfarm/resources/upload/images/product/${cart.PRODUCT_ID}/${cart.SUMNAIL}" --%>
<!-- 															alt="찜목록 이미지"> -->
<!-- 													</a></td> -->
<%-- 													<td class="product-info"><a href="shop-detail.html">${cart.PRODUCT_NAME}</a> --%>
<%-- 														<span class="amount"><fmt:formatNumber --%>
<%--  																value="${cart.PRICE}" pattern="#,###,###원" /></span> <input --%> 
<%--  														id="price${cart.CART_ID}" type="hidden" name="price" --%> 
<%--  														value="${cart.PRICE}"></td> --%> 
<!-- 													<td class="product-quantity"> -->
<!-- 														<div class="quantity"> --> 
<%--  															<input id="qtyN${cart.CART_ID}" type="number" min="0" --%> 
<%--  																name="num" onclick="click_count(${cart.CART_ID})" --%> 
<%-- 																value="${cart.COUNT}" class="input-text qty text" size="4"> --%> 
<!--  															<input id="cartid" type="hidden" name="cart_id" -->
<%-- 																value="${cart.CART_ID}"> --%> 
<!--  														</div> --> 
<!-- 													</td> --> 
<!--  													<td> --> 
<!--  														텍스트1 --> 
<!--  													</td> --> 
<!--  													<td> --> 
<!--  														텍스트2 --> 
<!--  													</td> --> 
<!-- 													<td class="product-subtotal"><strong><input -->
<%--  															id="pay${cart.CART_ID}" type="text" --%> 
<!--  															style="text-align: right; border: none; font-size: 20px;" -->
<%--  															value="<fmt:formatNumber value="${cart.PAY}" pattern="#,###,###원" />" --%> 
<!--  															readonly></strong></td> -->
<!--  													<td class="product-remove"><a href="#" class="remove" -->
<%--  														onclick="click_delete(${cart.CART_ID})">×</a> --%> 
														
<!-- 													<form action="/rudisfarm/orders-payment" method="POST"> --> 
<%-- 														<input type="hidden" value="${cart.CART_ID}" name="CART_ID"> --%> 
<!-- 														<input type="submit" class="update-cart" value="구매" /> --> 
<!--  													</form> --> 
<!--  													</td> --> 
<!-- 												</tr> -->
<!-- 												<tr> -->
<!-- 													<td> -->
<!-- 														<input type="submit" val> -->
<!-- 													</td> -->
<!-- 												</tr> -->
										</c:forEach>
										</c:when>
										<c:otherwise>
									   		<tr class="cart_item">
												<td class="product-info">추가된 상품이 없어요!</td>
											</tr>
										</c:otherwise>
									</c:choose>
									<tr>
										<td colspan="6" class="actions"><input class="allCheck"
											type="checkbox" name='allck' onclick="allCk(this)" checked /><strong>&nbsp&nbsp전체
												선택</strong><input type="button" class="update-cart"
											name="delete_cart" onclick="location.href='/rudisfarm/product'" value="계속 쇼핑하기" /> <input
											type="button" class="update-cart" id="delete_cart"
											name="delete_cart" onclick="deleteCk()" value="전체 삭제" /></td>
									</tr>
								</tbody>
							</table>
						</div>
						
						
<!-- 						<div class="col-md-8"> -->
<!-- 							<table class="table shop-cart"> -->
<!-- 								<tbody id="newList"> -->
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${fn:length(map.list) > 0}"> --%>
<%-- 											<c:forEach var="cart" items="${map.list}"> --%>
<%-- 												<tr class="cart_item" id="${cart.CART_ID}"> --%>
<%-- 													<td><input class="chkMaintain" id="${cart.CART_ID}" --%>
<%-- 														type='checkbox' name='rowCheck' value='${cart.CART_ID}' --%>
<!-- 														checked /></td> -->
<!-- 													<td class="product-thumbnail"><a href="shop-detail.html"> -->
<!-- 															<img -->
<%-- 															src="/rudisfarm/resources/upload/images/product/${cart.PRODUCT_ID}/${cart.SUMNAIL}" --%>
<!-- 															alt="찜목록 이미지"> -->
<!-- 													</a></td> -->
<%-- 													<td class="product-info"><a href="shop-detail.html">${cart.PRODUCT_NAME}</a> --%>
<%-- 														<span class="amount"><fmt:formatNumber --%>
<%-- 																value="${cart.PRICE}" pattern="#,###,###원" /></span> <input --%>
<%-- 														id="price${cart.CART_ID}" type="hidden" name="price" --%>
<%-- 														value="${cart.PRICE}"></td> --%>
<!-- 													<td class="product-quantity"> -->
<!-- 														<div class="quantity"> -->
<%-- 															<input id="qtyN${cart.CART_ID}" type="number" min="0" --%>
<%-- 																name="num" onclick="click_count(${cart.CART_ID})" --%>
<%-- 																value="${cart.COUNT}" class="input-text qty text" size="4"> --%>
<!-- 															<input id="cartid" type="hidden" name="cart_id" -->
<%-- 																value="${cart.CART_ID}"> --%>
<!-- 														</div> -->
<!-- 													</td> -->
<!-- 													<td class="product-subtotal"><strong><input -->
<%-- 															id="pay${cart.CART_ID}" type="text" --%>
<!-- 															style="text-align: right; border: none; font-size: 20px;" -->
<%-- 															value="<fmt:formatNumber value="${cart.PAY}" pattern="#,###,###원" />" --%>
<!-- 															readonly></strong></td> -->
<!-- 													<td class="product-remove"><a href="#" class="remove" -->
<%-- 														onclick="click_delete(${cart.CART_ID})">×</a> --%>
														
<!-- 													<form action="/rudisfarm/orders-payment" method="POST"> -->
<%-- 														<input type="hidden" value="${cart.CART_ID}" name="CART_ID"> --%>
<!-- 														<input type="submit" class="update-cart" value="구매" /> -->
<!-- 													</form> -->
<!-- 													</td> -->
<!-- 												</tr> -->
<%-- 											</c:forEach> --%>
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<!-- 									   		<tr class="cart_item"> -->
<!-- 												<td class="product-info">추가된 상품이 없어요!</td> -->
<!-- 											</tr> -->
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose>	 --%>
<!-- 									<tr> -->
<!-- 										<td colspan="6" class="actions"><input class="allCheck" -->
<!-- 											type="checkbox" name='allck' onclick="allCk(this)" checked /><strong>&nbsp&nbsp전체 -->
<!-- 												선택</strong><input type="button" class="update-cart" -->
<!-- 											name="delete_cart" onclick="location.href='/rudisfarm/product'" value="계속 쇼핑하기" /> <input -->
<!-- 											type="button" class="update-cart" id="delete_cart" -->
<!-- 											name="delete_cart" onclick="deleteCk()" value="전체 삭제" /></td> -->
<!-- 									</tr> -->
<!-- 								</tbody> -->
<!-- 							</table> -->
<!-- 						</div> -->
						<div class="col-md-4">
							<div class="cart-totals">
								<table>
									<tbody>
										<tr class="cart-subtotal">
											<th>총 상품가격</th>
											<td><input type="text"
												style="text-align: right; background-color: #222; border: none; color: white;"
												value="<fmt:formatNumber value="${map.sumMoney}" pattern="#,###,###원" />"
												id="total" readonly></td>

										</tr>
										<tr class="shipping">
											<th>배 송 료</th>
											<td><input type="text"
												style="text-align: right; background-color: #222; border: none; color: white;"
												value="<fmt:formatNumber value="${map.fee}" pattern="#,###,###원" />"
												id="pass" readonly></td>
										</tr>
										<tr class="order-total">
											<th>총 주문금액</th>
											<td><strong><input type="text"
													style="text-align: right; background-color: #222; border: none; color: white;"
													value="<fmt:formatNumber value="${map.sum}" pattern="#,###,###원" />"
													id="totalPay" readonly></strong></td>

										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
	</div>
</body>
</html>

		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/categori-header.js"></script>
		<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/cart-list.js"></script>
