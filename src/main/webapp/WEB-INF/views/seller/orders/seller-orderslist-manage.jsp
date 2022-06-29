<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">


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
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/table-responsive.css" type="text/css" media="all"/>
<link
	href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/theme.css"
	rel="stylesheet" media="all">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/page-number-url.js?v=<%=System.currentTimeMillis()%>"></script>	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/payment-js/search.js?v=<%=System.currentTimeMillis()%>"></script>	
</head>

<style>
#tekbeCompnayList, #invoiceNumberText {
    width: 500px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #0000ff;
    border: 1px solid #006fff;
    border-radius: 3px;
}

#tekbeCompnayName, #invoiceNumber{
  color:black; 
  font-weight: bold; 
  margin-right: 20px;
  font-size: 18px;
}

#myButton1 {
  background: #6893b0;
  background-image: -webkit-linear-gradient(top, #6893b0, #2980b9);
  background-image: -moz-linear-gradient(top, #6893b0, #2980b9);
  background-image: -ms-linear-gradient(top, #6893b0, #2980b9);
  background-image: -o-linear-gradient(top, #6893b0, #2980b9);
  background-image: linear-gradient(to bottom, #6893b0, #2980b9);
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0px;
  font-family: Arial;
  color: #ffffff;
  font-size: 20px;
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
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
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
	            			myData += ('<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>');        				
            		});
            		$("#tekbeCompnayList").html(myData);
            }
        });

		// 배송정보와 배송추적 tracking-api
        $("#myButton1").click(function() {
        	var t_code = $('#tekbeCompnayList option:selected').attr('value');
        	var t_invoice = $('#invoiceNumberText').val();
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
	            		myInvoiceData += ('<th>'+"보내는사람"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.senderName+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"제품정보"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.itemName+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"송장번호"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.invoiceNo+'</td>');     				
	            		myInvoiceData += ('</tr>');     
	            		myInvoiceData += ('<tr>');            	
	            		myInvoiceData += ('<th>'+"송장번호"+'</td>');     				
	            		myInvoiceData += ('<th>'+data.receiverAddr+'</td>');     				
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
            		header += ('<th>'+"전화번호"+'</th>');     				
        			header += ('</tr>');     
            		
            		$.each(trackingDetails,function(key,value) {
	            		myTracking += ('<tr>');            	
            			myTracking += ('<td>'+value.timeString+'</td>');
            			myTracking += ('<td>'+value.where+'</td>');
            			myTracking += ('<td>'+value.kind+'</td>');
            			myTracking += ('<td>'+value.telno+'</td>');     				
	            		myTracking += ('</tr>');        			            	
            		});
            		
            		$("#myPtag2").html(header+myTracking);
                	
                }
            });
        });
		
});


