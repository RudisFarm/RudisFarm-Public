<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author" content="Hau Nguyen">
<meta name="keywords" content="au theme template">

<!-- Title Page-->
<title>Dashboard</title>

<link
	href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link
	href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/animate.css"
	rel="stylesheet" media="all">
<link
	href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link
	href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.css"
	rel="stylesheet" media="all">
<link
	href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">


<!-- Fontfaces CSS-->
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/font-face.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/animate.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/theme.css"
	rel="stylesheet" media="all">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/page-number-url.js?v=<%=System.currentTimeMillis()%>"></script>
<script type="text/javascript"
	src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/search.js?v=<%=System.currentTimeMillis()%>"></script>
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


<script>
	$(document).ready(function(){
	//	console.log($('#ordersName').html() + " // " + $('#ordersStatus').html() );
		
		function updateOrdersStatus(status) {
			$.ajax({
				url: "${pageContext.request.contextPath}/seller/seller-reqreturncompleted-manage",
				type: "PUT",
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify({
						ORDERS_NAME: $('#ordersName').html(),
						EXCHANGE: status
					}),
				
				success: function(data){
					if(data.resultCode == 1) {
						alert("성공");
// 						location.reload();
						$('#ordersStatus').html(data.STATUS);
						$('#exchangeTButton').remove();
						$('#exchangeFButton').remove();
					} else {
						alert("실패");
					}
				},
				error: function(e) {
					console.log("에러 발생!");
					console.log(e);
				}
			});
		}
	
		$('#exchangeTButton').click(function(){
			console.log('교환 수락버튼 클릭시 url 이동.');
			updateOrdersStatus(true);
		});
		
		$('#exchangeFButton').click(function(){
			console.log('교환 수락버튼 클릭시 url 이동.');
			updateOrdersStatus(false);
		});
				
	});
	</script>


</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<jsp:include
			page="/resources/admin_bootstrap/commons/seller_header_mobile.jsp" />
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<jsp:include
			page="/resources/admin_bootstrap/commons/seller_sidebar.jsp" />
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include
				page="/resources/admin_bootstrap/commons/seller_header_desktop.jsp" />
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-t-30">
							<div class="col-md-12">
								<!-- DATA TABLE-->
								<div class="user-data m-b-30">
									<h3 class="title-3 m-b-30">
										<i class="zmdi zmdi-account-calendar"></i>배송 상세 내역
									</h3>
									<div class="table-responsive table-data">
										<table class="table">
											<tbody>
												<tr>
													<td>주문 번호</td>
													<td id="ordersName">${orders.ORDERS_NAME}</td>
													
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>상품명</td>
													<td id="ordersStatus">${ordersproductname.PRODUCT_NAME}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>개수/주문 금액/주문 총금액</td>
													<td>${orders.COUNT} / ${orders.PRICE} / ${orders.TOTAL_PRICE}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>교환 사유</td>
													<td>${orders.EXCHANGE_MESSAGE}</td>
													
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>요청 상태</td>
													<td id="ordersStatus">${orders.STATUS}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>주소</td>
													<td>${orders.FIR_ADDRESS}<br>${orders.SEC_ADDRESS}</td>
													
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>주문 날짜</td>
													<td id="ordersStatus">${orders.ORDERSDATE}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>택배 회사 명</td>
													<td id="ordersStatus">${orders.TRACKING_NAME}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>운송장 번호</td>
													<td id="ordersStatus">${orders.TRACKING_NUMBER}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="myButton1"> 택배 조회하기 </button></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<!-- End UserData -->
								<c:if test="${orders.TRACKING_NUMBER ne null}">
									<div class="row m-t-30">
										<div class="col-md-12">
											<div class="card">
												<div>
													<table id="myPtag"></table>
												</div>
												<br/>
												<div>
													<table id="myPtag2"></table>
												</div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>
		<input type="hidden" id="tekbeCompnayList" name="tekbeCompnayList" value=${orders.TRACKING_CODE}><br/><br/>
									
									<input type="hidden" id="invoiceNumberText" name="invoiceNumberText" value=${orders.TRACKING_NUMBER}><br/><br/>

	</div>

	<!--  	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/sort-payment.js?v=<%=System.currentTimeMillis()%>"></script>	-->

	<!-- Jquery JS-->
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js">
		
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.js">
		
	</script>

	<!-- Main JS-->
	<script
		src="<%=request.getContextPath()%>/resources/admin_bootstrap/js/main.js"></script>

</body>
</html>