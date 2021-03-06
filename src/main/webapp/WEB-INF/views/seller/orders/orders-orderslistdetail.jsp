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


<script>
	$(document).ready(function(){
		
		function updateOrdersStatus(status) {
			$.ajax({
				url: "${pageContext.request.contextPath}/seller/seller-orderlistcompleted-manage",
				type: "PUT",
				dataType: 'json',
				contentType: "application/json; charset=utf-8;",
				data: JSON.stringify({
						ORDERS_NAME: $('#ordersName').html(),
						TRACKING_NUMBER : $('#deliverynumber').val(),
						TRACKING_NAME : $('#deliverylist').val(),
						EXCHANGE: status
					}),
				
				success: function(data){
					if(data.resultCode == 1) {
						alert("?????? ?????? ??????");
						$('#ordersStatus').html(data.STATUS);
						$('#exchangeTButton').remove();
						$('#exchangeFButton').remove();
						location.href = "/rudisfarm/seller/seller-orderslist-manage";
					} else {
						alert("??????");
					}
				},
				error: function(e) {
					console.log("?????? ??????!");
					console.log(e);
				}
			});
		}
		
		$('#exchangeTButton').click(function(){
			console.log("[exchangeTButton]");
				if($('#deliverynumber').val() == '' && $('#deliverylist').val() != '?????? ??????'){
					alert("????????? ????????? ??????????????????.");	
			      }
			    else {	
			    	
		    		console.log('?????? ?????? ?????? ????????? url ??????.');
		    		
					updateOrdersStatus(true);
		            
		    }
			
		});
		
		$('#exchangeFButton').click(function(){
			console.log('?????? ???????????? ????????? url ??????.');
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
										<i class="zmdi zmdi-account-calendar"></i>?????? ?????? ??????
									</h3>
									<div class="table-responsive table-data">
										<table class="table">
											<tbody>
												<tr>
													<td>?????? ??????</td>
													<td id="ordersName">${orders.ORDERS_NAME}</td>
													
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>?????????</td>
													<td>${ordersproductname.PRODUCT_NAME}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>??????/?????? ??????/?????? ?????????</td>
													<td>${orders.COUNT} / ${orders.PRICE} / ${orders.TOTAL_PRICE}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>?????? ??????</td>
													<td>${orders.EXCHANGE_MESSAGE}</td>
													
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>?????? ??????</td>
													<td id="ordersStatus">${orders.STATUS}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>??????</td>
													<td>${orders.FIR_ADDRESS}<br>${orders.SEC_ADDRESS}</td>
													
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>?????? ??????</td>
													<td id="ordersStatus">${orders.ORDERSDATE}</td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td>?????? ??????</td>
													<td><select name="deliverylist" id="deliverylist">
														<option value="?????? ??????">?????? ??????</option>
													    <option value="CJ????????????">CJ ?????? ??????</option>
													    <option value="????????????">?????? ??????</option>
													    <option value="????????????">?????? ??????</option>
													    <option value="???????????????">????????? ??????</option>
													    <option value="????????????">?????? ??????</option>
													    <option value="????????????">?????? ??????</option>
													    <option value="????????????">?????? ??????</option>
													    <option value="????????????">?????? ??????</option>
													    <option value="CU???????????????">CU ????????? ??????</option>
													    <option value="GSPostbox??????">GS Postbox ??????</option>
													    <option value="FedEx">FedEx</option>
													</select></td>
												</tr>
											</tbody>
											<tbody>
												<tr>
													<td><br>????????? ??????</td>
													<td>
													<input class="au-input au-input--full" type="text" name="deliverynumber" id="deliverynumber" placeholder="????????? ??????" >
													<br><div style = "color : red;">??? ?????? ?????????????????? ????????????</div>
													</td>
												</tr>
											</tbody>
											


										</table>
									</div>
									<div class="user-data__footer">
										<!--  <button class="au-btn au-btn-load" onclick="location.href='../seller-reqexchangecompleted-manage/${orders.ORDERS_NAME}'">?????? ??????</button>-->
										<button class="au-btn au-btn-load" id="exchangeTButton">?????? ??????</button>&nbsp;
								<!-- 	<button class="au-btn au-btn-load" id="exchangeFButton">?????? ??????</button> -->
									</div>


								</div>
								<!-- End UserData -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>

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