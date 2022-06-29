<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now }" pattern="yyyy" var="year" />
<fmt:formatDate value="${now}" pattern="M" var="month" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>RudisFarm :: 판매자 메인</title>

    <!-- Fontfaces CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/css/font-face.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

    <!-- Bootstrap CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

    <!-- Vendor CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/animate.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link href="<%= request.getContextPath() %>/resources/admin_bootstrap/css/theme.css" rel="stylesheet" media="all">
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    google.load("visualization", "1", {packages:["bar", "corechart"]});
    
  //판매자 총 매출 연도별 그래프
    google.charts.setOnLoadCallback(PriceChart);
    function PriceChart() {
  	  var chartData = new google.visualization.DataTable();
  		  chartData.addColumn('string', '년도');
  		  chartData.addColumn('number', '매출');
  	
  		  <c:forEach var="list" items="${sellerMap.totalList}">
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
        hAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: '#8add0c',baselineColor:'#8add0c'},
        vAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: '#8add0c',baselineColor:'#8add0c'},
        height :115,
        pointSize:10,
        fontSize: 18,
        pointShape: 'square',
        series: {  
      	  0: { color: '#e9e9eb'}
        }

      };

      var chart = new google.visualization.BarChart(document.getElementById('price_chart'));
      chart.draw(chartData, options);
      window.addEventListener('resize', PriceChart, false);
    }
    
    //판매자 연도별 주문 그래프
     google.charts.setOnLoadCallback(OrderChart);
      function OrderChart() {
    	  var chartData = new google.visualization.DataTable();
 		  chartData.addColumn('string', '년도');
 		  chartData.addColumn('number', '주문량');
 	
 		  <c:forEach var="list" items="${sellerMap.orderList}">
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
          vAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: '#f24211',baselineColor:'#f24211'},
          height :115,
          pointSize:10,
          fontSize: 18,
          pointShape: 'square',
          series: {  
        	  0: { color: '#e9e9eb'}
          }
    
        };

        var chart = new google.visualization.LineChart(document.getElementById('order_chart'));
        chart.draw(chartData, options);
        window.addEventListener('resize', OrderChart, false);
      }
    
  	//판매자 연도별 상품 그래프      
      google.charts.setOnLoadCallback(ItemChart);
      function ItemChart() {
    	  var chartData2 = new google.visualization.DataTable();
 		  chartData2.addColumn('string', '년도');
 		  chartData2.addColumn('number', '상품수');
 	
 		  <c:forEach var="list" items="${sellerMap.itemList}">
 		 chartData2.addRow([String('${list.YEAR}'), parseInt('${list.COUNT}')]);
 		 console.log([String('${list.YEAR}'), parseInt('${list.COUNT}')]);
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
          vAxis: {textPosition : 'none', minorGridlines:{count:0}, gridlineColor: '#25dea0',baselineColor:'#25dea0'},
          height :115,
          fontSize: 18,
          series: { 
        	  0: { color: '#e9e9eb'}}
      
        };
        var chart = new google.visualization.LineChart(document.getElementById('item_chart'));
        chart.draw(chartData2, options);
        window.addEventListener('resize', ItemChart, false);
      }
      
  	//판매자 연도별 리뷰 그래프
      google.charts.setOnLoadCallback(ReviewChart);
        function ReviewChart() {
      	  var chartData = new google.visualization.DataTable();
   		  chartData.addColumn('string', '년도');
   		  chartData.addColumn('number', '리뷰');
   	
   		<c:forEach var="list" items="${sellerMap.reviewList}">
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
          	  0: { color: '#e9e9eb',pointWidth: 5}}
      
        
          };

          var chart = new google.visualization.AreaChart(document.getElementById('reivew_chart'));
          chart.draw(chartData, options);
          window.addEventListener('resize', ReviewChart, false);
        }
  	
    
    
  function drawChart(data){
		 var chartData = new google.visualization.DataTable();
		 var row = [];
		 chartData.addColumn('string', '상 품');
		 chartData.addColumn('number', '판매량');
      $.each(data.result, function() {
      	chartData.addRow([this.TYPE2, parseInt(this.COUNT)]);
      });
      var options = {
              bars: 'vertical',
              height :260,
              width :'100%',
      	  };
      var chart = new google.charts.Bar(document.getElementById('chart_div'));
      chart.draw(chartData, options);
      window.addEventListener('resize', function() { chart.draw(chartData, options); }, false);

      
  }
  function drawChart2(data){
		 var chartData = new google.visualization.DataTable();
		 var row = [];
		 chartData.addColumn('string', '성별');
		 chartData.addColumn('number', '판매량');
      $.each(data.result, function() {
    	  if(this.GENDER==1){
      		chartData.addRow(["남", parseInt(this.COUNT)]);
    	  }else if(this.GENDER==2) {
    		chartData.addRow(["여", parseInt(this.COUNT)]);
    	  } else {
    		chartData.addRow(["비공개", parseInt(this.COUNT)]);
    	  }
      });
      var options = {
    		  pieHole: 0.4,  // 도넛차트
    		  chartArea: {
    		    /* 차트크기 */
    		    width: '100%',
    		    height: 330
    		    },

    		  /* 전체크기 */
    		  width: 330,
    		  height: 330,

    		  /* 배경색 설정 */
            };

      var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
      chart.draw(chartData, options);
      window.addEventListener('resize', function() { chart.draw(chartData, options); }, false);

      
  }

  
	$(function() {
		$(document).ready(function(){
			var year = '<c:out value="${year}" />';
			var month = '<c:out value="${month}" />';
			$("#selectYear").val(year).prop("selected", true);
			$("#selectMonth").val(month).prop("selected", true);
			  var type= $('#selectType option:selected').val();
			
			  $.ajax({
	    			type : 'POST',         
	    			url: '${pageContext.request.contextPath}/seller/seller-index', 
	    			dataType: 'json',
	    			contentType: 'application/json; charset=utf-8;',
	    			data : JSON.stringify({
	    				 YEAR : year,
	    				 MONTH : month
	    			}),
	    			success : function(data) {
	    				if(data != false) {
	    					google.charts.setOnLoadCallback(
		    					    function() { 
		    					        drawChart(data);
		    					      });
	    				} else {
	    					document.getElementById("chart_div").innerHTML="판매된 상품이 없습니다.";
	    				}
	    			},
	    			error: function(data) {
	    				document.getElementById("chart_div").innerHTML="판매된 상품이 없습니다.";
	    			}
	    		});
		      $.ajax({
	    			type : 'POST',         
	    			url: '${pageContext.request.contextPath}/seller/seller-index/chart', 
	    			dataType: 'json',
	    			contentType: 'application/json; charset=utf-8;',
	    			data : JSON.stringify({
	    				 TYPE : type
	    				 
	    			}),
	    			success : function(data) {
	    			
	    				if(data != false) {
	    					google.charts.setOnLoadCallback(
		    					    function() { 
		    					        drawChart2(data);
		    					      });
	    				} else {
	    					document.getElementById("donutchart").innerHTML="판매된 상품이 없습니다.";
	    				}
	    				
	    				
	    			},
	    			error: function(data) {
// 	    				document.getElementById("donutchart").innerHTML="판매된 상품이 없습니다."
	    				
	    			}
	    		});
		});
        $('#selectMonth, #selectYear').change(function() {
		    var year= $('#selectYear option:selected').val();
        	var month= $('#selectMonth option:selected').val();
	
            $.ajax({
    			type : 'POST',         
    			url: '${pageContext.request.contextPath}/seller/seller-index', 
    			dataType: 'json',
    			contentType: 'application/json; charset=utf-8;',
    			data : JSON.stringify({
    				 YEAR : year,
    				 MONTH : month
    			}),
    			success : function(data) {
    			
    				if(data != false) {
    					google.charts.setOnLoadCallback(
        					    function() { 
        					        drawChart(data);
        					      });
    				} else {
    					document.getElementById("chart_div").innerHTML="판매된 상품이 없습니다.";
    				}
    				
    				
    			},
    			error: function(data) {
    				document.getElementById("chart_div").innerHTML="판매된 상품이 없습니다."
    				
    			}
    		});
        })
        
         $('#selectType').change(function() {
		    var type= $('#selectType option:selected').val();
	
            $.ajax({
    			type : 'POST',         
    			url: '${pageContext.request.contextPath}/seller/seller-index/chart', 
    			dataType: 'json',
    			contentType: 'application/json; charset=utf-8;',
    			data : JSON.stringify({
    				 TYPE : type
    				 
    			}),
    			success : function(data) {
    			
    				if(data != false) {
    					google.charts.setOnLoadCallback(
        					    function() { 
        					        drawChart2(data);
        					      });
    				} else {
    					document.getElementById("donutchart").innerHTML="판매된 상품이 없습니다.";
    				}
    				
    				
    				
    			},
    			error: function(data) {
    				document.getElementById("donutchart").innerHTML="판매된 상품이 없습니다."
    				
    			}
    		});
        })
    })
    
