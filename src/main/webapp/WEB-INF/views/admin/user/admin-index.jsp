<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>Admin 홈페이지</title>
	
	<!-- Fontfaces CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/font-face.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css"
		rel="stylesheet" media="all">
	
	<!-- Bootstrap CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css"
		rel="stylesheet" media="all">
	
	<!-- Vendor CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/animate.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.css"
		rel="stylesheet" media="all">
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css"
		rel="stylesheet" media="all">
	
	<!-- Main CSS-->
	<link href="<%=request.getContextPath()%>/resources/admin_bootstrap/css/theme.css"
		rel="stylesheet" media="all">
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	  google.charts.load('current', {'packages':['corechart','bar']});
      google.charts.setOnLoadCallback(drawChart);
	//총 회원수 년도별 그래프
      function drawChart() {
    	  var chartData = new google.visualization.DataTable();
 		  chartData.addColumn('string', '년도');
 		  chartData.addColumn('number', '회원수');
 	
 		  <c:forEach var="list" items="${map.userList}">
 		 chartData.addRow([String('${list.YEAR}'), parseInt('${list.COUNT}')]);
 		 </c:forEach>
 		 
        var options = {
          curveType: 'function',
          chartArea:{width:"100%",height:"100%"},
          backgroundColor: {
              fill: 'white',
              fillOpacity: 0.1
            },
       
          legend: 'none',
          hAxis: {textPosition : 'none'},
          vAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: 'white',baselineColor:'white'},
          height :115,
          fontSize: 18,
         
          series: {  
        	  0: { color: '#F0A57C',pointWidth: 5}}
    
      
        };

        var chart = new google.visualization.AreaChart(document.getElementById('curve_chart'));
        chart.draw(chartData, options);
        window.addEventListener('resize', drawChart, false);
      }
	
	//상품 년도별 그래프      
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
    	  var chartData2 = new google.visualization.DataTable();
 		  chartData2.addColumn('string', '년도');
 		  chartData2.addColumn('number', '상품수');
 	
 		  <c:forEach var="list" items="${map.productList}">
 		 chartData2.addRow([String('${list.YEAR}'), parseInt('${list.COUNT}')]);
 		 </c:forEach>
 		 
        var options = {
          chartArea:{width:"100%",height:"90%"},
          pointSize:5,
          backgroundColor: {
              fill: 'white',
              fillOpacity: 0.1
            },
       
          legend: 'none',
          hAxis: {textPosition : 'none'},
          vAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: 'white',baselineColor:'white'},
          height :115,
          fontSize: 18,
          series: { 
        	  0: { color: '#F0A57C'}}
    
      
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart2'));
        chart.draw(chartData2, options);
        window.addEventListener('resize', drawChart2, false);
      }
      
      //총 주문량 년도별 그래프
      google.charts.setOnLoadCallback(drawChart3);
      function drawChart3() {
    	  var chartData = new google.visualization.DataTable();
 		  chartData.addColumn('string', '년도');
 		  chartData.addColumn('number', '주문량');
 	
 		  <c:forEach var="list" items="${map.orderList}">
 		 chartData.addRow([String('${list.YEAR}'), parseInt('${list.COUNT}')]);
 		 </c:forEach>
 		 
        var options = {
          curveType: 'function',
          chartArea:{width:"100%",height:"100%"},
          backgroundColor: {
              fill: 'white',
              fillOpacity: 0.1
            },
       
          legend: 'none',
          hAxis: {textPosition : 'none'},
          vAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: 'white',baselineColor:'white'},
          height :115,
          pointSize:10,
          fontSize: 18,
          pointShape: 'square',
          series: {  
        	  0: { color: '#F0A57C'}
          }
    
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart3'));
        chart.draw(chartData, options);
        window.addEventListener('resize', drawChart3, false);
      }
      
      //총 매출 년도별 그래프
      google.charts.setOnLoadCallback(drawChart4);
      function drawChart4() {
    	  var chartData = new google.visualization.DataTable();
 		  chartData.addColumn('string', '년도');
 		  chartData.addColumn('number', '매출');
 	
 		  <c:forEach var="list" items="${map.PriceList}">
 		 chartData.addRow([String('${list.YEAR}'), parseInt('${list.TOTAL_PRICE}')]);
 		 </c:forEach>
 		 
        var options = {
          curveType: 'function',
          chartArea:{width:"100%",height:"100%"},
          backgroundColor: {
              fill: 'white',
              fillOpacity: 0.1
            },
       
          legend: 'none',
          hAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: 'white',baselineColor:'white'},
          vAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: 'white',baselineColor:'white'},
          height :115,
          pointSize:10,
          fontSize: 18,
          pointShape: 'square',
          series: {  
        	  0: { color: '#F0A57C'}
          }
    
        };

        var chart = new google.visualization.BarChart(document.getElementById('curve_chart4'));
        chart.draw(chartData, options);
        window.addEventListener('resize', drawChart4, false);
      }
      
      
	$(document).ready(function (){
			if ("${admin.STATUS}"=="0") {
				$('#mediumModal').modal({
					keyboard : false,
					backdrop : 'static'
					
				});
				$('#mediumModal').modal('show');//modalButton.click();
			}
	});
		//window.onload = modal();

	</script>
