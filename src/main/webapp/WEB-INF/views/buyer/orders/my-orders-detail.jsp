<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
<link rel="shortcut icon" href="images/favicon.ico" />
<title>RudisFarm 유저 주문 상세내역 리스트</title>

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

<jsp:include page="/resources/bootstrap/commons/head.jsp" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
         <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
         <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
      <style>
#tekbeCompnayList, #invoiceNumberText {
    width: 380px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #190707;
    border: 1px solid #190707;
    border-radius: 3px;
}

#tekbeCompnayName, #invoiceNumber{
  color:black; 
  
  margin-right: 20px;
  font-size: 18px;
}

#myButton1 {
  background: #5858FA;
  background-image: -webkit-linear-gradient(top, #81BEF7, #2E9AFE);
  background-image: -moz-linear-gradient(top, #81BEF7, #2E9AFE);
  background-image: -ms-linear-gradient(top, #81BEF7, #2E9AFE);
  background-image: -o-linear-gradient(top, #81BEF7, #2E9AFE);
  background-image: linear-gradient(to bottom, #81BEF7, #2E9AFE);
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0px;
  font-family: Arial;
  color: #ffffff;
  font-size: 15px;
  padding: 10px 10px 10px 10px;
  text-decoration: none;
}

#myButton1:hover {
  background: #3cb0fd;
  background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
  background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
  background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
  text-decoration: none;
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #E0E0F8;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #E0E6F8;
}

</style>

<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
 <script>

$(document).ready(function(){
	var myKey = "fbaqK9ZeC2B5hJsqRQa1WQ"; // sweet tracker에서 발급받은 자신의 키 넣는다.
	
		// 택배사 목록 조회 company-api
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
            		
            		// 방법 1. JSON.parse 이용하기
            		var parseData = JSON.parse(JSON.stringify(data));
             		console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력
            		
            		// 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
            		var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
            		console.log(CompanyArray); 
            		
            		var myData="";
            		$.each(CompanyArray,function(key,value) {
	            			myData += ('<option value='+value.Code+'>'+ value.Code + " " + value.Name + '</option>');        				
            		});
            		$("#tekbeCompnayList").html(myData);
            }
        });

		// 배송정보와 배송추적 tracking-api
        $("#myButton1").click(function() {
        	//var t_code = $('#tekbeCompnayList option:selected').attr('value');
        	var t_code = $('#tekbeCompnayList').val();
        	var t_invoice = $('#invoiceNumberText').val();
        	//alert(t_code + t_invoice);
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                	console.log(data);
                	var myInvoiceData = "";
                	if(data.status == false){
                		myInvoiceData += ('<p>'+data.msg+'<p>');
                	}else{
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"송장번호"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.invoiceNo+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		           	                		
                	}
        			
                	
                	$("#myPtag").html(myInvoiceData)
                	
                	var trackingDetails = data.trackingDetails;
                	
                	
            		var myTracking="";
            		var header ="";
            		header += ('<tr>');            	
            		header += ('<th>'+"시간"+'</th>');
            		header += ('<th>'+"장소"+'</th>');
            		header += ('<th>'+"유형"+'</th>');    	
        			header += ('</tr>');     
            		
            		$.each(trackingDetails,function(key,value) {
	            		myTracking += ('<tr>');            	
            			myTracking += ('<td>'+value.timeString+'</td>');
            			myTracking += ('<td>'+value.where+'</td>');
            			myTracking += ('<td>'+value.kind+'</td>');
	            		myTracking += ('</tr>');        			            	
            		});
            		
            		$("#myPtag2").html(header+myTracking);
                	
                }
            });
        });
		
});


</script>

      
<script type="text/javascript">
function deleteCheck(id, tid) {
   if(confirm("주문 취소 하시겠습니까?")) {
	   $.ajax({
			type: 'POST',
			url: '/rudisfarm/payment/kakaopaycancel',
			data: JSON.stringify({
				TID: tid
			}),
			contentType: "application/json; charset=utf-8;",
			success: function(data) {
				if(data.resultCode == 1) {
					$.ajax({
						type: 'delete',
						url: '/rudisfarm/my-page/orders/'+ id,
						dataType: 'json',
						contentType: "application/json; charset=utf-8;",
						success: function(data) {
							alert("성공적으로 주문이 취소되었습니다.");
							location.href = '/rudisfarm/my-page/orders';
						},
						error: function(e) {
							console.log("에러 발생!");
							console.log(e);
						}
					});
				} else {
					alert("주문 취소에 실패하였습니다.");
				}
			},
			error: function(e) {
				console.log("에러 발생!");
				console.log(e);
			}
		});
    } 
}