</script>
<style>
svg > g > g:last-child { pointer-events: none }
</style>

</head>

<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <jsp:include page="/resources/admin_bootstrap/commons/seller_header_mobile.jsp"/>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <jsp:include page="/resources/admin_bootstrap/commons/seller_sidebar.jsp"/>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <jsp:include page="/resources/admin_bootstrap/commons/seller_header_desktop.jsp"/>
            <!-- HEADER DESKTOP-->
            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                <h2 class="title-1 m-3">판매자 관리 페이지</h2>
                    <div class="container-fluid">
                        <div class="row m-t-25">
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c1">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-account-o"></i>
                                            </div>
                                            <div class="text">
                                                <h2><fmt:formatNumber value="${sellerMap.reviews}" pattern="#,###,###개" /></h2>
                                                <span>리뷰</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart" >
                                           <div id="reivew_chart" style="width:100%"></div>
                                 	 </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c2">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-tab"></i>
                                            </div>
                                            <div class="text">
                                                <h2><fmt:formatNumber value="${sellerMap.count}" pattern="#,###,###개" /></h2>
                                                <span>등록 상품</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart" >
                                           <div id="item_chart" style="width:100%"></div>
                                 	 </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c3">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-calendar-note"></i>
                                            </div>
                                            <div class="text">
                                                <h2><fmt:formatNumber value="${sellerMap.orders}" pattern="#,###,###회" /></h2>
                                                <span>주문</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart" >
                                           <div id="order_chart" style="width:100%"></div>
                                 	 </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-lg-3">
                                <div class="overview-item overview-item--c4">
                                    <div class="overview__inner">
                                        <div class="overview-box clearfix">
                                            <div class="icon">
                                                <i class="zmdi zmdi-money"></i>
                                            </div>
                                            <div class="text">
                                                <h2><fmt:formatNumber value="${sellerMap.total}" pattern="#,###,###원" /></h2>
                                                <span>판매 수익</span>
                                            </div>
                                        </div>
                                        <div class="overview-chart" >
                                           <div id="price_chart" style="width:100%"></div>
                                 	 </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="au-card recent-report">
                                    <div class="au-card-inner">
                                    	
                                        <h3 class="title-2"><span>제품별 판매량</span></h3>
                                        <div class="chart-info">
                                            <div class="chart-info__left">
                                            </div>
                                            <div class="chart-info__right">
                                                <div class="chart-statis">
                                                    <span class="index incre">
                                                    	<select name="selectYear" id="selectYear">
                                                    	<option value="${year}">${year}년</option>
                                                    	<option value="${year-1}">${year-1}년</option>
                                                    	<option value="${year-2}">${year-2}년</option>
                                                    	<option value="${year-3}">${year-3}년</option>
                                                    	<option value="${year-4}">${year-4}년</option>
                                                    	</select>
				                                       <select name="selectMonth" id="selectMonth">
									                        <option value="1">1월</option>
									                        <option value="2">2월</option>
									                        <option value="3">3월</option>
									                        <option value="4">4월</option>
									                        <option value="5">5월</option>
									                        <option value="6">6월</option>
									                        <option value="7">7월</option>
									                        <option value="8">8월</option>
									                        <option value="9">9월</option>
									                        <option value="10">10월</option>
									                        <option value="11">1 1월</option>
									                        <option value="12">12월</option>
									                    </select>
                                                       </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="recent-report__chart">
                                            <div id="chart_div"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="au-card chart-percent-card">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 tm-b-5">남/녀 총 판매량</h3>
                                        <div class="row no-gutters">
                                            <div class="col-xl-6">
                                                <div id="donutchart" ></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning">
                                     <h4>주문 목록 최신정보</h4>
                                        <thead>
                                            <tr>
                                                <th>아이디</th>
                                                <th>결제 금액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <c:forEach var="orders" items="${orderSeller}">
                                            <tr>
                                                <td>${orders.USER_ID}</td>
                                                <td>${orders.TOTAL_PRICE}</td>
                                            </tr>
                                         </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning">
                                     <h4>교환 목록 최신정보</h4>
                                        <thead>
                                            <tr>
                                                <th>아이디</th>
                                                <th>결제금액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <c:forEach var="exchange" items="${orderExchange}">
                                            <tr>
                                                <td>${exchange.USER_ID}</td>
                                                <td>${exchange.TOTAL_PRICE}</td>
                                            </tr>
                                         </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning">
                                     <h4>반품 목록 최신정보</h4>
                                        <thead>
                                            <tr>
                                                <th>아이디</th>
                                                <th>결제금액</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                         <c:forEach var="orderRetern" items="${orderReturn}">
                                            <tr>
                                                <td>${orderRetern.USER_ID}</td>
                                                <td>${orderRetern.TOTAL_PRICE}</td>
                                            </tr>
                                         </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <jsp:include page="/resources/admin_bootstrap/commons/footer.jsp"/>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/slick/slick.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/wow/wow.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/animsition/animsition.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="<%= request.getContextPath() %>/resources/admin_bootstrap/js/main.js"></script>

</body>
</html>

