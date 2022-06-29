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
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <meta name="description" content="au theme template">
	    <meta name="author" content="Hau Nguyen">
	    <meta name="keywords" content="au theme template">
	
	    <!-- Title Page-->
	    <title>프리미엄 회원 등록</title>
		
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
	
		<!-- js -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
		
		<script>		   
		 $(document).ready(function(){
			$("#payment-button").click(function(){
				var tmpp = $("#userOut").prop("checked");
	
		    	if(tmpp){
		    		console.log('약관에 동의함');
		    	} else {
		    		console.log('약관에 동의하지 않음');
		    		alert("먼저 약관에 동의해주십시오.");
		    		return false;
		    	}
		    	document.getElementById('premium-payment').submit();
		    	
		    });
		 })
		</script>
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
	                    <div class="container-fluid">
	                                
                   					<div class="card" >
                                    <div class="card-header"></div>
                                    <c:choose>
                                    	<c:when test="${primiumCount < 1}">
	                                    <div class="card-body">
	                                        <div class="card-title">
	                                            <h3 class="text-center title-2">프리미엄 회원</h3>
	                                        </div>
	                                        <hr>
	                                        <form action="/rudisfarm/seller/premium-payment" method="post" novalidate="novalidate" id="premium-payment">
	                                            <div class="row form-group">
	                                                <div class="col col-md-3">
	                                                    <label class=" form-control-label">판매자</label>
	                                                </div>
	                                                <div class="col-12 col-md-9">
	                                                    <p class="form-control-static">${USER_ID}</p>
	                                                </div>
	                                            </div>
	                                            
	                                            <div style="border: 1px solid rgba(0,0,0,.1)">
															<table id="outTable">
																<tr>
																	<td>
																	<strong>&nbsp; 프리미엄 판매 노출권 구매</strong>
																	<p>&nbsp; 프리미엄 표시권 구매에 앞서 유의사항을 확인해 주십시오.<br>
																		&nbsp;&nbsp;&nbsp;- 등록 시 판매자님의 상품이 프리미엄 상품칸에 표시됩니다 (100,000번).<br> 
																		&nbsp;&nbsp;&nbsp;- 상품이 표시될 때 마다 횟수가 차감되며, 0회가 될 시 상품이 더 이상 노출되지 않습니다.<br>
																		&nbsp;&nbsp;&nbsp;- 결제 시 환불은 불가능하며, 취소가 불가능합니다.<br>
																		&nbsp;&nbsp;&nbsp;- 추후 결제에 대한 문의사항이 있는 경우 따로 판매자에게 연락해주시기를 바랍니다.<br>
																		&nbsp;&nbsp;&nbsp;- 결제에 대한 금액은 9,900원 입니다.</p>
																		<br>
																	</td>
																</tr>
																<tr>
																	<td  id="tableTerms">
																	&nbsp;&nbsp;&nbsp;<label><input type="checkbox" id="userOut" name="userOut" value="red"> 명시된 루디스팜 결제 약관을 확인하였으며 이에 동의합니다.</label>
																	</td>
																</tr>										
															</table>
	                                            </div>
	                                            <br>
	                                            
	                                            <div>
	                                                <button id="payment-button" type="button" class="btn btn-lg btn-info btn-block">
	                                                    <span id="payment-button-amount">프리미엄 회원 등록</span>
	                                                </button>
	                                            </div>
	                                        </form>
	                                    </div>
	                                    </c:when>
	                                    <c:otherwise>
	                                    
	                                    <div class="card-body">
	                                        <div class="card-title">
	                                            <h3 class="text-center title-2">프리미엄 회원</h3>
	                                        </div>
	                                        <hr>
	                                        <form action="" method="post" novalidate="novalidate" id="premium-payment">
	                                            <div class="row form-group">
	                                                <div class="col col-md-3">
	                                                    <label class=" form-control-label">판매자</label>
	                                                </div>
	                                                <div class="col-12 col-md-9">
	                                                    <p class="form-control-static">${USER_ID}</p>
	                                                </div>
	                                            </div>
	                                                	남은 표시수 : ${primiumCount}
	                                            
	                                        </form>
	                                    </div>
	                                    	                                    	
	                                    </c:otherwise>
                                    </c:choose>
                                </div>
                                
                                    <table class="table table-data2">
                                        <thead>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="premium" items="${premiumList}"> 
											<tr class="tr-shadow">
	                                       		<td>
	                                       			<div class="row p-2">
	                                       				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
	                                       					<div class="row p-2">
	                                       						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
	                                       							<strong>프리미엄 결제 번호</strong><br>
		                                      						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
		                                      							${premium.PREMIUM_ID}
		                                      						</div>		                                       							
	                                       						</div>
	                                      					</div>
	                                       				</div>
	                                       				
	                                       				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
	                                       					<div class="row p-2">
	                                       						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
	                                       							<strong>결제 날짜</strong><br>
		                                      						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
		                                      							<fmt:formatDate value="${premium.START_DATE}" pattern="yyyy-MM-dd HH:mm:ss"/>
		                                      						</div>		                                       							
	                                       						</div>
	                                      					</div>
	                                       				</div>
	                                       				
	                                       			</div>
	                                       		</td>
	                                       	</tr>
                                           <tr class="spacer"></tr>		
                                           </c:forEach>									
                                        </tbody>
                                    </table>                                
	                    	</div>							
	                	</div>
	            	</div>
	        	</div>
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