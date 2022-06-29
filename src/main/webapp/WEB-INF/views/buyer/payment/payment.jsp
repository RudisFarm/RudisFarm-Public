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
<link rel="shortcut icon" href="<%= request.getContextPath() %>/resources/bootstrap/images/favicon.ico"/>
<title>RudisFarm &#8211; 결제 페이지</title>

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
<!-- <script type="text/javascript" -->
<%-- 	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/sort.js?v=<%=System.currentTimeMillis()%>"></script> --%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/bootstrap/js/product-js/add-cart.js?v=<%=System.currentTimeMillis()%>"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#tryPay').click(function() {
			var sendList = [];
				var newJson = {
						product_id: $('#item-product_id').val(),
						item_name: $('#item-product_name').html(),
						quantity: $('#item-product_quantity').html(),
						total_amount: $('#item-product_total_amount').html()
				};
				sendList.push(newJson);
			
			console.log(sendList);
			
			event.preventDefault();

    		var getName = RegExp(/^[가-힣a-zA-Z]{2,15}$/);
    		var getPhone = RegExp(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/);
    		
    		var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
    		
    		//이름 공백 검사
    		if($("#USER_NAME").val() == "") {
    			alert("주문자 이름을 입력해주세요.");
    			$("#USER_NAME").focus();
    			return false;
    		}
    		
    		//주소 공백 검사
    		if($("#FIR_ADDRESS").val() == "") {
    			alert("주소를 입력해주세요.");
    			$("#FIR_ADDRESS").focus();
    			return false;
    		}
    		
    		//상세주소 공백 검사
    		if($("#SEC_ADDRESS").val() == "") {
    			alert("상세주소를 입력해주세요.");
    			$("#SEC_ADDRESS").focus();
    			return false;
    		}

    		//전화번호 유효성 검사
    		if(!getPhone.test($("#PHONE").val())) {
    			alert("전화번호 형식에 맞게 입력해주세요.")
    			$("#PHONE").val("");
    			$("#PHONE").focus();
    			return false;
    		}
			
    		var success=confirm("결제 하시겠습니까?");
    		
		if (success) {
			$.ajax({
				type: 'POST',
				url: '/rudisfarm/payment/kakaopay', 
				dataType: 'json',
				contentType: 'application/json; charset=utf-8;',
				data: JSON.stringify({
							test : sendList,
							USER_NAME: $("#USER_NAME").val(),
							PHONE: $("#PHONE").val(),
							FIR_ADDRESS: $("#FIR_ADDRESS").val(),
							SEC_ADDRESS: $("#SEC_ADDRESS").val(),
							DELIVERY_MESSAGE: $("#DELIVERY_MESSAGE").val()
						}), 
				success: function(data) {
					console.log("성공적으로 전달!");
					console.log(data);
					location.href=data.resultUrl;
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
		}
		});
	});
</script>
<script>
/* 주소 찾기 */
//https://postcode.map.daum.net/guide#sample 참조
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("FIR_ADDRESS").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("SEC_ADDRESS").focus();
            }
        }).open();
    }
</script>
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
								<h2 class="page-title text-center">결제 정보</h2>
							</div>
						</div>
					</div>
				</div>
				<div class="section border-bottom pt-2 pb-2">
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumbs">
									<li>결제 정보</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="section pt-7 pb-7">
				<h3 class="page-title text-center color" style="text-align: center;">RudisFarm</h3>
					<div class="container">
						<div class="row">
						  <div class="col-md-3"></div>
							<div class="col-md-6 p-3">
								<div class="commerce">
									<h2 style="text-align:center;">결제 정보</h2>
										<br>
										<div class="row">
											<div class="col-md-12">
												<label>주문자 성명 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="text" placeholder="예)홍길동" id="USER_NAME" name="USER_NAME" value="${user.USER_NAME}" size="40" required>
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-md-12">
												<label>주소 <span class="required" style="display:inline;">*</span></label>
												<input type="button" id="smallbutton" onclick="execDaumPostcode()" value="주소검색" style="display:inline;">
												<div class="form-wrap">
													<input type="text" id="FIR_ADDRESS" name="FIR_ADDRESS" value="${user.FIR_ADDRESS}" placeholder="주소" readonly  required>
												</div>
													<input type="text" id="SEC_ADDRESS" name="SEC_ADDRESS" value="${user.SEC_ADDRESS}" placeholder="상세 주소" required>				
														<input type="hidden" class="inputMaterial" id="postcode" readonly disabled>
														<input type="hidden" class="inputMaterial" id="extraAddress" placeholder="참고항목" disabled>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-md-12">
												<label>연락처 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="text" placeholder="-(하이픈) 없이 번호만 입력해 주세요." id="PHONE" name="PHONE" value="${user.PHONE}" size="40" required>
												</div>
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-md-12">
												<label>배송 메시지 <span class="required">*</span></label>
												<div class="form-wrap">
													<input type="text" placeholder="30자 이내로 작성해 주세요." id="DELIVERY_MESSAGE" name="DELIVERY_MESSAGE" value="" size="40" required>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					<div class="container">
						<div class="row m-3">
							<div class="col-md-8" align="center">
								<table class="table shop-cart">
									<tbody>
										<tr class="cart_item">
											<td></td>
											<td class="product-info">
												<span class="product-subtotal" id="item-product_name" style="font-size:15pt">${product.PRODUCT_NAME}</span>
												<span class="sub-title">RudisFarm</span>
											</td>
											<td class="product-quantity">
												<div class="quantity"><span id="item-product_quantity">${product.COUNT}</span>개</div>
											</td>
											<td class="product-subtotal">
												<span class="quantity" style="font-size:11pt">${product.PRICE}원</span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-md-4">
								<div class="cart-totals">
									<input type="hidden" id="item-product_id" value="${product.PRODUCT_ID}">
									<table>
										<tbody>
											<tr class="order-total">
												<th>상품 총액</th>
												<td><strong id="item-product_total_amount">${product.PRICE*product.COUNT}</strong><strong>원</strong></td>
											</tr>
										</tbody>
									</table>
									<div class="text-center text-center-sm">
										<a id="tryPay" style="cursor:pointer;">
											<img src="<%= request.getContextPath() %>/resources/images/payment_icon_yellow_medium.png" alt="카카오페이" />
										</a>							
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	<jsp:include page="/resources/bootstrap/commons/footer.jsp"/>
	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/add-cart.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/categori-header.js"></script>
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