<style>
svg > g > g:last-child { pointer-events: none }
</style>
	
</head>

<body class="animsition" style="animation-duration: 900ms; opacity: 1;">
	<div class="page-wrapper">

		<!-- HEADER MOBILE-->
		<jsp:include page="/resources/admin_bootstrap/commons/header_mobile.jsp" />
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<jsp:include page="/resources/admin_bootstrap/commons/sidebar.jsp" />
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
		
			<!-- HEADER DESKTOP-->
			<jsp:include page="/resources/admin_bootstrap/commons/header_desktop.jsp" />
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row">
                            <div class="col-md-6 col-lg-6">
                                <div class="statistic__item">
                                    <h2 class="number"><fmt:formatNumber value="${map.userNum}" pattern="#,###,###명" /></h2>
                                    <span class="desc">총 회원 수
                                    </span>
                                    <!--<h2 class="number">${userCount}</h2>
                                    <span class="desc">총 회원 수</span>-->
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                  <div class="overview-chart" >
                                           <div id="curve_chart" style="width:100%"></div>
                                  </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <div class="statistic__item">
                                    <h2 class="number"><fmt:formatNumber value="${map.productNum}" pattern="#,###,###개" /></h2>
                                    <!--<h2 class="number">${productCount}</h2>-->
                                    <span class="desc">총 상품 수</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                    <div class="overview-chart" >
                                           <div id="curve_chart2" style="width:100%"></div>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        	<div class="col-md-6 col-lg-6">
                                <div class="statistic__item">
                                    <h2 class="number"><fmt:formatNumber value="${map.orderNum}" pattern="#,###,###회" /></h2>
                                    <!--<h2 class="number">${paymentCount}</h2>-->
                                    <span class="desc">총 구매 수량</span>
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                     <div class="overview-chart" >
                                           <div id="curve_chart3" style="width:100%"></div>
                                  </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                <div class="statistic__item">
                                    <h2 class="number"><fmt:formatNumber value="${map.totalPrice}" pattern="#,###,###원" /></h2>
                                    <span class="desc">총 매출</span>
                                    <!--<h2 class="number">${paymentTotal}&#8361;</h2>
                                    <span class="desc">올해 총 매출</span>-->
                                    <div class="icon">
                                        <i class="zmdi zmdi-money"></i>
                                    </div>
                                    <div class="overview-chart" >
                                           <div id="curve_chart4" style="width:100%"></div>
                                  </div>
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
	<div class="modal fade" id="mediumModal" tabindex="-1" role="dialog"
		aria-labelledby="mediumModalLabel" style="display: none;"
		aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="mediumModalLabel">정보 수정이 필요합니다.</h5>
					<!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button> -->
				</div>
				<div class="modal-body">
					<form action="admin-change" method="post">
						<div class="form-group">
							<label>아 이 디</label> <input class="au-input au-input--full"
								type="text" name="id" placeholder="ID" required maxlength="30"
								autofocus="autofocus">
						</div>
						<div class="form-group">
							<label>이 름</label> <input class="au-input au-input--full"
								type="text" name="name" placeholder="Name" required
								maxlength="20">
						</div>
						<div class="form-group">
							<label>이 메 일</label> <input class="au-input au-input--full"
								type="email" name="email" placeholder="E-Mail" required
								maxlength="50">
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input class="au-input au-input--full"
								type="password" name="pass" placeholder="Password" required
								maxlength="60">
						</div>
						<button class="au-btn au-btn--block au-btn--green m-b-20"
							type="submit">수정하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- Jquery JS-->
	<script src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>

	<!-- Bootstrap JS-->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>

	<!-- Vendor JS       -->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/slick/slick.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/vendor/select2/select2.min.js"></script>
	
	

	<!-- Main JS-->
	<script	src="<%=request.getContextPath()%>/resources/admin_bootstrap/js/main.js"></script>

</body>
</html>