</script>

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
			
			<div class = "table-desktop">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-t-30">
							<div class="col-md-12">
								<!-- DATA TABLE-->
								<div class="table-responsive m-b-40">
								<input type="hidden" id="sort" value="${paymentPagenation.sort}">
								
									<form action="getSearchPaymentList" method="post">
								
										<br>
										<div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h3 class="title-5 m-b-35">주문 목록</h3>
								
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <thead>
                                            <tr>
                                               		<th>주문 번호</th>
                                               		<th>아이디</th>
													<th>주문 상태</th>
													<th>수량</th>
													<th>총 결제 금액</th>
													<th>주문 날짜</th>
													<th>배송 메세지</th>
													

                                            </tr>
                                        </thead>
                                        <c:forEach var="payment" items="${ordersPagenation.sellerReturnList}">
	                                        <tbody>
	                                            <tr class="tr-shadow" onclick="location.href='/rudisfarm/seller/seller-orderslist-manage/orderslistdetail/${payment.ORDERS_NAME}'" style="cursor: pointer;">
	                                                <td>${payment.ORDERS_NAME}</td>
	                                                 <td class="desc">${payment.USER_ID}</td>
	                                                <td>
	                                                    <span class="block-email">${payment.STATUS}</span>
	                                                </td>
	                                                <td class="desc">${payment.COUNT}</td>
	                                                <td class="desc">${payment.TOTAL_PRICE}</td>
	                                                <td>
	                                                    <span class="status--process">${payment.ORDERSDATE}</span>
	                                                </td>
	                                                <td>${payment.DELIVERY_MESSAGE}</td>
	                                                
	                                            </tr>
	
	                                        </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                            <br>
										
									</form>

 									<ul style = " margin: auto; width: 97%;" class="pagination">
										<c:choose>
											<c:when test="${fn:length(ordersPagenation.sellerReturnList) > 0}">
											<c:choose>
												<c:when test="${ordersPagenation.page <= 1}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-orderslist-manage?page=${ordersPagenation.page-1}">이전</a></li>
												</c:otherwise>
											</c:choose>
											
											<c:forEach var="startNum" begin="${ordersPagenation.startPage}" end="${ordersPagenation.endPage}">
												<c:choose>
													<c:when test="${startNum eq paymentPagenation.page}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-orderslist-manage?page=${startNum}">${startNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											
											<c:choose>
												<c:when test="${ordersPagenation.page ge ordersPagenation.maxPage}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-orderslist-manage?page=${ordersPagenation.endPage}">다음</a>
												</c:otherwise>
											</c:choose>
										</c:when>
											<c:otherwise>
												
											</c:otherwise>
										</c:choose>
								    </ul>
								    
									<br>
									<br>
									<br>
									<br>
									<br>

								</div>
								<!-- END DATA TABLE-->
							</div>
						</div>
					</div>
				</div>
				</div>
				
				
				
				
				
				
				<div class = "table-mobile">
					<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-t-30">
							<div class="col-md-12">
								<!-- DATA TABLE-->
								<div class="table-responsive m-b-40">
								

								<input type="hidden" id="sort" value="${paymentPagenation.sort}">
								

								
								
									<form action="getSearchPaymentList" method="post">
								
										<br>
										<div class="col-md-12">
                                <!-- DATA TABLE -->
                                <h3 class="title-5 m-b-35">주문 목록</h3>

                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <c:forEach var="payment" items="${ordersPagenation.sellerReturnList}">
	                                        <tbody>
	                                            <tr class="tr-shadow">
	                                                <td>
	                                                	주문번호<br>
	                                                	아이디<br>
	                                                	수량<br>
	                                                	총 결제 금액<br>
	                                                	주문 날짜<br>
	                                                	주문상태 <br>
	                                                	배송 메세지<br>
	                                               </td>
	                                                <td>
		                                                <a href="/rudisfarm/seller/seller-orderslist-manage/orderslistdetail/${payment.ORDERS_NAME}">${payment.ORDERS_NAME} </a><br>
		                                                <span class="desc">${payment.COUNT}</span><br>
		                                                <span class="desc">${payment.USER_ID}</span><br>
		                                                <span class="desc">${payment.TOTAL_PRICE}</span><br>
		                                                <span class="status--process">${payment.ORDERSDATE}</span><br>
		                                                <span class="block-email">${payment.STATUS}</span><br>
		                                                <span class="block-email">${payment.DELIVERY_MESSAGE}</span><br>
	                                                </td>
	                                              
	                                                
	                                            </tr>
	
	                                        </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                            </div>
                            <br>
										
									</form>

 									<ul style = " margin: auto; width: 97%;" class="pagination">
										<c:choose>
											<c:when test="${fn:length(ordersPagenation.sellerReturnList) > 0}">
											<c:choose>
												<c:when test="${ordersPagenation.page <= 1}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-orderslist-manage?page=${ordersPagenation.page-1}">이전</a></li>
												</c:otherwise>
											</c:choose>
											
											<c:forEach var="startNum" begin="${ordersPagenation.startPage}" end="${ordersPagenation.endPage}">
												<c:choose>
													<c:when test="${startNum eq paymentPagenation.page}">
														<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-orderslist-manage?page=${startNum}">${startNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											
											<c:choose>
												<c:when test="${ordersPagenation.page ge ordersPagenation.maxPage}">
													<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="/rudisfarm/seller/seller-orderslist-manage?page=${ordersPagenation.endPage}">다음</a>
												</c:otherwise>
											</c:choose>
										</c:when>
											<c:otherwise>
												
											</c:otherwise>
										</c:choose>
								    </ul>
								    
									<br>
									<br>
									<br>
									<br>
									<br>

								</div>
								<!-- END DATA TABLE-->
							</div>
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