function buyFinishCheck(id) {
	 if(confirm(" 구매 확정하시겠습니까?")) {
		   $.ajax({
				type: 'put',
				url: '/rudisfarm/my-page/orders/'+id, 
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify({
					STATUS: '구매 확정'
				}),
				success: function(data) {
					if(data) {
						alert("성공적으로 구매 확정되었습니다.");
						location.href = window.location.href;
					} else {
						alert("구매 확정에 실패하였습니다.");
					}
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
	    } 
}
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
							<h2 class="page-title text-center">주문 상세</h2>
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
									<li><a href="/rudisfarm/my-page/orders">내 주문목록</a></li>
									<li>내 주문 상세내역</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- MAIN CONTENT-->
			<div class="container pt-7 pb-7">
				<div class="row">
					<div class="col-md-9 col-md-push-3">

						<div class="user-data m-b-30">
							<h3 class="title-3 m-b-30">보내는 사람: ${getsellerinfo.USER_ID}</h3>

							<div class="table-responsive table-data">
								<table class="table">
									<thead>
										<tr>
											<td>판매자 이름</td>
											<td>전화번호</td>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${getsellerinfo.USER_NAME}</td>
											<td>${getsellerinfo.PHONE}</td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td>이메일</td>
											<td>주소</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${getsellerinfo.EMAIL}</td>
											<td>${getsellerinfo.FIR_ADDRESS}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${getsellerinfo.SEC_ADDRESS }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="user-data m-b-30">
							<h3 class="title-3 m-b-30">받는 사람: ${getorders.USER_ID}</h3>

							<div class="table-responsive table-data">
								<table class="table">
									<thead>
										<tr>
											<td width="47%">주문자 이름</td>
											<td>주문번호</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${getorders.USER_NAME}</td>
											<td>${getorders.ORDERS_NAME}</td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td>상품명</td>
											<td>개수</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${product.PRODUCT_NAME}</td>
											<td>${getorders.COUNT}</td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td>금액</td>
											<td>총 금액</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${getorders.PRICE}</td>
											<td>${getorders.TOTAL_PRICE}</td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td>전화번호</td>
											<td>주소</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${getorders.PHONE}</td>
											<td>${getorders.FIR_ADDRESS}<br>${getorders.SEC_ADDRESS }</td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td>택배회사명</td>
											<td>운송장 번호</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${getorders.TRACKING_NAME}</td>
											<td id="ordersStatus">${getorders.TRACKING_NUMBER}&nbsp;&nbsp;<c:if test="${getorders.TRACKING_NUMBER ne null}"><button id="myButton1"> 택배 조회하기 </button></c:if></td>
										</tr>
									</tbody>
									<thead>
										<tr>
											<td>주문시간</td>
											<td>결제상태</td>
											<c:if test="${getorders.EXCHANGE_MESSAGE ne null}">
												<td>반품사유</td>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>${getorders.ORDERSDATE}</td>
											<td>${getorders.STATUS}</td>
											<c:if test="${getorders.EXCHANGE_MESSAGE ne null}">
												<td>${getorders.EXCHANGE_MESSAGE}</td>
											</c:if>
										</tr>
									</tbody>
								</table>
								<input type="hidden" id="tekbeCompnayList" name="tekbeCompnayList" value="${getorders.TRACKING_CODE}"/>
								<input type="hidden" id="invoiceNumberText" name="invoiceNumberText" value="${getorders.TRACKING_NUMBER}"/>
							</div>
							
							
							<br>
									<br>

					
									<div>
										<table id="myPtag"></table>
									</div>
									<br/>
									<div>
										<table id="myPtag2"></table>
									</div>
									
									<br><br>

							<div class="user-data__footer" align="center">
								<button class="au-btn au-btn-load"
									onclick="location.href='/rudisfarm/my-page/orders'">목록으로</button>
								<c:choose>
									<c:when test="${getorders.STATUS eq '결제 완료'}">
										<button class="au-btn au-btn-load"
											onclick="buyFinishCheck(${getorders.ORDERS_ID})">구매확정</button>
										<button type="button" class="au-btn au-btn-load"
											onclick="deleteCheck(${getorders.ORDERS_ID}, '${tid}')">주문취소</button>
									</c:when>
									<c:when test="${getorders.STATUS eq '배송 처리'}">
										<button class="au-btn au-btn-load"
											onclick="buyFinishCheck(${getorders.ORDERS_ID})">구매확정</button>
										<button class="au-btn au-btn-load"
											onclick="location.href='/rudisfarm/my-page/my-exchange-and-cancel/${getorders.ORDERS_ID}'">교환/반품
											신청</button>
									</c:when>
									<c:when test="${getorders.STATUS eq '반품 신청'}">
										<button class="au-btn au-btn-load"
											onclick="buyFinishCheck(${getorders.ORDERS_ID})">구매확정</button>
									</c:when>
									<c:when test="${getorders.STATUS eq '교환 신청'}">
										<button class="au-btn au-btn-load"
											onclick="buyFinishCheck(${getorders.ORDERS_ID})">구매확정</button>
									</c:when>
								</c:choose>
							</div>
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
		<!-- footer-->
		<jsp:include page="/resources/bootstrap/commons/footer.jsp" />
	</div>


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
</body>
</html>
