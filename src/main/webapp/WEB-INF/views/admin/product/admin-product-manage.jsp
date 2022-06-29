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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="au theme template">
    <meta name="author" content="Hau Nguyen">
    <meta name="keywords" content="au theme template">

    <!-- Title Page-->
    <title>관리자 상품 관리 메인페이지</title>

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

	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/product-type.js?v=<%=System.currentTimeMillis()%>"></script>	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/sort.js?v=<%=System.currentTimeMillis()%>"></script>	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/sort-status.js?v=<%=System.currentTimeMillis()%>"></script>	
	<script type="text/javascript" src="<%= request.getContextPath() %>/resources/bootstrap/js/product-js/search.js?v=<%=System.currentTimeMillis()%>"></script>	
	<script>
		function deleteProduct(product_id){
			if(confirm("정말로 삭제 하시겠습니까?")) {
				$.ajax({
					type: 'delete',
					url: 'admin-product-manage/'+product_id, 
					dataType: 'json',
					contentType: "application/json; charset=utf-8;",
					success: function(data) {
						if(data) {
							alert("성공적으로 삭제 되었습니다.");
							location.href = window.location.href;
						} else {
							alert("삭제에 실패하였습니다.");
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

<body class="animsition">
    <div class="page-wrapper">
        <!-- HEADER MOBILE-->
        <jsp:include page="/resources/admin_bootstrap/commons/header_mobile.jsp"/>
        <!-- END HEADER MOBILE-->
		
        <!-- MENU SIDEBAR-->
        <jsp:include page="/resources/admin_bootstrap/commons/sidebar.jsp"/>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <jsp:include page="/resources/admin_bootstrap/commons/header_desktop.jsp"/>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                    
                                   <div class="row">
                                   	<div class="col-sm12 col-md-12 col-lg-12">
                                   		<div class="row">
                                   			<div class="col-3 pr-0">
		                                            <select class="form-control" name="property" id="orderby">
		                                            </select>
		                                            <div class="dropDownSelect2"></div>
	                                        <input type="hidden" value="${productPagenation.sort}" id="sort">
	                                        </div>
	                                        
	                                        <div class="col-3 pr-0">
		                                            <select class="form-control" name="time" id="TYPE1">
		                                                <option selected="selected" value="">----</option>
		                                            </select>
		                                         <div class="dropDownSelect2"></div>
												<input type="hidden" value="${productPagenation.type1}" name="TYPE1">   
	                                        </div>
										
											<div class="col-3 pr-0">
	                                            <select class="form-control" name="time" id="TYPE2">
	                                                <option selected="selected" value="">----</option>
	                                            </select>
	                                            <div class="dropDownSelect2"></div>
												<input type="hidden" value="${productPagenation.type2}" name="TYPE2">
											</div>	
											
											<div class="col-3 pl-0">
												<button class="au-btn-filter btn-block" id="search">
		                                        	<i class="zmdi zmdi-filter-list"></i>필터</button>
		                                    </div>
                                        </div>	
                                       </div>
                                   </div>
                                   <div class="row">
									<div class="col-sm12 col-md-12 col-lg-12">
                                    	<div class="row">
                                    		<div class="col-9 pr-0">
	                                    		<input type="text" placeholder="제목..." class="form-control" value="${productPagenation.keyword}" id="search-input-text" onKeypress="javascript:if(event.keyCode==13) {search_onclick_submit()}">
			                                </div>
			                                <div class="col-3 pl-0">
			                                
                                            <select class="form-control" name="type" id="orderby-status">
	                                        </select>
                                            	<div class="dropDownSelect2"></div>
                                        	<input type="hidden" value="${status}" id="status">
                                        
	                                        </div>
	                                    </div>
                                	</div>
                               	</div>                    	
								<br>
									
                          </div>
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-data2">
                                        <tbody>
											<c:choose>
					 							<c:when test="${fn:length(productPagenation.productList) > 0}">
													<c:forEach var="product" items="${productPagenation.productList}">                                        
														<tr class="tr-shadow">
			                                        		<td>
			                                        			<div class="row p-2">
			                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
			                                        					<div class="row p-2" style="cursor:pointer;" onclick="location.href='/rudisfarm/admin/admin-product-manage/${product.PRODUCT_ID}'">
			                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
			                                        							<strong>상품번호 및 제목</strong><br>${product.PRODUCT_ID}-${product.PRODUCT_NAME}
			                                        						</div>
			                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
			                                        							<strong>카테고리</strong><br>${product.TYPE1}, ${product.TYPE2}
			                                        						</div>
		                                        						</div>
			                                        				</div>
			                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
			                                        					<div class="row p-2" style="cursor:pointer;" onclick="location.href='/rudisfarm/admin/admin-product-manage/${product.PRODUCT_ID}'">
			                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
			                                        							<strong>등록 날짜</strong><br>${product.INPUTDATE}
			                                        						</div>
			                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
			                                        							<strong>조회수</strong><br>${product.VIEWCOUNT}
			                                        						</div>
			                                        					</div>
			                                        				</div>
			                                        			</div>
			                                        			<div class="row p-2">
			                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
			                                        					<div class="row p-2" style="cursor:pointer;" onclick="location.href='/rudisfarm/admin/admin-product-manage/${product.PRODUCT_ID}'">
			                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
			                                        							<strong>수량</strong><br>${product.COUNT}
			                                        						</div>
			                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
			                                        							<strong>가격</strong><br><fmt:formatNumber value="${product.PRICE}" type="number"/>원
			                                        						</div>
			                                        					</div>
			                                        				</div>
			                                        				<div class="col-sm-12 col-md-12 col-lg-6 p-1">
			                                        					<div class="row p-2">
			                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1" style="cursor:pointer;" onclick="location.href='/rudisfarm/admin/admin-product-manage/${product.PRODUCT_ID}'">
			                                        							<strong>상태</strong><br>${status}
			                                        						</div>
			                                        						<div class="col-sm-12 col-md-6 col-lg-6 p-1">
			                                        							<div class="table-data-feature">
							                                                        <button class="item" data-toggle="tooltip" data-placement="top" title="삭제" onclick="deleteProduct(${product.PRODUCT_ID})">
							                                                            <i class="zmdi zmdi-delete"></i>
							                                                        </button>
						                                                    	</div>		
			                                        						</div>
			                                        					</div>
			                                        				</div>
			                                        			</div>
			                                        		</td>
			                                        	</tr>
			                                        	
			                                            <tr class="spacer"></tr>
		                                           	</c:forEach>
		                                           	</c:when>
		                                           	
													<c:otherwise>

													</c:otherwise>		                                           	
	                                           	</c:choose>

                                        </tbody>
                                    </table>
                                </div>	
                    <div  style="margin-left: auto; margin-right: auto;">
                        <ul class="pagination" style="justify-content:center;">
						<c:choose>
							<c:when test="${fn:length(productPagenation.productList) > 0}">
							<c:choose>
								<c:when test="${productPagenation.page <= 1}">
									<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">이전</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-product-manage?page=${productPagenation.page-1}&keyword=${productPagenation.keyword}&type1=${productPagenation.type1}&type2=${productPagenation.type2}&sort=${productPagenation.sort}">이전</a></li>
								</c:otherwise>
							</c:choose>
							
							<c:forEach var="startNum" begin="${productPagenation.startPage}" end="${productPagenation.endPage}">
								<c:choose>
									<c:when test="${startNum eq productPagenation.page}">
										<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">${startNum}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-product-manage?page=${startNum}&keyword=${productPagenation.keyword}&type1=${productPagenation.type1}&type2=${productPagenation.type2}&sort=${productPagenation.sort}">${startNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:choose>
								<c:when test="${productPagenation.page ge productPagenation.maxPage}">
									<li class="page-item disabled"><a class="page-link" href="javascript:void(0)">다음</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="/rudisfarm/admin/admin-product-manage?page=${productPagenation.page+1}&keyword=${productPagenation.keyword}&type1=${productPagenation.type1}&type2=${productPagenation.type2}&sort=${productPagenation.sort}">다음</a>
								</c:otherwise>
							</c:choose>
						</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
				    </ul>           
				    </div>   
                                                         		 
                    </div>
                </div>


                
            </div>

            <!-- END MAIN CONTENT-->
            <!-- END PAGE CONTAINER-->
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